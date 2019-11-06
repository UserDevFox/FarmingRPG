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
	var uv = sprite_get_uvs(spr_hair, 0);
	var hair_texture = sprite_get_texture(spr_hair, 0);
	var hair_texture_width = texture_get_width(hair_texture) / texture_get_texel_width(hair_texture);
	var hair_uv_2 = (anim_length * frame_size) / hair_texture_width;
	
	var left = (floor(x_frame)) / anim_length;
	var right = (floor(x_frame) + 1) / anim_length;
	show_debug_message("hair_tex_width: "+string(hair_texture_width)+" uv[4]: "+string(uv[4])+" uv[6]: "+string(uv[6])+" uv[0]: "+string(uv[0])+" uv[2]: "+string(uv[2])+" hair_uv_2: "+string(hair_uv_2));
	var uv_width = (hair_uv_2-uv[0]);
	var hair_frame_uv_width = uv_width / anim_length;
	
    shader_set_uniform_f(shader_hair_uv_uni, uv[0]+(left*uv_width), uv[0]+(left*uv_width)+hair_frame_uv_width );
	//shader_set_uniform_f(shader_hair_uv_uni, uv[0]+(left*uv_width), hair_uv_2+(left*uv_width) );
}
draw_sprite_part(spr_hair, 0, floor(x_frame) * frame_size, y_frame * frame_size, 64, 64, xx, yy);
if (use_shader) shader_reset();


// Draw Collision mask
draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true);