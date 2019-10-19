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
draw_sprite_part(spr_hair, 0, floor(x_frame) * frame_size, y_frame * frame_size, 64, 64, xx, yy);


// Draw Collision mask
draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true);