function GetHex(_coordinateX, _coordinateY){
	
	for (var i = 0; i < ds_list_size(global.Hexes); i++) {	
		
		var hex = global.Hexes[|i];
		
		if (hex.Coordinate[?X] == _coordinateX && 
			hex.Coordinate[?Y] == _coordinateY)
		{
			return hex;		
		}
		
	}

	return pointer_null;
}