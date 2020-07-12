/// @description Insert description here
// You can write your code in this editor
event_inherited();

spr_base = spr_base_female_2;
spr_feet = spr_feet_female_longboots_brown
spr_legs = spr_legs_female_pants_magenta;
spr_torso = spr_torso_female_sleeveless_red;
spr_hair = spr_hair_female_ponytail_raven;
spr_shadow = spr_character_shadow;

portrait_index = 4;
voice = snd_voice2;
name = "Sophia"
text = [
		"Hey, what's your name?",
		["I'm the Player. i'm kind of a big deal", "I'm a Voltorb"],
		"Right...",
		"Don't explode pls.",
		];
speakers = [id,obj_player,id,id];
next_line = [0,[2,3],-1,-1]