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

// DRAW SHADOW
if (spr_shadow != -1) draw_sprite(spr_shadow, 0, x, y);

// DRAW CHARACTER BASE
if (spr_base != -1) draw_sprite_part(spr_base, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// DRAW CHARACTER FEET
if (spr_feet != -1) draw_sprite_part(spr_feet, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// DRAW CHARACTER LEGS
if (spr_legs != -1) draw_sprite_part(spr_legs, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// DRAW CHARACTER SHIRT
if (spr_torso != -1) draw_sprite_part(spr_torso, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// DRAW CHARACTER HAIR
if (spr_hair != -1) draw_sprite_part(spr_hair, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// INCREMENT FRAME FOR ANIMATION
if (x_frame < anim_length - 1) { x_frame += anim_speed / room_speed; }
else					       { x_frame = 1;  }
