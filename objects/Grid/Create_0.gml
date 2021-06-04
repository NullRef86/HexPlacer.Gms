
global.Hexes = ds_list_create();

var width = 20;
var height = 11;

for (var xIndex = 0; xIndex < width; xIndex++)
{
	for (var yIndex = 0; yIndex < height; yIndex++)
	{
		var hex = instance_create_layer(0, 0, "GridLayer", Hex);
		
		// Set coordinate data
		hex.Coordinate = {
			X: xIndex,
			Y: yIndex
		};
		
		// Set position data
		var hexWidth = hex.sprite_width - 2;
		var hexHeight = hex.sprite_height - 2;
		
        var isOddColumn = hex.Coordinate.X % 2 != 0;

		hex.depth = ((height + (yIndex * -1)) * 2);
		if (isOddColumn)
		{
			hex.depth--;	
		}		
		
        var leftPosition =
            hexWidth * hex.Coordinate.X;

        if (hex.Coordinate.X > 0) {
            leftPosition -=
                (hex.Coordinate.X * hexWidth / 4);
        }

        var topPosition =
            (hexHeight * hex.Coordinate.Y);

        if (isOddColumn) {
            topPosition +=
                hexHeight / 2;
        }

		hex.x = leftPosition + (hexWidth / 2);
		hex.y = topPosition + (hexHeight / 2);		

		//hex.Content = NewRandomContentSet();

		ds_list_add(global.Hexes, hex);
	}
}

// Set neighbor data
for (var i = 0; i < ds_list_size(global.Hexes); i++)
{
	var hex = global.Hexes[|i];
	
    var isOddColumn = hex.Coordinate.X % 2 != 0;
	
	var neighbor =
		GetHex(
			hex.Coordinate.X - 1,
			isOddColumn
	            ? hex.Coordinate.Y
	            : hex.Coordinate.Y - 1
		);
    if (neighbor != pointer_null)
    {
		ds_map_add(hex.Neighbors, HexPosition_NorthWest, neighbor.Coordinate);
    }
		
	neighbor =
		GetHex(
			hex.Coordinate.X,
			hex.Coordinate.Y - 1
		);
    if (neighbor != pointer_null)
    {
		ds_map_add(hex.Neighbors, HexPosition_North, neighbor.Coordinate);
    }

	neighbor =
		GetHex(
			hex.Coordinate.X + 1,
			isOddColumn
	            ? hex.Coordinate.Y
	            : hex.Coordinate.Y - 1
		);
    if (neighbor != pointer_null)
    {
		ds_map_add(hex.Neighbors, HexPosition_NorthEast, neighbor.Coordinate);
    }

	neighbor =
		GetHex(
			hex.Coordinate.X - 1,
			isOddColumn
	            ? hex.Coordinate.Y + 1
	            : hex.Coordinate.Y
		);
    if (neighbor != pointer_null)
    {
		ds_map_add(hex.Neighbors, HexPosition_SouthWest, neighbor.Coordinate);
    }

	neighbor =
		GetHex(
			hex.Coordinate.X,
			hex.Coordinate.Y + 1
		);
    if (neighbor != pointer_null)
    {
		ds_map_add(hex.Neighbors, HexPosition_South, neighbor.Coordinate);
    }

	neighbor =
		GetHex(
			hex.Coordinate.X + 1,
			isOddColumn
	            ? hex.Coordinate.Y + 1
	            : hex.Coordinate.Y
		);
    if (neighbor != pointer_null)
    {
		ds_map_add(hex.Neighbors, HexPosition_SouthEast, neighbor.Coordinate);
    }
}

var startingHex =
	//GetHex(4, 7);
	GetHex(8, 4);

ds_map_copy(startingHex.Content, global.HexContentTemplate);

startingHex.Content[?ContentPosition_Centre] = GetTileContent(Content_Campfire, true);
startingHex.Content[?ContentPosition_NorthWest] = GetTileContent(Content_Forest, false);
startingHex.Content[?ContentPosition_North] = GetTileContent(Content_Empty, false);
startingHex.Content[?ContentPosition_NorthEast] = GetTileContent(Content_Forest, false);
startingHex.Content[?ContentPosition_SouthWest] = GetTileContent(Content_Empty, false);
startingHex.Content[?ContentPosition_South] = GetTileContent(Content_Empty, false);
startingHex.Content[?ContentPosition_SouthEast] = GetTileContent(Content_Empty, false);

global.Player.SettlementData.Centre = startingHex;