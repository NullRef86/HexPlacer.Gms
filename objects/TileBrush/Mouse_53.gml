/// @description Place tile

if (global.IsHoveringPallet || !IsValid)
{
	return;	
}

var clickedHex = instance_nearest(mouse_x, mouse_y, Hex);

ds_map_copy(clickedHex.Content, Content);

CalculateResources(clickedHex);
for (var key = ds_map_find_first(clickedHex.Neighbors); !is_undefined(key); key = ds_map_find_next(clickedHex.Neighbors, key)) 
{
	var neighborCoordinate = clickedHex.Neighbors[? key];
	var neighborHex = GetHex(neighborCoordinate[?X], neighborCoordinate[?Y]);
	CalculateResources(neighborHex);
}

var tilePallet;

with (TilePallet)
{	
	tilePallet = self;
}

var brushButton = tilePallet.Brushes[|PalletPosition];

brushButton.Content = NewRandomContentSet();
	
ClearTileBrush();