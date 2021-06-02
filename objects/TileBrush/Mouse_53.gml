/// @description Place tile

if (global.IsHoveringPallet)
{
	return;	
}

var clickedHex = instance_nearest(mouse_x, mouse_y, Hex);

ds_map_copy(clickedHex.Content, Content);

var tilePallet;

with (TilePallet)
{	
	tilePallet = self;
}

var brushButton = tilePallet.Brushes[|PalletPosition];

PopulateRandomContent(brushButton.Content);
	
ClearTileBrush();