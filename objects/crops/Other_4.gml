/// @description Insert description here
// You can write your code in this editor

if(room == rm_farm_field){
	ds_crops_instances = ds_grid_create(room_width div cell_size, room_height div cell_size);
	ds_grid_clear(ds_crops_instances,-1);
	
	//Respawn the crops
	if(ds_crops_data[# 0, 0] != -1){
		var crops_num = ds_grid_height(ds_crops_data);
		for(var slot = 0; slot < crops_num; slot++){
			respawn_crop(
				ds_crops_data[# 0, slot],
				ds_crops_data[# 1, slot],
				ds_crops_data[# 2, slot],
				ds_crops_data[# 3, slot],
				ds_crops_data[# 4, slot],
			);
		}
		with(obj_crop){
			days_old++;
			if(growth_stage < max_growth_stage){
			
				if(growth_stage_duration != 0){
					var next_growth_stage = days_old div growth_stage_duration;
					if(next_growth_stage <= max_growth_stage){
						growth_stage = next_growth_stage;
					}else{
						growth_stage = max_growth_stage;
					}
					
				}
			
			}else{
				growth_stage = max_growth_stage;
				fully_growth = true;
				alarm[1] = 1;
			}
		
		}
	}
}