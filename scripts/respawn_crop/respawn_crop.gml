///@description respawn_crop
///@arg grid_x
///@arg grid_y
///@arg crop_type
///@arg days_old

var cell_size = crops.cell_size;

var grid_x = argument0 * cell_size;
var grid_y = argument1 * cell_size;


//Create the instance
var crop_instance =instance_create_layer(grid_x + (cell_size / 2), grid_y + (cell_size /2),"Instances",obj_crop);
crops.ds_crops_instances[# argument0, argument1] = crop_instance;
show_debug_message("Respawned a " + crops.ds_crops_types[# 2, argument2])

//Give the crop its characteristcs
with(crop_instance){
	crop_type = argument2;
	days_old = argument3;
	item_index = argument4;
	growth_stage_duration = crops.ds_crops_types[# 0, crop_type];
	x_position = argument0;
	y_position = argument1;
}

return crop_instance;