/// @description Insert description here
// You can write your code in this editor

//Draw Box
draw_sprite(textbox, 0, textbox_x,textbox_y);


//Draw Portrait Back
draw_sprite(portrait_frame, 0, portrait_x,portrait_y);


//Draw Portrait 
draw_sprite(portrait, portrait_index, portrait_x,portrait_y);


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

if(!choice_dialogue){
	//Draw Text
	if(!pause_text && counter_text < text_length){
		counter_text++;
		if(counter_text mod 4 == 0){
			audio_play_sound(voice,10,false);
		}
	
		switch(string_char_at(text_wrapped, counter_text)){
			case ",": pause_text = true; alarm[1] = 25; break;
			case ".": 
			case "!":
			case "?": pause_text = true; alarm[1] = 35; break;
			default:  pause_text = true; alarm[1] = 2;
		
		}
	 
	}

	var substr_text = string_copy(text_wrapped, 1, counter_text);

	draw_text_color(text_x,text_y,substr_text,text_color,text_color,text_color,text_color,1);

}else{
	for(var choice_index = 0, text_y_offset = 0; choice_index < choices_array_length; choice_index++){
		var text_choice_color = text_color;
		if(choice == choice_index){
			text_choice_color = choice_color;
			draw_text_color(textbox_x+text_max_width, text_y+text_y_offset, "<",text_choice_color,text_choice_color,text_choice_color,text_choice_color,1);
		}else{
			text_choice_color = text_color;
		}
		
		draw_text_ext_color(text_x,text_y+ text_y_offset,choices_array[choice_index],text_height, text_max_width, text_choice_color,text_choice_color,text_choice_color,text_choice_color,1);
		text_y_offset += string_height_ext(choices_array[choice_index], text_height, text_max_width);
	}
}