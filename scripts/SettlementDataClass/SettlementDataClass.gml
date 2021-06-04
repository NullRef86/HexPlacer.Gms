function SettlementDataClass() constructor
{
	Centre = pointer_null;
	
    static HasResources = function(hex, target)
    {
        hasResources = function(hex, target, totalAvailable, checkedTileIds)
        {
            // This is a breakout clause to prevent infinite loops
            if (ds_list_find_index(checkedTileIds, hex.Coordinate) != -1)
            {
                return false;
            }
            ds_list_add(checkedTileIds, hex.Coordinate);

            // Check to see if there's any available on this tile...			
			for (var key = ds_map_find_first(hex.Content); !is_undefined(key); key = ds_map_find_next(hex.Content, key)) 
			{
				var content = hex.Content[?key];
				
                if (content.Type == Content_Forest)
                {
                    totalAvailable += content.AvailableResources();
                    if (totalAvailable >= target)
                    {
                        return true;
                    }
                }
            }

            // Then, check all neighbouring tiles, recursively, to grab a random, suitable, tile content space...	
			var neighboringHexes = ds_list_create();
			
			for (var key = ds_map_find_first(hex.Neighbors); !is_undefined(key); key = ds_map_find_next(hex.Neighbors, key)) 
			{
				var neighboringCoordinate = hex.Neighbors[?key];
				var neighboringHex = GetHex(neighboringCoordinate.X, neighboringCoordinate.Y);
				
				if (ds_map_size(neighboringHex.Content) == 0)
				{
					continue;
				}
				
				ds_list_add(neighboringHexes, neighboringHex);
			}
			
            // Shuffle the list to make it more organic looking...
            ds_list_shuffle(neighboringHexes);

			for (var i = 0; i < ds_list_size(neighboringHexes); i++)
			{
				var neighboringHex = neighboringHexes[|i];
                if (hasResources(neighboringHex, target, totalAvailable, checkedTileIds))
                {
                    return true;
                }
            }

            return false;
        }
		
        var totalAvailable = 0;
        var checkedTileIds = ds_list_create();

        return hasResources(hex, target, totalAvailable, checkedTileIds);
    }

    static TakeResources = function(hex, remainingCost)
    {
        takeResources = function(hex, remainingCost, checkedTileIds)
        {
            // This is a breakout clause to prevent infinite loops
            if (ds_list_find_index(checkedTileIds, hex.Coordinate) != -1)
            {
                return remainingCost;
            }
            ds_list_add(checkedTileIds, hex.Coordinate);

            // Take from this tile, if applicable...		
			for (var key = ds_map_find_first(hex.Content); !is_undefined(key); key = ds_map_find_next(hex.Content, key)) 
			{
				var content = hex.Content[?key];
				
                if (content.Type == Content_Forest)
                {
                    while (content.AvailableResources() != 0)
                    {
                        content.TakeResource();
                        remainingCost--;
                        if (remainingCost <= 0)
                        {
                            return remainingCost;
                        }
                    }
                }
            }

            // Then, check all neighbouring tiles, recursively, to grab a random, suitable, tile content space...
            var neighboringHexes = ds_list_create();
			
			for (var key = ds_map_find_first(hex.Neighbors); !is_undefined(key); key = ds_map_find_next(hex.Neighbors, key)) 
			{
				var neighboringCoordinate = hex.Neighbors[?key];
				var neighboringHex = GetHex(neighboringCoordinate.X, neighboringCoordinate.Y);
				
				if (ds_map_size(neighboringHex.Content) == 0)
				{
					continue;
				}
				
				ds_list_add(neighboringHexes, neighboringHex);
			}
			
            // Shuffle the list to make it more organic looking...
            ds_list_shuffle(neighboringHexes);

			for (var i = 0; i < ds_list_size(neighboringHexes); i++)
			{
				var neighboringHex = neighboringHexes[|i];
                remainingCost = takeResources(neighboringHex, remainingCost, checkedTileIds);

                if (remainingCost <= 0)
                {
                    return remainingCost;
                }
            }
        }
		
        var checkedTileIds = ds_list_create();

        takeResources(hex, remainingCost, checkedTileIds);
    }

	static TryBuildHouse = function()
	{
		
		show_debug_message("Trying to build a house");
		
		var cost = 4;

        // Start by looking at the campfire tile
        var campfireTile = Centre;

        if (!HasResources(campfireTile, cost))// ||
            //HouseCount >= MaxHouseCount)
        {
            return;
        }

		getFreeSpace = function(hex)
        {
            getFreeSpaceRecurively = function(hex, checkedTileIds)
            {
	            // This is a breakout clause to prevent infinite loops
	            if (ds_list_find_index(checkedTileIds, hex.Coordinate) != -1)
	            {
	                return false;
	            }
	            ds_list_add(checkedTileIds, hex.Coordinate);

                // Check to see if there's any grass spaces...
				for (var key = ds_map_find_first(hex.Content); !is_undefined(key); key = ds_map_find_next(hex.Content, key)) 
				{
					var content = hex.Content[?key];
					if (content.Type == Content_Empty)
					{
						return content;	
					}
				}

                // Then check to see if there's any empty resource spaces...
				for (var key = ds_map_find_first(hex.Content); !is_undefined(key); key = ds_map_find_next(hex.Content, key)) 
				{
					var content = hex.Content[?key];
					if (content.Type == Content_Forest && 
						content.AvailableResources() == 0)
					{
						return content;	
					}
				}

	            // Finally, check all neighbouring tiles, recursively, to grab a random, suitable, tile content space...	
				var neighboringHexes = ds_list_create();
			
				for (var key = ds_map_find_first(hex.Neighbors); !is_undefined(key); key = ds_map_find_next(hex.Neighbors, key)) 
				{
					var neighboringCoordinate = hex.Neighbors[?key];
					var neighboringHex = GetHex(neighboringCoordinate.X, neighboringCoordinate.Y);
				
					if (ds_map_size(neighboringHex.Content) == 0)
					{
						continue;
					}
				
					ds_list_add(neighboringHexes, neighboringHex);
				}
			
	            // Shuffle the list to make it more organic looking...
	            ds_list_shuffle(neighboringHexes);

				for (var i = 0; i < ds_list_size(neighboringHexes); i++)
				{
					var neighboringHex = neighboringHexes[|i];
                    var freeSpaceContent = getFreeSpaceRecurively(neighboringHex, checkedTileIds);

                    if (freeSpaceContent != pointer_null)
                    {
                        return freeSpaceContent;
                    }
                }

                // I'm not sure if it's likely to get it here...
                return pointer_null;
            }
			
            var checkedTileIds = ds_list_create();

            return getFreeSpaceRecurively(hex, checkedTileIds);

            // --------------------

        }

        var freeSpace = getFreeSpace(campfireTile);

        if (freeSpace == pointer_null)
        {
            // No space
            return;
        }

        TakeResources(campfireTile, cost);

        freeSpace.Type = Content_House;
	}
	
}