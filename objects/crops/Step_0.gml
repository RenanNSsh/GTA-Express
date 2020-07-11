/// @description Insert description here
// You can write your code in this editor

var input_planting_mode = keyboard_check_pressed(ord("P"));
var input_plant_crop    = mouse_check_button_pressed(mb_left);
var input_next_crop     = mouse_wheel_up(); 
var input_previous_crop = mouse_wheel_down();

if(input_planting_mode){
	planting = !planting;
}



if(planting){	
	mouse_crop_x = mouse_x;
	mouse_crop_y = mouse_y;
	
	if(input_next_crop){
		select_crop++;
	}
	
	if(input_previous_crop){
		select_crop--;
	}
	
	var last_crop_index = sprite_get_number(spr_crops_picked) - 1;
	
	if(select_crop > last_crop_index){
		select_crop = 0;
	}else if(select_crop < 0){
		select_crop = last_crop_index;
	}
	
	if(input_plant_crop){
		instance_create_crop(mouse_crop_x, mouse_crop_y, select_crop);
	}
}
