function DrawTree(x, y, state, alpha){

	if (state == pointer_null)
	{
		return;	
	}

	if (state)
	{
		draw_sprite_ext(spr_Tree_Tall, 0, x, y, 1, 1, 0, c_white, alpha);	
	}
	else
	{
		draw_circle_color(x, y, 3, c_yellow, c_maroon, false);	
		draw_circle_color(x, y, 3, c_black, c_black, true);		
	}

}