/// @description Draw background

depth = 102;

// Draw background
draw_set_colour(c_black);
draw_rectangle(Left, Top, Right, Bottom, false);

// Draw border
draw_set_colour(c_gray);
draw_rectangle(Left, Top, Right, Bottom, true);

// Reset
draw_set_colour(c_white);
