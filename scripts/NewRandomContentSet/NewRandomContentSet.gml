// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewRandomContentSet(){

	var content = ds_map_create();
	
	ds_map_copy(content, global.HexContentTemplate);

	content[?ContentPosition_Centre] = GetRandomHexContent(true);
	content[?ContentPosition_NorthWest] = GetRandomHexContent(false);
	content[?ContentPosition_North] = GetRandomHexContent(false);
	content[?ContentPosition_NorthEast] = GetRandomHexContent(false);
	content[?ContentPosition_SouthWest] = GetRandomHexContent(false);
	content[?ContentPosition_South] = GetRandomHexContent(false);
	content[?ContentPosition_SouthEast] = GetRandomHexContent(false);

	return content;
	
}