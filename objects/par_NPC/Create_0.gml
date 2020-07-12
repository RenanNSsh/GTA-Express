/// @description Insert description here
// You can write your code in this editor
collideable = true;

walk_speed = 1;
normal_speed = 2;
run_speed = 3;
character_speed = walk_speed;

next_move_x = 0;
next_move_y = 0;



//Animation Properties
current_x_frame = 1;
current_y_frame = 8;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_base = 0;
spr_feet = 0;
spr_legs = 0;
spr_torso = 0;
spr_hair = 0;
spr_shadow = 0;

can_move = true;


//Random movement
alarm[1] = 1;

portrait_index = 0;
voice = snd_voice1;
name = "Anonymous"
text = ["This person has nothing to say."];
speakers = [id];
next_line = [0];