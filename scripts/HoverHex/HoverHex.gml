function HoverHex(_hex){
	_hex.sprite_index = grid_hex_white_border;	
	_hex.layer = layer_get_id("Instances");
	
	for (var key = ds_map_find_first(_hex.Neighbors); !is_undefined(key); key = ds_map_find_next(_hex.Neighbors, key)) 
	{
		var neighborCoordinate = _hex.Neighbors[? key];
		var neighborHex = GetHex(neighborCoordinate[?X], neighborCoordinate[?Y]);
		neighborHex.sprite_index = grid_hex_white_border;	
		neighborHex.layer = layer_get_id("Instances");
	}	
}