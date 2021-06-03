// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawTree(x, y, state, alpha){

	if (state == pointer_null)
	{
		return;	
	}

	if (state)
	{
		//draw_circle_color(x, y, 5, c_green, c_green, false);	
		//draw_circle_color(x, y, 5, c_black, c_black, true);	
		draw_sprite_ext(sprTreeTall, 0, x, y, 1, 1, 0, c_white, alpha);	
	}
	else
	{
		draw_circle_color(x, y, 3, c_yellow, c_maroon, false);	
		draw_circle_color(x, y, 3, c_black, c_black, true);		
	}

}