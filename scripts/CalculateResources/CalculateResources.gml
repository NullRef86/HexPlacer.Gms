// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CalculateResources(hex){
	show_debug_message("Calculating resources for: " + string(hex.Coordinate[?X]) + ":" + string(hex.Coordinate[?Y]) + "...");
	
	for (var key = ds_map_find_first(hex.Content); !is_undefined(key); key = ds_map_find_next(hex.Content, key)) 
	{
		var subContent = hex.Content[? key];
		
        if (key == ContentPosition_Centre)
        {
            continue;
        }

		if (subContent == Content_Empty)
		{
			continue;	
		}

        //// For any content that isn't a plot...
        //if (position.Value.Type != TileContentType.Plot)
        //{
        //    // And the neighboring content is a plot...
        //    var neighborContent = GetNeighboringContentForPosition(position.Key);
        //    if (neighborContent?.Type == TileContentType.Plot)
        //    {
        //        // Then this action breaks the farm potential
        //        neighborContent.Type = TileContentType.WastedPlot;
        //    }
        //}

        //switch (position.Value.Type)
        //{
        //    case TileContentType.Forest:
        //        var forest = position.Value;

                var adjacentContent = ds_map_create();// new Dictionary<ContentSubPosition, TileContent>();

                switch (key)
                {
                    case ContentPosition_NorthWest:
                        AddOuterAdjacentContent(adjacentContent, hex, HexPosition_NorthWest, ContentPosition_SouthEast);
                        break;
                    case ContentPosition_North:
                        AddOuterAdjacentContent(adjacentContent, hex, HexPosition_North, ContentPosition_South);
                        break;
                    case ContentPosition_NorthEast:
                        AddOuterAdjacentContent(adjacentContent, hex, HexPosition_NorthEast, ContentPosition_SouthWest);
                        break;
                    case ContentPosition_SouthEast:
                        AddOuterAdjacentContent(adjacentContent, hex, HexPosition_SouthEast, ContentPosition_NorthWest);
                        break;
                    case ContentPosition_South:
                        AddOuterAdjacentContent(adjacentContent, hex, HexPosition_South, ContentPosition_North);
                        break;
                    case ContentPosition_SouthWest:
                        AddOuterAdjacentContent(adjacentContent, hex, HexPosition_SouthWest, ContentPosition_NorthEast);
                        break;
                }


				for (var adjacentContentKey = ds_map_find_first(adjacentContent); !is_undefined(adjacentContentKey); adjacentContentKey = ds_map_find_next(adjacentContent, adjacentContentKey)) 
                //foreach (var entry in adjacentContent)
                {
					var entry = adjacentContent[?adjacentContentKey];
					
                    //// Only consider forests at the moment...
                    //if (entry.Value.Type != TileContentType.Forest)
                    //{
                    //    continue;
                    //}

                    if (ds_map_exists(subContent, adjacentContentKey) && subContent[?adjacentContentKey] != pointer_null)
                    {
                        // If it's already had a value, we don't want to reset it.
                        continue;
                    }

                    subContent[?adjacentContentKey] = true;
                }
                //break;
        //}
    }
	
}