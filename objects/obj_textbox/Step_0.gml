/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(interact_key)){
	if(!choice_dialogue && counter_text < text_length){
		counter_text = text_length; 
	}else if(page < array_length_1d(text) -1){
		var line = next_line[page];
		
		if(choice_dialogue) line = line[choice]
		
		if(line == 0) page++;
		else if(line == -1){ instance_destroy(); exit;}
		else page = line;
		
		event_perform(ev_other, ev_user1);
	}else{
		instance_destroy();
	}
}

if(choice_dialogue){
	choice += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	
	if(choice > choices_array_length-1){
		choice = 0;
	}
	if(choice < 0) choice = choices_array_length-1;
}