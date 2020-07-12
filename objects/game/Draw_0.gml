/// @description Insert description here
// You can write your code in this editor
if(!debug) exit;

with(obj_collision){
	draw_rectangle_color(bbox_left,bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red,true);
}


draw_set_alpha(0.3);

var cell_size = crops.cell_size;

var room_rows = current_room_width div cell_size;
var row = 0;
for(var row_index = 0; row_index < room_rows; row_index ++){
	draw_line_color(row, 0, row, current_room_height, c_white, c_white);
	row += cell_size;
}

var column = 0;
var room_columns = current_room_height div cell_size;
for(var column_index = 0; column_index < room_columns; column_index++){
	draw_line_color(0, column, current_room_width, column, c_white, c_white);
	column += cell_size;
}


draw_set_alpha(1);