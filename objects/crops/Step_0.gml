/// @description Insert description here
// You can write your code in this editor
if(room != rm_farm_field){ 
	planting = false;
	exit;
}


#region Planting
var input_plant_crop    = mouse_check_button_pressed(mb_left);
var input_next_crop     = mouse_wheel_up(); 
var input_previous_crop = mouse_wheel_down();

var inventory_item_type = item_type.nothing;
if(inventory.selected_slot != -1){
	var inventory_selected_item = inventory.ds_inventory[# inventory_grid.item, inventory.selected_slot];
	inventory_item_type = inventory.ds_items_info[# inventory_item_info.type_index, inventory_selected_item];	
}
planting = inventory_item_type == item_type.crop;




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
#endregion

if(instance_exists(obj_crop) && keyboard_check_pressed(ord("G"))){
	with(obj_crop){
		days_old++;
		if(growth_stage < max_growth_stage){
			
			if(growth_stage_duration != 0){
				growth_stage = days_old div growth_stage_duration;
			}
			
		}else{
			growth_stage = max_growth_stage;
			fully_growth = true;
			alarm[1] = 1;
		}
		
	}
}