/// @description Insert description here
// You can write your code in this editor

if(!planting) exit;

var game_cell_size = cell_size;
var grid_cell_index_x = mouse_crop_x div game_cell_size;
var grid_cell_index_y = mouse_crop_y div game_cell_size;


var can_plant_color = c_red;
var crop_in_cell = ds_crops_instances[# grid_cell_index_x, grid_cell_index_y];

if(!crop_in_cell){
	var soil_layer_id = layer_get_id("T_Soil");
	var soil_map_id = layer_tilemap_get_id(soil_layer_id);
	var soil_in_pixel = tilemap_get_at_pixel(soil_map_id, mouse_crop_x, mouse_crop_y);

	if(soil_in_pixel){
		can_plant_color = c_lime;
	}
}

var cell_index_x = grid_cell_index_x * game_cell_size;
var cell_index_y = grid_cell_index_y * game_cell_size;

//Draw a indicator if can plant
draw_rectangle_color(cell_index_x, cell_index_y, cell_index_x + game_cell_size, cell_index_y + game_cell_size, can_plant_color, can_plant_color,can_plant_color,can_plant_color, true);

//Draw the crop to be planted
draw_sprite(spr_crops_picked,select_crop, cell_index_x + (game_cell_size/2), cell_index_y + (game_cell_size/2));