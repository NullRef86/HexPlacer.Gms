// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetRandomHexContent(){

	var availableContent = ds_list_create();
				
	ds_list_add(availableContent, Content_Empty);
	ds_list_add(availableContent, Content_Empty);
	ds_list_add(availableContent, Content_Empty);
	ds_list_add(availableContent, Content_Forest);
	ds_list_add(availableContent, Content_Forest);
				
	//if (contentPosition != ContentPosition.Centre)
	//{
	//    // Plots only on the edges
	//    availableContent.Add(TileContentType.Plot);
	//}
	//else
	//{
	//    // Barracks only in the enter
	//    availableContent.Add(TileContentType.Barracks);
	//}

	ds_list_shuffle(availableContent);

	return availableContent[|0];
}