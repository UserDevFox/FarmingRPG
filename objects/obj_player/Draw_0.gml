/// @description
var anim_length = 9;
var frame_size = 64;
var anim_speed = 12;

if      (moveX < 0) y_frame =  9; // Left
else if (moveX > 0) y_frame = 11; // Right
else if (moveY < 0) y_frame =  8; // Up
else if (moveY > 0) y_frame = 10; // Down
else                x_frame =  0; // Idle

var xx = x-x_offset;
var yy = y-y_offset;

// INCREMENT FRAME FOR ANIMATION
if (x_frame + anim_speed / room_speed < anim_length) { x_frame += anim_speed / room_speed; }
else					                             { x_frame = 1;  }

// DRAW CHARACTER BASE
draw_sprite_part(spr_base, 0, floor(x_frame) * frame_size, y_frame * frame_size, 64, 64, xx, yy);

// DRAW CHARACTER FEET
draw_sprite_part(spr_feet, 0, floor(x_frame) * frame_size, y_frame * frame_size, 64, 64, xx, yy);

// DRAW CHARACTER LEGS
draw_sprite_part(spr_legs, 0, floor(x_frame) * frame_size, y_frame * frame_size, 64, 64, xx, yy);

// DRAW CHARACTER SHIRT
draw_sprite_part(spr_torso, 0, floor(x_frame) * frame_size, y_frame * frame_size, 64, 64, xx, yy);

// DRAW CHARACTER HAIR
use_shader = keyboard_check(ord("S"));
if (use_shader) {
	shader_set(sh_hair);
	shader_set_uniform_f_array(shader_hair_uni, hair_color);
	var uv = sprite_get_uvs(spr_hair, 0);
	//var left = floor(x_frame) / (anim_length * 1.0);
	//var right = (floor(x_frame) + 1) / (anim_length * 1.0);
	var left = 0 / (anim_length * 1.0);
	var right = 1 / (anim_length * 1.0);
	var uv_width = uv[2]-uv[0];
	
    shader_set_uniform_f(shader_hair_uv_uni, uv[0]+(left*uv_width), uv[0]+(right*uv_width) );
	//shader_set_uniform_f(shader_hair_uv_uni, uv[0], uv[2] );
}
draw_sprite_part(spr_hair, 0, floor(x_frame) * frame_size, y_frame * frame_size, 64, 64, xx, yy);
draw_sprite_part(spr_hair, 0, floor(x_frame + 1) * frame_size, y_frame * frame_size, 64, 64, xx + 32, yy);
draw_sprite_part(spr_hair, 0, floor(x_frame + 2) * frame_size, y_frame * frame_size, 64, 64, xx + 64, yy);
draw_sprite_part(spr_hair, 0, floor(x_frame + 3) * frame_size, y_frame * frame_size, 64, 64, xx + 96, yy);
draw_sprite_part(spr_hair, 0, floor(x_frame + 4) * frame_size, y_frame * frame_size, 64, 64, xx + 128, yy);
if (use_shader) shader_reset();


// Draw Collision mask
draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true);