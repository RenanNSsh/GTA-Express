/// @description Insert description here
// You can write your code in this editor


//--------------UPDATE INPUT
var input_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var input_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var input_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
var input_down = keyboard_check(ord("S")) || keyboard_check(vk_down);

//--------------RESET MOVE VARIABLES
var next_move_x = 0;
var next_move_y = 0;

//--------------INTENDED MOVEMENT
if(input_right){
	next_move_x = player_speed;
}

if(input_left){
	next_move_x = -player_speed;
}

if(input_down){
	next_move_y = player_speed;
}

if(input_up){
	next_move_y = -player_speed;
}

//---------------APPLY MOVEMENT
x += next_move_x;
y += next_move_y;