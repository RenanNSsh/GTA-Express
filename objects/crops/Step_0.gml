/// @description Insert description here
// You can write your code in this editor
if(room != rm_farm_field || inventory.show_inventory || inventory.pickup_slot != -1){ 
	planting = false;
	exit;
}


#region Planting
var input_plant_crop    = mouse_check_button_pressed(mb_left);

var inventory_item_type = item_type.nothing;
var inventory_selected_item = -1;
var inventory_selected_slot =  inventory.selected_slot;
if(inventory.selected_slot != -1){
	inventory_selected_item = inventory.ds_inventory[# inventory_grid.item,inventory_selected_slot];
	inventory_item_type = inventory.ds_items_info[# inventory_item_info.type_index, inventory_selected_item];	
}
planting = inventory_item_type == item_type.crop || inventory_item_type ==  item_type.weapon;


if(planting && inventory_selected_item != -1){	
	mouse_crop_x = mouse_x;
	mouse_crop_y = mouse_y;
	var crop_index = ds_grid_value_y(ds_crops_types,3,0,3,ds_grid_height(ds_crops_types)-1,inventory_selected_item)
	if(crop_index != -1){
		select_crop = crop_index;
		
		if(input_plant_crop){
			var crop_instance = instance_create_crop(mouse_crop_x, mouse_crop_y, select_crop);
			if(crop_instance != false){
				inventory.ds_inventory[# inventory_grid.amount,  inventory_selected_slot]--;
			}
		}
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