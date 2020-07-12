/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("T"))){
	time_pause = !time_pause;
}

if(time_pause) exit;

//Increment Time
seconds += time_increment;
minutes = seconds/60;
hours = minutes/60;

if(draw_daylight){
	#region Phases and Colors
	var darks, colours, phase_start, phase_end;
	if(hours > phase.sunrise && hours <= phase.daytime){				//Sunrise
		darks = [max_darkness, 0.2];
		colours = [merge_color(c_black, c_navy, 0.3), c_orange];
		phase_start = phase.sunrise;
		phase_end = phase.daytime;
	}else if(hours > phase.daytime && hours <= phase.sunset){		//Day
		darks = [0.2,0,0,0, 0.2];
		colours = [c_orange,c_orange, c_white, c_orange,c_orange];
		phase_start = phase.daytime;
		phase_end = phase.sunset;
	}else if(hours > phase.sunset && hours <= phase.nighttime){	//Sunset
		darks = [0.2, max_darkness];
		colours = [ c_orange, c_navy, merge_color(c_black, c_navy, 0.3)];
		phase_start = phase.sunset;
		phase_end = phase.nighttime;
	}else{									//Night
		darks = [max_darkness];
		colours = [merge_color(c_black, c_navy, 0.3)];
		phase_start = phase.nighttime;
		phase_end = phase.sunrise;
	}
	#endregion
	
	#region Alter Darkness and Colours Depending on Time
		//Colours
		if(phase_start == phase.nighttime) {light_colour = colours[0];}
		else{
			
			var current_color = ((hours - phase_start) / (phase_end - phase_start))*(array_length_1d(colours)-1);
			var color1 = colours[floor(current_color)];
			var color2 = colours[ceil(current_color)];
		
			light_colour = merge_color(color1, color2, current_color - floor(current_color));
		}
		//Darkness
		if(phase_start == phase.nighttime) {darkness = darks[0];}
		else{
		
			var current_dark_color = ((hours - phase_start) / (phase_end - phase_start))*(array_length_1d(darks)-1);
			var color_dark_1 = darks[floor(current_dark_color)];
			var color_dark_2 = darks[ceil(current_dark_color)];
		
			darkness = merge_number(color_dark_1, color_dark_2, current_dark_color - floor(current_dark_color));
			show_debug_message(darkness);
		}
	#endregion
}

#region Cycle Check
if(hours >= 24){
	seconds = 0;
	day++;
	with(crops){
		event_perform(ev_other,ev_user1);
	}
	if(day > 30){
		day = 1;
		season++;
		if(season > 4){
			season = 1;
			year++;
		}
	}
}
#endregion