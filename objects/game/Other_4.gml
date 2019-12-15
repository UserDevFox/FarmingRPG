/// @description Insert description here
// You can write your code in this editor
if spawnRoom == -1 exit;
obj_player.x = spawnX;
obj_player.y = spawnY;
obj_player.facing = spawnPlayerFacing;

with (obj_player) {
	switch (facing) {
		case dir.left:  y_frame =  9; break;
		case dir.right: y_frame = 11; break;
		case dir.up:    y_frame =  8; break;
	    case dir.down:  y_frame = 10; break;
		case -1:        x_frame =  0; break; // Idle
	}
}