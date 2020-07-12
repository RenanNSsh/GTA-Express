///@description create_textbox
///@arg text
///@arg speakers

var textbox = instance_create_layer(0,0,"Text",obj_textbox);

with(textbox){
	text = argument[0];
	speakers = argument[1];
	
	var amount_speaker = array_length_1d(speakers);
	for(var speaker_index = 0; speaker_index < amount_speaker; speaker_index++){
		names[speaker_index] = speakers[speaker_index].name;
		portraits[speaker_index] = speakers[speaker_index].portrait_index;
		voices[speaker_index] = speakers[speaker_index].voice;
	}	
	event_perform(ev_other, ev_user1);
}


return textbox;