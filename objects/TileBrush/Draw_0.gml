/// @description Draw (faded for invalid)

var alpha = IsValid ? 1 : 0.5;
DrawHex(Content, alpha);