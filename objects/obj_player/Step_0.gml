/// @description Insert description here
// You can write your code in this editor


//--------------UPDATE INPUT
var input_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var input_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var input_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
var input_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
var input_run = keyboard_check(vk_shift);
var input_walk = keyboard_check(vk_control);

//---------------CHANGE SPEED

if(input_run && input_walk){
	player_speed = run_speed - walk_speed;
}else if(input_run){
	player_speed = run_speed;
}else if(input_walk){
	player_speed = walk_speed;
}else{
	player_speed = normal_speed;
}


//--------------RESET MOVE VARIABLES
next_move_x = 0;
next_move_y = 0;


//--------------INTENDED MOVEMENT
if(input_right){
	next_move_x += player_speed;
}

if(input_left){
	next_move_x += -player_speed;
}

if(input_down){
	next_move_y += player_speed;
}

if(input_up){
	next_move_y += -player_speed;
}

//GET DIRECTION PLAYER IS FACING
if(next_move_x != 0){
	switch(sign(next_move_x)){
		case  1: facing = dir.right; break;
		case -1: facing = dir.left;  break;
	}
}else if(next_move_y != 0){
	switch(sign(next_move_y)){
		case  1: facing = dir.down; break;
		case -1: facing = dir.up;  break;
	}
}else{
	facing = -1;
}

//---------------COLLISION CHECKS
//HORIZONTAL
var horizontal_colission = place_meeting(x+next_move_x, y, obj_collision);
if(horizontal_colission){
	repeat(abs(next_move_x)){
		var horizontal_colission_pixel = place_meeting( x + sign(next_move_x), y, obj_collision);
		if(!horizontal_colission_pixel){
			x+=sign(next_move_x);
		}else{
			break;
		}
	}
	next_move_x = 0
}


//VERTICAL
var vertical_colission = place_meeting(x, y+next_move_y, obj_collision);
if(vertical_colission){
	repeat(abs(next_move_y)){
		var vertical_colission_pixel = place_meeting( x , y + sign(next_move_y), obj_collision);
		if(!vertical_colission_pixel){
			y+=sign(next_move_y);
		}else{
			break;
		}
	}
	next_move_y = 0
}

//OBJECTS
var transition_instance = instance_place(x,y,obj_transition);
if(transition_instance != noone && facing == transition_instance.player_facing_before){
	with(game){
		if(!do_transition){
			spawn_room = transition_instance.target_room;
			spawn_x = transition_instance.target_x;
			spawn_y = transition_instance.target_y;
			spawn_player_facing = transition_instance.player_facing_after;
			do_transition = true;
		}
	}
	
}

//---------------APPLY MOVEMENT
x += next_move_x;
y += next_move_y;