/// @description Insert description here
// You can write your code in this editor
textbox = spr_textbox;
portrait_frame = spr_portrait_frame;
portrait = spr_portraits;
namebox = spr_namebox;

textbox_width = sprite_get_width(textbox);
textbox_height = sprite_get_height(textbox);
portrait_width = sprite_get_width(portrait);
portrait_height = sprite_get_height(portrait);
namebox_width = sprite_get_width(namebox);
namebox_height = sprite_get_height(namebox);

x_buffer_text = 12;
y_buffer_text = 8;

portrait_x = (global.game_width - textbox_width - portrait_width) / 2;
portrait_y = (global.game_height * 0.98) - portrait_height;
textbox_x = portrait_x+portrait_width;
textbox_y = portrait_y;
namebox_x = portrait_x;
namebox_y = textbox_y - namebox_height;
text_x = textbox_x + x_buffer_text;
text_y = textbox_y + y_buffer_text;
name_text_x = namebox_x + (namebox_width / 2)
name_text_y = namebox_y + (namebox_height / 2);

text_max_width = textbox_width - (2*x_buffer_text);
text_height = string_height("M");
pause_text = false; 

text[0] = ""   
voice = snd_voice1;
page = 0;
name = ""
counter_text = 0;
portrait_index = 0;


interact_key = vk_space;

text_color = c_black;
name_text_color = c_black;
font = fnt_text_12;