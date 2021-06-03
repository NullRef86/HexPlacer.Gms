function AddOuterAdjacentContent(adjacentContent, hex, subContent, adjacentHexPosition, adjacentContentPosition){
	
    if (ds_map_exists(hex.Neighbors, adjacentHexPosition))
    {
        var neighboringCoordinate = hex.Neighbors[?adjacentHexPosition];
		var neighboringHex = GetHex(neighboringCoordinate[?X], neighboringCoordinate[?Y]);
        if (neighboringHex != pointer_null && ds_map_size(neighboringHex.Content) > 0)
        {
            ds_map_add(adjacentContent, ContentSubPosition_OuterClockwise, neighboringHex.Content[?adjacentContentPosition]);
            ds_map_add(adjacentContent, ContentSubPosition_OuterCentre, neighboringHex.Content[?adjacentContentPosition]);
            ds_map_add(adjacentContent, ContentSubPosition_OuterAntiClockwise, neighboringHex.Content[?adjacentContentPosition]);
        }
        else
        {
            subContent[?ContentSubPosition_OuterClockwise] = pointer_null;
            subContent[?ContentSubPosition_OuterCentre] = pointer_null;
            subContent[?ContentSubPosition_OuterAntiClockwise] = pointer_null;
        }
    }
	
}