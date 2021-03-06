/// @description Insert description here
// You can write your code in this editor
collideable = true;

walk_speed = 3;
normal_speed = 5;
run_speed = 8;
player_speed = normal_speed;


//Animation Properties
current_x_frame = 1;
current_y_frame = 8;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_base = spr_base_male_1;
spr_feet = spr_feet_male_boots_black;
spr_legs = spr_legs_male_pants_teal;
spr_torso = spr_torso_male_shirt_white;
spr_hair = spr_hair_male_messy_raven;
spr_shadow = spr_character_shadow;

active_textbox = noone;

facing = 0;
collision_radius = 16;
portrait_index = 7;
voice = snd_voice1;
name = inventory.ds_player_info[# 1, 3];