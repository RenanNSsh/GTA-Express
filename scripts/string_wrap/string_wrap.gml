///@description string_wrap
///@arg string
///@arg max_width

var text = argument0;
var max_width = argument1;

var text_length = string_length(text);
var last_space = 1;
var substring_text;

for(var letter_index = 0; letter_index < text_length; letter_index++){
	substring_text = string_copy(text,1,letter_index);
	if(string_char_at(text,letter_index) == " "){
		last_space = letter_index;
	}
	if(string_width(substring_text) > max_width){
		text = string_delete(text, last_space,1);
		text = string_insert("\n",text,last_space); 
	}
}

return text;