
var viewportPadding = 6;

draw_set_halign(fa_right);
draw_text(view_wport[0] - viewportPadding, view_hport[0] - viewportPadding - 5, "FPS: " + string(fps));
draw_set_halign(fa_left);

draw_text(viewportPadding, viewportPadding + 5, string(global.DebugMessage));