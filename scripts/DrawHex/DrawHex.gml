function DrawHex(content, alpha){

	if (alpha == undefined)
	{
		alpha = 1;	
	}

	draw_sprite_ext(spr_Hex_Grass, 0, x, y, 1, 1, 0, c_white, alpha);		
	
	var positionX = x - 23;
	var positionY = y - 14;
	
	switch (content[?ContentPosition_NorthWest][?TileContent_Type])
	{
		case Content_Forest:
			var subContent = content[?ContentPosition_NorthWest][?TileContent_SubContent];
			
			DrawTree(positionX, positionY - 18, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(positionX - 6, positionY - 6, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(positionX - 13, positionY + 5, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
			DrawTree(positionX - 5, positionY + 7, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(positionX + 5, positionY - 7, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(positionX + 7, positionY + 5, subContent[?ContentSubPosition_Inner], alpha);
			break;
		case Content_Campfire:		
			DrawCampfire(positionX, positionY, alpha);
			break;
	}
	
	positionX = x + 1;
	positionY = y - 28;
		
	switch (content[?ContentPosition_North][?TileContent_Type])
	{
		case Content_Forest:
			var subContent = content[?ContentPosition_North][?TileContent_SubContent];
			
			DrawTree(positionX + 15, positionY - 9, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(positionX + 2, positionY - 9, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(positionX - 12, positionY - 9, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
			DrawTree(positionX - 9, positionY, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(positionX + 9, positionY, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(positionX, positionY + 9, subContent[?ContentSubPosition_Inner], alpha);
			break;
		case Content_Campfire:		
			DrawCampfire(positionX, positionY, alpha);
			break;
	}
	
	positionX = x + 24;
	positionY = y - 14;
		
	switch (content[?ContentPosition_NorthEast][?TileContent_Type])
	{
		case Content_Forest:
			var subContent = content[?ContentPosition_NorthEast][?TileContent_SubContent];
			
			DrawTree(positionX + 17, positionY + 10, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(positionX + 8, positionY - 4, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(positionX + 2, positionY - 17, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
			DrawTree(positionX - 5, positionY - 7, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(positionX + 5, positionY + 7, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(positionX - 7, positionY + 5, subContent[?ContentSubPosition_Inner], alpha);
			break;
		case Content_Campfire:		
			DrawCampfire(positionX, positionY, alpha);
			break;
	}
		
	switch (content[?ContentPosition_Centre][?TileContent_Type])
	{
		case Content_Forest:
			var subContent = content[?ContentPosition_Centre][?TileContent_SubContent];
			
			DrawTree(x + 1, y - 9, subContent[?ContentSubPosition_North], alpha);
			DrawTree(x - 7, y - 2, subContent[?ContentSubPosition_NorthWest], alpha);
			DrawTree(x + 9, y - 2, subContent[?ContentSubPosition_NorthEast], alpha);
			DrawTree(x - 5, y + 8, subContent[?ContentSubPosition_SouthWest], alpha);
			DrawTree(x + 6, y + 9, subContent[?ContentSubPosition_SouthEast], alpha);
			break;
		case Content_Campfire:		
			DrawCampfire(x, y, alpha);
			break;
	}
		
	positionX = x - 23;
	positionY = y + 14;
		
	switch (content[?ContentPosition_SouthWest][?TileContent_Type])
	{
		case Content_Forest:
			var subContent = content[?ContentPosition_SouthWest][?TileContent_SubContent];
			
			DrawTree(positionX + 7, positionY - 5, subContent[?ContentSubPosition_Inner], alpha);
			DrawTree(positionX + 5, positionY + 7, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(positionX - 5, positionY - 7, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(positionX - 17, positionY - 10, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(positionX - 8, positionY + 4, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(positionX - 2, positionY + 17, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
			break;
		case Content_Campfire:		
			DrawCampfire(positionX, positionY, alpha);
			break;
	}
	
	positionX = x + 1;
	positionY = y + 28;
		
	switch (content[?ContentPosition_South][?TileContent_Type])
	{
		case Content_Forest:	
			var subContent = content[?ContentPosition_South][?TileContent_SubContent];
			
			DrawTree(positionX, positionY - 9, subContent[?ContentSubPosition_Inner], alpha);
			DrawTree(positionX + 9, positionY, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(positionX - 9, positionY, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(positionX - 15, positionY + 9, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(positionX - 2, positionY + 9, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(positionX + 12, positionY + 9, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
			break;
		case Content_Campfire:		
			DrawCampfire(positionX, positionY, alpha);
			break;
	}
		
	positionX = x + 24;
	positionY = y + 14;
		
	switch (content[?ContentPosition_SouthEast][?TileContent_Type])
	{
		case Content_Forest:	
			var subContent = content[?ContentPosition_SouthEast][?TileContent_SubContent];
			
			DrawTree(positionX - 7, positionY - 5, subContent[?ContentSubPosition_Inner], alpha);
			DrawTree(positionX + 5, positionY - 7, subContent[?ContentSubPosition_CentreClockwise], alpha);
			DrawTree(positionX - 5, positionY + 7, subContent[?ContentSubPosition_CentreAntiClockwise], alpha);
			DrawTree(positionX, positionY + 18, subContent[?ContentSubPosition_OuterClockwise], alpha);
			DrawTree(positionX + 6, positionY + 6, subContent[?ContentSubPosition_OuterCentre], alpha);
			DrawTree(positionX + 13, positionY - 5, subContent[?ContentSubPosition_OuterAntiClockwise], alpha);
			break;
		case Content_Campfire:		
			DrawCampfire(positionX, positionY, alpha);
			break;
	}		
}