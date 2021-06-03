#macro TileContent_Type "Type"
#macro TileContent_SubContent "SubContent"

function GetTileContent(type, isCentre){

	if (isCentre == undefined)
	{
		isCentre = false;	
	}

	var tileContent = ds_map_create();

	ds_map_add(tileContent, TileContent_Type, Content_Empty);
	ds_map_add(tileContent, TileContent_SubContent, pointer_null);

	tileContent[?TileContent_Type] = type;
	
	switch (type)
	{
		case Content_Forest:
			
			var subContent = ds_map_create();
	
			if (isCentre)
			{
				ds_map_add(subContent, ContentSubPosition_NorthWest, true);
				ds_map_add(subContent, ContentSubPosition_North, true);
				ds_map_add(subContent, ContentSubPosition_NorthEast, true);
				ds_map_add(subContent, ContentSubPosition_SouthWest, true);
				ds_map_add(subContent, ContentSubPosition_SouthEast, true);
			}
			else
			{
				ds_map_add(subContent, ContentSubPosition_Inner, true);
	
				ds_map_add(subContent, ContentSubPosition_CentreClockwise, true);
				ds_map_add(subContent, ContentSubPosition_CentreAntiClockwise, true);
	
				ds_map_add(subContent, ContentSubPosition_OuterClockwise, pointer_null);
				ds_map_add(subContent, ContentSubPosition_OuterCentre, pointer_null);
				ds_map_add(subContent, ContentSubPosition_OuterAntiClockwise,  pointer_null);
			}
	
			tileContent[?TileContent_SubContent] = subContent;
			break;
	}

	return tileContent;
}