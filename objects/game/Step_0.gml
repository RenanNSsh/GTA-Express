/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("0"))) {
	debug = !debug;
}

if(keyboard_check_pressed(vk_f12)) {
	game_restart();
}

if(keyboard_check_pressed(vk_f10)) {
	game_end();
}