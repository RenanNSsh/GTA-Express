/// @description Insert description here
// You can write your code in this editor

if(!can_move) exit;

//---------------COLLISION CHECKS

//HORIZONTAL
var horizontal_collision_object = instance_place(x+next_move_x, y, obj_collision);

if(horizontal_collision_object != noone){
	var is_collideable;
	with(horizontal_collision_object){
		is_collideable = collideable;
	}
	if(is_collideable){
		repeat(abs(next_move_x)){
			var horizontal_colission_pixel = place_meeting( x + sign(next_move_x), y, obj_collision);
			if(!horizontal_colission_pixel){
				x+=sign(next_move_x);
			}else{
				break;
			}
		}
		next_move_x = 0
	}
}


//VERTICAL
var vertical_collision_object = instance_place(x, y+next_move_y, obj_collision);
if(vertical_collision_object != noone){
	
	var is_collideable_vertical;
	with(vertical_collision_object){
		is_collideable_vertical = collideable;
	}
	if(is_collideable_vertical){
		repeat(abs(next_move_y)){
			var vertical_colission_pixel = place_meeting( x , y + sign(next_move_y), obj_collision);
			if(!vertical_colission_pixel){
				y+=sign(next_move_y);
			}else{
				break;
			}
		}
		next_move_y = 0
	}
}


//---------------APPLY MOVEMENT
x += next_move_x;
y += next_move_y;