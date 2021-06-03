function RotateTileBrush(_direction, _content){

    var original = ds_map_create();
	
	ds_map_copy(original, _content);
	
    if (_direction > 0)
    {
        _content[?ContentPosition_NorthWest] = original[?ContentPosition_SouthWest];
        _content[?ContentPosition_North] = original[?ContentPosition_NorthWest];
        _content[?ContentPosition_NorthEast] = original[?ContentPosition_North];
        _content[?ContentPosition_SouthEast] = original[?ContentPosition_NorthEast];
        _content[?ContentPosition_South] = original[?ContentPosition_SouthEast];
        _content[?ContentPosition_SouthWest] = original[?ContentPosition_South];
    }
    else
    {
        _content[?ContentPosition_NorthWest] = original[?ContentPosition_North];
        _content[?ContentPosition_North] = original[?ContentPosition_NorthEast];
        _content[?ContentPosition_NorthEast] = original[?ContentPosition_SouthEast];
        _content[?ContentPosition_SouthEast] = original[?ContentPosition_South];
        _content[?ContentPosition_South] = original[?ContentPosition_SouthWest];
        _content[?ContentPosition_SouthWest] = original[?ContentPosition_NorthWest];
    }
}