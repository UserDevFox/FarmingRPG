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
//x_frame = 8;
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
	// Coordinates for the entire hair sprite in texture space. Entire texture has a width of 1.0
	var hair_uv = sprite_get_uvs(spr_hair, 0);
	var hair_texture = sprite_get_texture(spr_hair, 0);
		
	// The width of one sprite pixel in texture space
	var hair_texel_width = texture_get_texel_width(hair_texture);
	
	// The left edge in texture space of the x_frame of the hair sprite animation
	var s1 = hair_uv[0] + floor(x_frame) * frame_size * hair_texel_width ;
	// The right edge in texture space of the x_frame of the hair sprite animation
	var s2 = s1 + (frame_size ) * hair_texel_width;
	
	shader_set_uniform_f(shader_hair_uv_uni, s1, s2);
}
draw_sprite_part(spr_hair, 0, floor(x_frame) * frame_size, y_frame * frame_size, 64, 64, xx, yy);
if (use_shader) shader_reset();


// Draw Collision mask
draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true);