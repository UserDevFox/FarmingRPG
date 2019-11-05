
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
//-------- APPLY MOVEMENT
x += moveX;
y += moveY;




