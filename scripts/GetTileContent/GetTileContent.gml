#macro Resource_Available "Available"
#macro Resource_Taken "Taken"

function GetTileContent(type, isCentre){

	if (isCentre == undefined)
	{
		isCentre = false;	
	}

	var tileContent = {
		Type: type,
		SubContent: pointer_null,
		AvailableResources: function()
        {
            var availableResources = 0;

			for (var key = ds_map_find_first(SubContent); !is_undefined(key); key = ds_map_find_next(SubContent, key)) 
			{
				var subContent = SubContent[?key];
                //if (subContent != pointer_null && subContent == true)
				if (subContent == Resource_Available)
                {
                    availableResources++;
                }
            }

            return availableResources;
        },
		TakeResource: function()
		{
            // Get all the sub-content with a true value...
			var availableSubContentKeys = ds_list_create();
			
			for (var key = ds_map_find_first(SubContent); !is_undefined(key); key = ds_map_find_next(SubContent, key)) 
			{
				var subContent = SubContent[?key];
				
				//if (subContent == pointer_null || subContent == false)
				if (subContent != Resource_Available)
				{
					continue;
				}
				
				ds_list_add(availableSubContentKeys, key);
			}
			
            // Shuffle the list to make it more organic looking...
            ds_list_shuffle(availableSubContentKeys);
			
            // Take the resource by setting the value to false.
            SubContent[?availableSubContentKeys[|0]] = Resource_Taken;
		}

	};

	switch (type)
	{
		case Content_Forest:
			
			var subContent = ds_map_create();
	
			if (isCentre)
			{
				ds_map_add(subContent, ContentSubPosition_NorthWest, Resource_Available);
				ds_map_add(subContent, ContentSubPosition_North, Resource_Available);
				ds_map_add(subContent, ContentSubPosition_NorthEast, Resource_Available);
				ds_map_add(subContent, ContentSubPosition_SouthWest, Resource_Available);
				ds_map_add(subContent, ContentSubPosition_SouthEast, Resource_Available);
			}
			else
			{
				ds_map_add(subContent, ContentSubPosition_Inner, Resource_Available);
	
				ds_map_add(subContent, ContentSubPosition_CentreClockwise, Resource_Available);
				ds_map_add(subContent, ContentSubPosition_CentreAntiClockwise, Resource_Available);
	
				ds_map_add(subContent, ContentSubPosition_OuterClockwise, pointer_null);
				ds_map_add(subContent, ContentSubPosition_OuterCentre, pointer_null);
				ds_map_add(subContent, ContentSubPosition_OuterAntiClockwise,  pointer_null);
			}
	
			tileContent.SubContent = subContent;
			break;
	}

	return tileContent;
}