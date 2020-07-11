/// @description Insert description here
// You can write your code in this editor

//---------------COLLISION CHECKS
//HORIZONTAL
var horizontal_colission = place_meeting(x+next_move_x, y, obj_collision);
if(horizontal_colission){
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


//VERTICAL
var vertical_colission = place_meeting(x, y+next_move_y, obj_collision);
if(vertical_colission){
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

//---------------APPLY MOVEMENT
x += next_move_x;
y += next_move_y;