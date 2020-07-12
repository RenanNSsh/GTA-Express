/// @description Insert description here
// You can write your code in this editor

name = names[page];
voice = voices[page];
portrait_index = portraits[page];

if(!is_array(text[page])){
	text_wrapped = string_wrap(text[page],text_max_width); 
	text_length = string_length(text_wrapped);
	choice_dialogue = false;
}else{
	choices_array = text[page];
	choices_array_length = array_length_1d(choices_array)
	choice_dialogue = true;
}
counter_text = 0; 