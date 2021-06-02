/// @desc Handle camera
if (mouse_check_button(mb_middle))
{		
    var _vx = camera_get_view_x(view_camera[0]) + (dragRoomX - mouse_x);
    var _vy = camera_get_view_y(view_camera[0]) + (dragRoomY - mouse_y);
    camera_set_view_pos(view_camera[0], _vx, _vy);
}

if (global.TileBrush == pointer_null)
{
	// This is changes the zoom based on scolling but you can set it how ever you like
	zoom_level = clamp(zoom_level + (((mouse_wheel_down() - mouse_wheel_up())) * 0.1), 0.5, 2);
}

// Get current size
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

// Set the rate of interpolation
var rate = 0.5;

// Get new sizes by interpolating current and target zoomed size
var new_w = lerp(view_w, zoom_level * default_zoom_width, rate);
var new_h = lerp(view_h, zoom_level * default_zoom_height, rate);

// Apply the new size
camera_set_view_size(view_camera[0], new_w, new_h);

var vpos_x = camera_get_view_x(view_camera[0]);
var vpos_y = camera_get_view_y(view_camera[0]);

// Change coordinates of camera so zoom is centered
var new_x = lerp(vpos_x,vpos_x+(view_w - zoom_level * default_zoom_width)/2, rate);
var new_y = lerp(vpos_y,vpos_y+(view_h - zoom_level * default_zoom_height)/2, rate);

//Get the shift necessary to re-align the view.
shift_x = camera_get_view_x(view_camera[0]) - (new_w - view_w) * 0.5;
shift_y = camera_get_view_y(view_camera[0]) - (new_h - view_h) * 0.5;

//Update the view position
camera_set_view_pos(view_camera[0],shift_x, shift_y);
