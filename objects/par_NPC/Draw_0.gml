/// @description Insert description here
// You can write your code in this editor
var animation_frames = 9;
var sprite_size = 64;
var animation_speed = 12;

if      (next_move_x < 0)	current_y_frame = 9;
else if (next_move_x > 0)	current_y_frame = 11;
else if (next_move_y < 0)   current_y_frame = 8;
else if (next_move_y > 0)   current_y_frame = 10;
else						current_x_frame = 0;

var x_draw = x-x_offset;
var y_draw = y-y_offset;



//INCREMENT FRAME FOR ANIMATION
if(current_x_frame + (animation_speed/60) < animation_frames -1){
	current_x_frame += animation_speed / 60;
}else{
	current_x_frame = 1;
}


//DRAW CHARACTER BASE
if(spr_base){
	draw_sprite_part(
		spr_base,0, 
		floor(current_x_frame) * sprite_size, 
		current_y_frame * sprite_size,
		sprite_size,sprite_size,
		x_draw,y_draw
	);

}

//DRAW CHARACTER FEET
if(spr_feet){
	draw_sprite_part(
		spr_feet,0, 
		floor(current_x_frame) * sprite_size, 
		current_y_frame * sprite_size,
		sprite_size,sprite_size,
		x_draw,y_draw
	);

}

//DRAW CHARACTER LEGS
if(spr_legs){
	draw_sprite_part(
		spr_legs,0, 
		floor(current_x_frame) * sprite_size, 
		current_y_frame * sprite_size,
		sprite_size,sprite_size,
		x_draw,y_draw
	);
}


//DRAW CHARACTER SHIRT
if(spr_torso){
	draw_sprite_part(
		spr_torso,0, 
		floor(current_x_frame) * sprite_size, 
		current_y_frame * sprite_size,
		sprite_size,sprite_size,
		x_draw,y_draw
	);
}

//DRAW CHARACTER HAIR
if(spr_hair){
	draw_sprite_part(
		spr_hair,0, 
		floor(current_x_frame) * sprite_size, 
		current_y_frame * sprite_size,
		sprite_size,sprite_size,
		x_draw,y_draw
	);

}

//DRAW CHARACTER SHADOW
if(spr_shadow) {
	draw_sprite(spr_shadow,0,x, y);
}
