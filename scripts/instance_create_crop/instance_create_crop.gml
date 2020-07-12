///@description instance_create_crop
///@arg x
///@arg y
///@arg crop_type

var cell_size = crops.cell_size;
var grid_cell_index_x = argument0 div cell_size;
var grid_cell_index_y = argument1 div cell_size;
var crops_instances_grid = crops.ds_crops_instances;
var crop_in_cell = crops_instances_grid[# grid_cell_index_x, grid_cell_index_y];

if(!crop_in_cell){
	
	var cell_index_x = grid_cell_index_x * cell_size;
	var cell_index_y = grid_cell_index_y * cell_size;

	//Check for soil
	var soil_layer_id = layer_get_id("T_Soil");
	var soil_map_id = layer_tilemap_get_id(soil_layer_id);
	var soil_in_pixel = tilemap_get_at_pixel(soil_map_id, argument0, argument1);

	if(!soil_in_pixel){
		show_debug_message("there is no soil here");
		return false;
	}else{
		show_debug_message("there is soil here");
	}


	//Create the Instance
	var crop_instance = instance_create_layer(cell_index_x + (cell_size/2), cell_index_y  + (cell_size/2), "Instances",obj_crop);
	crops_instances_grid[# grid_cell_index_x, grid_cell_index_y] = crop_instance;

	//Give the crop its characteristics
	with (crop_instance){
		crop_type = argument2;
		growth_stage_duration = crops.ds_crops_types[# 0, crop_type];
	}

	return crop_instance;	

}else{
	show_debug_message("There is already something there");
	return false;
}
