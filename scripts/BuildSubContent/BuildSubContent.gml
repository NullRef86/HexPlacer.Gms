// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BuildSubContent(isCentre){

	var subContent = ds_map_create();
	
	if (isCentre)
	{
		ds_map_add(subContent, ContentSubPosition_NorthWest, true);
		ds_map_add(subContent, ContentSubPosition_North, true);
		ds_map_add(subContent, ContentSubPosition_NorthEast, true);
		ds_map_add(subContent, ContentSubPosition_SouthWest, true);
		ds_map_add(subContent, ContentSubPosition_SouthEast, true);
	}
	else
	{
		ds_map_add(subContent, ContentSubPosition_Inner, true);
	
		ds_map_add(subContent, ContentSubPosition_CentreClockwise, true);
		ds_map_add(subContent, ContentSubPosition_CentreAntiClockwise, true);
	
		ds_map_add(subContent, ContentSubPosition_OuterClockwise, true);
		ds_map_add(subContent, ContentSubPosition_OuterCentre, true);
		ds_map_add(subContent, ContentSubPosition_OuterAntiClockwise,  true);
	}
	
	return subContent;
	
}