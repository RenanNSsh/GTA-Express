/// @description Insert description here
// You can write your code in this editor

//Resize Grid
var instances_number = instance_number(par_depthobject);
var depth_grid = ds_depthgrid;

ds_grid_resize(depth_grid, 2, instances_number);

//Add instances to the grid
var y_position = 0;
with(par_depthobject){
	depth_grid[# 0, y_position] = id;
	depth_grid[# 1, y_position] = y;
	y_position++;
}

//Sort the grid in ascending order
ds_grid_sort(depth_grid,1,true);

//Loop through the grid and draw all the instances

var instance;
for(var row = 0; row < instances_number; row++){
	//pull out an ID
	instance = depth_grid[# 0, row];
	
	//draw yourself
	with(instance){
		event_perform(ev_draw, 0);
	}
}
