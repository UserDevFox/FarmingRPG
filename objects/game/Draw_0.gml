/// @description Insert description here
// You can write your code in this editor

if (debug) {
	// Draw Collision mask
	with(obj_collision) {
		draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true);
	}

	with(obj_player) {
		draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true);
	}
}