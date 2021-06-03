function CalculateResources(hex){
	
	for (var contentPositionKey = ds_map_find_first(hex.Content); !is_undefined(contentPositionKey); contentPositionKey = ds_map_find_next(hex.Content, contentPositionKey)) 
	{
		var tileContent = hex.Content[? contentPositionKey];
		
        if (contentPositionKey == ContentPosition_Centre)
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

        switch (tileContent[?TileContent_Type])
        {
            case Content_Forest:
                var subContent = tileContent[?TileContent_SubContent];

                var adjacentContent = ds_map_create();

                switch (contentPositionKey)
                {
                    case ContentPosition_NorthWest:
                        AddOuterAdjacentContent(adjacentContent, hex, subContent, HexPosition_NorthWest, ContentPosition_SouthEast);
                        break;
                    case ContentPosition_North:
                        AddOuterAdjacentContent(adjacentContent, hex, subContent, HexPosition_North, ContentPosition_South);
                        break;
                    case ContentPosition_NorthEast:
                        AddOuterAdjacentContent(adjacentContent, hex, subContent, HexPosition_NorthEast, ContentPosition_SouthWest);
                        break;
                    case ContentPosition_SouthEast:
                        AddOuterAdjacentContent(adjacentContent, hex, subContent, HexPosition_SouthEast, ContentPosition_NorthWest);
                        break;
                    case ContentPosition_South:
                        AddOuterAdjacentContent(adjacentContent, hex, subContent, HexPosition_South, ContentPosition_North);
                        break;
                    case ContentPosition_SouthWest:
                        AddOuterAdjacentContent(adjacentContent, hex, subContent, HexPosition_SouthWest, ContentPosition_NorthEast);
                        break;
                }

				for (var adjacentContentKey = ds_map_find_first(adjacentContent); !is_undefined(adjacentContentKey); adjacentContentKey = ds_map_find_next(adjacentContent, adjacentContentKey)) 
                {
					var entry = adjacentContent[?adjacentContentKey];
					
                    // Only consider forests at the moment...
                    if (entry[?TileContent_Type] != Content_Forest)
                    {
                        continue;
                    }

                    if (ds_map_exists(subContent, adjacentContentKey) && subContent[?adjacentContentKey] != pointer_null)
                    {
                        // If it's already had a value, we don't want to reset it.
                        continue;
                    }

                    subContent[?adjacentContentKey] = true;
                }
                break;
        }
    }
	
}