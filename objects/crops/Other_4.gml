/// @description Insert description here
// You can write your code in this editor
if(room == rm_farm_field && ds_crops_instances == -1){
	ds_crops_instances = ds_grid_create(room_width div cell_size, room_height div cell_size);
}