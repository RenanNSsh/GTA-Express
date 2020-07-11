///@description create_crop_type
///@arg growth_stage_duration
///@arg cost

var argument_number = argument_count;
var crop_row = 1;

if(!ds_exists(ds_crops_types,ds_type_grid)){
	ds_crops_types = ds_grid_create(argument_number,1);
}else{
	crop_row = ds_grid_height(ds_crops_types);
	ds_grid_resize(ds_crops_types, argument_number, crop_row+1);
	crop_row++;	
}

for(var crop_property = 0; crop_property < argument_number; crop_property++){
	ds_crops_types[# crop_property, crop_row] = argument[crop_property];
}
