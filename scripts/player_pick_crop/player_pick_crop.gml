///@description player_pick_crop

var crop_instance = collision_rectangle(x-collision_radius, y-collision_radius,x+collision_radius,y+collision_radius,obj_crop,false, false);


if(crop_instance != noone && crop_instance.fully_growth){
	var crops_instances_grid = crops.ds_crops_instances;
	var cell_size = crops.cell_size;
	var drop_amount = irandom(2) +1;
	
	//create the item
	repeat(drop_amount){
		var dropped_item = instance_create_layer(x, y, "Instances", obj_dropped_item);
		with(dropped_item){
			item_index = crop_instance.item_index;
			x_frame = item_index mod (sprite_items_width / cell_size);
			y_frame = item_index div (sprite_items_width / cell_size);
		}
	}
	
	
	crops_instances_grid[# crop_instance.x_position,  crop_instance.y_position ] = -1;

	instance_destroy(crop_instance);
	show_debug_message("Picked an crop.");
		
}