/// @description Determine location and style

x = mouse_x;
y = mouse_y;

IsValid = false;

if (global.IsHoveringPallet)
{
	return;	
}

var closestHex = instance_nearest(mouse_x, mouse_y, Hex);

var hasContent = ds_map_size(closestHex.Content) > 0;
if (hasContent)
{
	return;
}

var hasAnyNeighborsWithContent = false;
for (var key = ds_map_find_first(closestHex.Neighbors); !is_undefined(key); key = ds_map_find_next(closestHex.Neighbors, key)) 
{
	var neighborCoordinate = closestHex.Neighbors[? key];
	var neighborHex = GetHex(neighborCoordinate[?X], neighborCoordinate[?Y]);
	
	if (ds_map_size(neighborHex.Content) > 0)
	{
		hasAnyNeighborsWithContent = true;
		break;
	}
}	

if (!hasAnyNeighborsWithContent)
{
	return;
}

IsValid = true;

x = closestHex.x;
y = closestHex.y;