// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawHex(content, alpha){

	if (alpha == undefined)
	{
		alpha = 1;	
	}

	draw_sprite_ext(grass_tile, 0, x, y, 1, 1, 0, c_white, alpha);	
	//draw_sprite_ext(tree, 0, x - 23, y - 14, 1, 1, 0, c_white, alpha);	
	//draw_sprite_ext(campfire, 0, x, y, 0.125, 0.125, 0, c_white, alpha);	
	
	if (ds_map_exists(content, ContentPosition_NorthWest))
	{
		var subContent = content[?ContentPosition_NorthWest];
		
		if (subContent != Content_Empty)
		{		
			var subX = x - 23;
			var subY = y - 14;
		
			DrawTree(subX, subY - 18, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(subX - 6, subY - 6, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(subX - 13, subY + 5, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
			DrawTree(subX - 5, subY + 7, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(subX + 5, subY - 7, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(subX + 7, subY + 5, subContent[?ContentSubPosition_Inner], alpha);
		}
	}
	if (ds_map_exists(content, ContentPosition_North))
	{
		var subContent = content[?ContentPosition_North];
		
		if (subContent != Content_Empty)
		{		
			var subX = x + 1;
			var subY = y - 28;
		
			DrawTree(subX + 15, subY - 9, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(subX + 2, subY - 9, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(subX - 12, subY - 9, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
			DrawTree(subX - 9, subY, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(subX + 9, subY, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(subX, subY + 9, subContent[?ContentSubPosition_Inner], alpha);
		}
	}
	if (ds_map_exists(content, ContentPosition_NorthEast))
	{
		var subContent = content[?ContentPosition_NorthEast];
		
		if (subContent != Content_Empty)
		{		
			var subX = x + 24;
			var subY = y - 14;
		
			DrawTree(subX + 17, subY + 10, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(subX + 8, subY - 4, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(subX + 2, subY - 17, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
			DrawTree(subX - 5, subY - 7, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(subX + 5, subY + 7, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(subX - 7, subY + 5, subContent[?ContentSubPosition_Inner], alpha);
		}
	}
	
	if (ds_map_exists(content, ContentPosition_Centre))
	{
		var subContent = content[?ContentPosition_Centre];
		
		if (subContent != Content_Empty)
		{		
			DrawTree(x + 1, y - 9, subContent[?ContentSubPosition_North], alpha);
			DrawTree(x - 7, y - 2, subContent[?ContentSubPosition_NorthWest], alpha);
			DrawTree(x + 9, y - 2, subContent[?ContentSubPosition_NorthEast], alpha);
			DrawTree(x - 5, y + 8, subContent[?ContentSubPosition_SouthWest], alpha);
			DrawTree(x + 6, y + 9, subContent[?ContentSubPosition_SouthEast], alpha);
		}
	}
	
	if (ds_map_exists(content, ContentPosition_SouthWest))
	{
		var subContent = content[?ContentPosition_SouthWest];
		
		if (subContent != Content_Empty)
		{		
			var subX = x - 23;
			var subY = y + 14;
		
			DrawTree(subX + 7, subY - 5, subContent[?ContentSubPosition_Inner], alpha);
			DrawTree(subX + 5, subY + 7, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(subX - 5, subY - 7, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(subX - 17, subY - 10, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(subX - 8, subY + 4, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(subX - 2, subY + 17, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
		}
	}
	if (ds_map_exists(content, ContentPosition_South))
	{
		var subContent = content[?ContentPosition_South];
		
		if (subContent != Content_Empty)
		{		
			var subX = x + 1;
			var subY = y + 28;
		
			DrawTree(subX, subY - 9, subContent[?ContentSubPosition_Inner], alpha);
			DrawTree(subX + 9, subY, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(subX - 9, subY, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(subX - 15, subY + 9, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(subX - 2, subY + 9, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(subX + 12, subY + 9, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
		}
		
	}
	if (ds_map_exists(content, ContentPosition_SouthEast))
	{
		var subContent = content[?ContentPosition_SouthEast];
		
		if (subContent != Content_Empty)
		{		
			var subX = x + 24;
			var subY = y + 14;
		
			DrawTree(subX - 7, subY - 5, subContent[?ContentSubPosition_Inner], alpha);
			DrawTree(subX + 5, subY - 7, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(subX - 5, subY + 7, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(subX, subY + 18, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(subX + 6, subY + 6, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(subX + 13, subY - 5, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
		}
	}
	
	
}