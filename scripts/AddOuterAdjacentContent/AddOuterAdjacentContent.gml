// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AddOuterAdjacentContent(adjacentContent, hex, adjacentHexPosition, adjacentContentPosition){
//void addOuterAdjacentContent(HexPosition adjacentHexPosition, ContentPosition adjacentContentPosition)
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
        //else
        //{
        //    forest.SubContent[ContentSubPosition.OuterClockwise] = null;
        //    forest.SubContent[ContentSubPosition.OuterCentre] = null;
        //    forest.SubContent[ContentSubPosition.OuterAntiClockwise] = null;
        //}
    }
}