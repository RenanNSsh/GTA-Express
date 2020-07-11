/// @description Insert description here
// You can write your code in this editor

next_move_x = 0;
next_move_y = 0;

var idle = choose(0,1);
if(!idle){
	var character_direction = choose(1,2,3,4);
	switch(character_direction){
		case 1: next_move_x = -character_speed; break;
		case 2: next_move_x =  character_speed; break;
		case 3: next_move_y = -character_speed; break;
		case 4: next_move_y =  character_speed; break;
	}
}

alarm[1] = random_range(2.5, 4) * room_speed;