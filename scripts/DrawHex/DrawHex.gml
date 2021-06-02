// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawHex(content, alpha){

	if (alpha == undefined)
	{
		alpha = 1;	
	}

	draw_sprite_ext(grass_tile, 0, x, y, 1, 1, 0, c_white, alpha);	
	
	if (ds_map_exists(content, ContentPosition_NorthWest))
	{
		switch (content[?ContentPosition_NorthWest])
		{
			case Content_Forest:
				draw_sprite_ext(tree, 0, x - 23, y - 14, 1, 1, 0, c_white, alpha);	
				break;			
		}	
	}
	if (ds_map_exists(content, ContentPosition_North))
	{
		switch (content[?ContentPosition_North])
		{
			case Content_Forest:
				draw_sprite_ext(tree, 0, x + 1, y - 28, 1, 1, 0, c_white, alpha);	
				break;			
		}	
	}
	if (ds_map_exists(content, ContentPosition_NorthEast))
	{
		switch (content[?ContentPosition_NorthEast])
		{
			case Content_Forest:
				draw_sprite_ext(tree, 0, x  + 24, y - 14, 1, 1, 0, c_white, alpha);	
				break;			
		}	
	}
	
	if (ds_map_exists(content, ContentPosition_Centre))
	{
		switch (content[?ContentPosition_Centre])
		{
			case Content_Forest:
				draw_sprite_ext(tree, 0, x, y, 1, 1, 0, c_white, alpha);	
				break;	
			case Content_Campfire:
				draw_sprite_ext(campfire, 0, x, y, 0.125, 0.125, 0, c_white, alpha);	
				break;			
		}	
	}
	
	if (ds_map_exists(content, ContentPosition_SouthWest))
	{
		switch (content[?ContentPosition_SouthWest])
		{
			case Content_Forest:
				draw_sprite_ext(tree, 0, x - 23, y + 14, 1, 1, 0, c_white, alpha);	
				break;			
		}	
	}
	if (ds_map_exists(content, ContentPosition_South))
	{
		switch (content[?ContentPosition_South])
		{
			case Content_Forest:
				draw_sprite_ext(tree, 0, x + 1, y + 28, 1, 1, 0, c_white, alpha);	
				break;			
		}	
	}
	if (ds_map_exists(content, ContentPosition_SouthEast))
	{
		switch (content[?ContentPosition_SouthEast])
		{
			case Content_Forest:
				draw_sprite_ext(tree, 0, x  + 24, y + 14, 1, 1, 0, c_white, alpha);	
				break;			
		}	
	}
	
	
}