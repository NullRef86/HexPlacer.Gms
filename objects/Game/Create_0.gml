
#macro X "X"
#macro Y "Y"

#macro HexPosition_NorthWest "NorthWest"
#macro HexPosition_North "North"
#macro HexPosition_NorthEast "NorthEast"
#macro HexPosition_SouthWest "SouthWest"
#macro HexPosition_South "South"
#macro HexPosition_SouthEast "SouthEast"

#macro ContentPosition_Centre "Centre"
#macro ContentPosition_NorthWest "NorthWest"
#macro ContentPosition_North "North"
#macro ContentPosition_NorthEast "NorthEast"
#macro ContentPosition_SouthWest "SouthWest"
#macro ContentPosition_South "South"
#macro ContentPosition_SouthEast "SouthEast"

#macro Content_Empty "Empty"
#macro Content_Campfire "Campfire"
#macro Content_Forest "Forest"

#macro ContentSubPosition_OuterClockwise "OuterClockwise"
#macro ContentSubPosition_OuterCentre "OuterCentre"
#macro ContentSubPosition_OuterAntiClockwise "OuterAntiClockwise"

#macro ContentSubPosition_CentreClockwise "CentreClockwise"
#macro ContentSubPosition_CentreAntiClockwise "CentreAntiClockwise"

#macro ContentSubPosition_Inner "Inner"

#macro ContentSubPosition_NorthWest "NorthWest"
#macro ContentSubPosition_North "North"
#macro ContentSubPosition_NorthEast "NorthEast"
#macro ContentSubPosition_SouthEast "SouthEast"
#macro ContentSubPosition_SouthWest "SouthWest"

randomize();

global.HexContentTemplate = ds_map_create();

ds_map_add(global.HexContentTemplate, ContentPosition_Centre, Content_Empty);
ds_map_add(global.HexContentTemplate, ContentPosition_NorthWest, Content_Empty);
ds_map_add(global.HexContentTemplate, ContentPosition_North, Content_Empty);
ds_map_add(global.HexContentTemplate, ContentPosition_NorthEast, Content_Empty);
ds_map_add(global.HexContentTemplate, ContentPosition_SouthWest, Content_Empty);
ds_map_add(global.HexContentTemplate, ContentPosition_South, Content_Empty);
ds_map_add(global.HexContentTemplate, ContentPosition_SouthEast, Content_Empty);

global.TileBrush = pointer_null;

global.DebugMessage = "";