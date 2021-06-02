/// @description Button and state border

depth = 101;

switch (State)
{
	case ButtonState_Active:
		draw_set_color(c_orange);
		draw_rectangle(x - 55, y - 55, x + 55, y + 55, true);	
		break;
	case ButtonState_Hover:
		draw_set_color(c_red);
		draw_rectangle(x - 50, y - 50, x + 50, y + 50, true);	
		break;
}

draw_set_color(c_white);

DrawHex(Content, 1);