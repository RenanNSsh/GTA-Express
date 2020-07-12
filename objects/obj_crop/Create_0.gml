/// @description Insert description here
// You can write your code in this editor

frame_width = 32;
frame_height = 64;

crop_type = 0;
days_old = 0;
growth_stage = 0;
growth_stage_duration = 0;
max_growth_stage = (sprite_get_width(spr_crops)/frame_width)-1;
fully_growth = false;
sparkle = -1;

x_offset_corrected = x - (frame_width / 2) + 2;
y_offset_corrected = y - frame_height + 6