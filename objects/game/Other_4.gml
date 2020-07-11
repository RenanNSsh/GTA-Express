/// @description Insert description here
// You can write your code in this editor
if(!spawn_room) exit;
obj_player.x = spawn_x;
obj_player.y = spawn_y;
obj_player.facing = spawn_player_facing;

with(obj_player){
	switch(facing){
		case dir.left:   current_y_frame = 9; break;
		case dir.right:  current_y_frame = 11; break;
		case dir.up:     current_y_frame = 8; break;
		case dir.down:   current_y_frame = 10; break;
		case -1:		 current_x_frame = 0; break;
	}
}
