
function ClearTileBrush(){

	global.IsZoomEnabled = true;

	if (global.TileBrush == pointer_null)
	{
		return;	
	}

	instance_destroy(global.TileBrush);
	
	global.TileBrush = pointer_null;
}