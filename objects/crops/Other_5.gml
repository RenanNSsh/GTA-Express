/// @description Insert description here
// You can write your code in this editor
if(room == rm_farm_field){
	var crops_num = instance_number(obj_crop);
	if(crops_num == 0){
		ds_grid_clear(ds_crops_data,-1);
	}else{
		ds_grid_resize(ds_crops_data, ds_grid_width(ds_crops_data), crops_num);
		
		var grid_width = ds_grid_width(ds_crops_instances);
		var grid_height = ds_grid_height(ds_crops_instances);
		var slot = 0;
		
		for(var row = 0; row < grid_width; row++){
			for(var column = 0; column < grid_height; column++){
				var crop_instance = ds_crops_instances[# row, column];
				if(crop_instance){
					ds_crops_data[# 0, slot] = row;
					ds_crops_data[# 1, slot] = column;
					ds_crops_data[# 2, slot] = crop_instance.crop_type;
					ds_crops_data[# 3, slot] = crop_instance.days_old;
					
					slot++;
				}
			}
		}
	}
	
	ds_grid_destroy(ds_crops_instances);
}