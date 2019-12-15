//-------- UPDATE INPUT
input_left   = keyboard_check(vk_left);
input_right  = keyboard_check(vk_right);
input_up     = keyboard_check(vk_up);
input_down   = keyboard_check(vk_down);
input_walk   = keyboard_check(vk_control);
input_run    = keyboard_check(vk_shift);

//-------- ALTER SPEED
if (input_run or input_walk) {
	spd = abs((input_walk*w_spd) - (input_run*r_spd));
} else {
	spd = n_spd;
}

//-------- RESET MOVE VARIABLES
moveX = 0;
moveY = 0;

//-------- GET INTENDED MOVEMENT
moveY = (input_down - input_up) * spd;
if (moveY == 0) { moveX = (input_right - input_left) * spd; }

//-------- GET DIRECTION PLAYER IS FACING
if (moveX != 0) {
	facing = moveX > 0 ? dir.right : dir.left;	
} else if (moveY != 0) {
	facing = moveY > 0 ? dir.down : dir.up;	
} else {
	facing = -1;
}

//-------- COLLISION CHECKS
// Horizontal
if (moveX != 0) {
	if (place_meeting(x+moveX, y, obj_collision)) {
		repeat(abs(moveX)) {
			if (!place_meeting(x + sign(moveX), y, obj_collision)) { 
				x += sign(moveX); 
			} else { break; }
		}
		moveX = 0;
	}
}

// Vertical
if (moveY != 0) {
	if (place_meeting(x, y+moveY, obj_collision)) {
		repeat(abs(moveY)) {
			if (!place_meeting(x, y + sign(moveY), obj_collision)) { 
				y += sign(moveY); 
			} else { break; }
		}
		moveY = 0;
	}
}

// Objects
var inst_transition = instance_place(x,y,obj_transitions);
if (inst_transition != noone and facing == inst_transition.playerFacingBefore) {
	with (game) {
		if (!doTransition) {
			spawnRoom = inst_transition.targetRoom;
			spawnX = inst_transition.targetX;
			spawnY = inst_transition.targetY;
			spawnPlayerFacing = inst_transition.playerFacingAfter;
			doTransition = true;
		}
	}
}

//-------- APPLY MOVEMENT
x += moveX;
y += moveY;




