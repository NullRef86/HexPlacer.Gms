function NewRandomContentSet(){

	var content = ds_map_create();
	
	ds_map_copy(content, global.HexContentTemplate);

	content[?ContentPosition_Centre] = GetRandomTileContent(true);
	content[?ContentPosition_NorthWest] = GetRandomTileContent(false);
	content[?ContentPosition_North] = GetRandomTileContent(false);
	content[?ContentPosition_NorthEast] = GetRandomTileContent(false);
	content[?ContentPosition_SouthWest] = GetRandomTileContent(false);
	content[?ContentPosition_South] = GetRandomTileContent(false);
	content[?ContentPosition_SouthEast] = GetRandomTileContent(false);

	return content;
	
}