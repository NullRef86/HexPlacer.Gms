/// @description Set button states based on mouse position

var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

global.IsHoveringPallet = false;

for (var i = 0; i < ds_list_size(Brushes); i++)
{
	var button = Brushes[|i];
		
	button.State = ButtonState_None;
	
	if (global.TileBrush != pointer_null &&
		global.TileBrush.PalletPosition == i)
	{
		button.State = ButtonState_Active;	
	}
}

if (mouseX > Left &&
	mouseX < Right &&
	mouseY > Top &&
	mouseY < Bottom)
{
	global.IsHoveringPallet = true;	
		
	var closestTilePalletButton = instance_nearest(mouseX, mouseY, TilePalletButton);

	if (closestTilePalletButton.State != ButtonState_Active)
	{
		closestTilePalletButton.State = ButtonState_Hover;	
	}
}