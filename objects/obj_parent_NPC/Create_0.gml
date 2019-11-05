/// @description

// Speed
w_spd = 1; // Walking speed
n_spd = 2; // Normal speed
r_spd = 3; // Running speed
spd   = n_spd; // NPC's walk around

// Animation and sprite
x_frame = 1;
y_frame = 8;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_base   = -1;
spr_feet   = -1;
spr_legs   = -1;
spr_torso  = -1;
spr_hair   = -1;
spr_shadow = spr_character_shadow;

moveX = 0;
moveY = 0;

alarm[1] = room_speed;