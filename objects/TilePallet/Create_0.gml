/// @description Create buttons and define panel
var buttonCount = 5;

Brushes = ds_list_create();

var screenCentreX = camera_get_view_width(view_camera[0]) / 2;
var screenBottom = camera_get_view_height(view_camera[0]);

var padding = 10;

var buttonWidth = sprite_get_width(grid_hex) + (padding * 2);
var buttonHeight = sprite_get_height(grid_hex) + (padding * 2)

var buttonX = screenCentreX - (buttonWidth * buttonCount) / 2 + (buttonWidth / 2);
var buttonY = screenBottom - (buttonHeight / 2) - padding;

Left = buttonX - (buttonWidth / 2) - padding;
Bottom = screenBottom;
Right = Left + (buttonWidth * buttonCount) + (padding * 2);
Top = screenBottom - (buttonHeight + (padding * 2));

for (var i = 0; i < buttonCount; i++)
{
	var tilePalletButton = instance_create_layer(buttonX, buttonY, "UILayer", TilePalletButton);
	
	tilePalletButton.Position = i;
	
	ds_list_add(Brushes, tilePalletButton);
	
	buttonX += buttonWidth;
}