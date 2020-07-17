/// @description Insert description here
// You can write your code in this editor
if(room == rm_farm_field){
	if(instance_exists(obj_crop) ){
		with(obj_crop){
			
			days_old++;
			if(growth_stage_duration != 0){
				growth_stage = days_old div growth_stage_duration;
			}
			
			if(growth_stage >= max_growth_stage){
				growth_stage = max_growth_stage;
				fully_growth = true;
				alarm[1] = 1;
			}
		
		}
	}
} else if(ds_crops_data[# 0, 0] != -1){
	var crops_amount = ds_grid_height(ds_crops_data);
	for(var crop = 0; crop < crops_amount; crop++){
		ds_crops_data[# 3, crop]++;
	}
}
