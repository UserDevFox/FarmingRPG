/// @description Insert description here
// You can write your code in this editor

randomize();
room_goto_next();
debug=false;

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

blackAlpha = 0;
spawnRoom = -1;
spawnX = -1;
spawnY = -1;
spawnPlayerFacing = -1;
doTransition = false;

enum dir {
	right = 0,
	up    = 90,
	left  = 180,
	down  = 270
}