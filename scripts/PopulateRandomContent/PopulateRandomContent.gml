// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PopulateRandomContent(content){

	ds_map_copy(content, global.HexContentTemplate);

	content[?ContentPosition_Centre] = GetRandomHexContent();
	content[?ContentPosition_NorthWest] = GetRandomHexContent();
	content[?ContentPosition_North] = GetRandomHexContent();
	content[?ContentPosition_NorthEast] = GetRandomHexContent();
	content[?ContentPosition_SouthWest] = GetRandomHexContent();
	content[?ContentPosition_South] = GetRandomHexContent();
	content[?ContentPosition_SouthEast] = GetRandomHexContent();

}