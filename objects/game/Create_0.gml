/// @description Insert description here
// You can write your code in this editor
randomize();
room_goto_next();

debug = false;

//GUI Properties
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
black_alpha = 0;

//Transition Properties
spawn_player_facing = -1;
do_transition = false;
spawn_room = 0;
spawn_x = 0;
spawn_y = 0;

enum dir{
	right = 0,
	up = 90,
	left = 180,
	down = 270
}