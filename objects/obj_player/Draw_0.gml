/// @description Insert description here
// You can write your code in this editor
var animation_frames = 9;
var sprite_size = 64;
var animation_speed = 12;

switch(facing){
	case dir.left:   current_y_frame = 9; break;
	case dir.right:  current_y_frame = 11; break;
	case dir.up:     current_y_frame = 8; break;
	case dir.down:   current_y_frame = 10; break;
	case -1:		 current_x_frame = 0; break;
}

var x_draw = x-x_offset;
var y_draw = y-y_offset;

//INCREMENT FRAME FOR ANIMATION
if(current_x_frame + (animation_speed/60) < animation_frames -1){
	current_x_frame += animation_speed / 60;
}else{
	current_x_frame = 1;
}


//DRAW CHARACTER BASE
draw_sprite_part(
	spr_base,0, 
	floor(current_x_frame) * sprite_size, 
	current_y_frame * sprite_size,
	sprite_size,sprite_size,
	x_draw,y_draw
);

//DRAW CHARACTER FEET
draw_sprite_part(
	spr_feet,0, 
	floor(current_x_frame) * sprite_size, 
	current_y_frame * sprite_size,
	sprite_size,sprite_size,
	x_draw,y_draw
);

//DRAW CHARACTER LEGS
draw_sprite_part(
	spr_legs,0, 
	floor(current_x_frame) * sprite_size, 
	current_y_frame * sprite_size,
	sprite_size,sprite_size,
	x_draw,y_draw
);

//DRAW CHARACTER SHIRT
draw_sprite_part(
	spr_torso,0, 
	floor(current_x_frame) * sprite_size, 
	current_y_frame * sprite_size,
	sprite_size,sprite_size,
	x_draw,y_draw
);

//DRAW CHARACTER HAIR
draw_sprite_part(
	spr_hair,0, 
	floor(current_x_frame) * sprite_size, 
	current_y_frame * sprite_size,
	sprite_size,sprite_size,
	x_draw,y_draw
);

//DRAW CHARACTER SHADOW
draw_sprite(spr_shadow,0,x, y);

