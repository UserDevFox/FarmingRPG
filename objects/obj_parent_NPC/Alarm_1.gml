/// @description Insert description here
// You can write your code in this editor

moveX = 0;
moveY = 0;

var idle = choose(0,1);
if (idle == false) {
	var dir = choose(1,2,3,4);
	switch (dir) {
		case 1: moveX =  spd;
		case 2: moveX = -spd;
		case 3: moveY =  spd;
		case 4: moveY = -spd;
	}
}
		

// Reset alarm
alarm[1] = random_range(2.5, 4) * room_speed;