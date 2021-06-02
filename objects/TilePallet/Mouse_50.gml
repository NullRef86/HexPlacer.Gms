/// @description Select brush
if (!global.IsHoveringPallet)
{
	return;
}

var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);
	
var clickedButton = instance_nearest(mouseX, mouseY, TilePalletButton)

var newBrush = instance_create_(0, 0, "TilesLayer", TileBrush);
	
newBrush.PalletPosition = clickedButton.Position;
	
ds_map_copy(newBrush.Content, clickedButton.Content);
	
ClearTileBrush();
	
global.TileBrush = newBrush;