/// @description Insert description here
// If we press a button, move the player

if (keyboard_check(vk_left)) {
	// Move the player
	x = x-2; 
}
if (keyboard_check(vk_right)) {
	x = x+2; 
}
if (keyboard_check(vk_down)) {
	y = y+2; 
}
if (keyboard_check(vk_up)) {
	y = y-2; 
}

