/// @description Insert description here
// You can write your code in this editor

//Draw Box
draw_sprite(textbox, 0, textbox_x,textbox_y);


//Draw Portrait Back
draw_sprite(portrait_frame, 0, portrait_x,portrait_y);


//Draw Portrait 
draw_sprite(portrait, 0, portrait_x,portrait_y);


//Draw Portrait Frame
draw_sprite(portrait_frame, 1, portrait_x,portrait_y);


//Draw Namebox
draw_sprite(namebox, 0, namebox_x,namebox_y);


//-----TEXT
draw_set_font(font);
//Draw Name
draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_text_color(name_text_x,name_text_y,name,text_color,name_text_color,name_text_color,text_color,1);
	
draw_set_halign(fa_left); draw_set_valign(fa_top);

//Draw Text
draw_text_ext_color(text_x,text_y,text[page],text_height,text_max_width,text_color,text_color,text_color,text_color,1);

