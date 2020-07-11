/// @description Insert description here
// You can write your code in this editor

var move_cam = keyboard_check(ord("C"));
if(move_cam){
	var input_left  = keyboard_check(ord("J"));
	var input_right  = keyboard_check(ord("L"));
	var input_up  = keyboard_check(ord("I"));
	var input_down  = keyboard_check(ord("K"));
	
	x += (input_right - input_left) * cam_speed;
	y += (input_down - input_up) * cam_speed;
}else{
	x = clamp(x, following.x- horizontal_border, following.x + horizontal_border);
	y = clamp(y, following.y- vertical_border, following.y + vertical_border);
}
