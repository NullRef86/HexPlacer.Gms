var hasContent = ds_map_size(Content) > 0;

if (hasContent)
{
	DrawHex(Content, 1);	
}
else
{
	//draw_sprite(sprite_index, 0, x, y);	
	draw_set_font(FontUI);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color(
		x,
		y,
		string(Coordinate[? X]) + ":" + string(Coordinate[? Y]),
		c_gray,c_gray,c_gray,c_gray,1
	);
	//draw_text_color(
	//	x,
	//	y + 20,
	//	string(depth),
	//	c_gray,c_gray,c_gray,c_gray,1
	//);
}