/// @description Insert description here
// You can write your code in this editor
if(draw_daylight){
	var color = light_colour;
	draw_set_alpha(darkness);
	draw_rectangle_color(0,0,gui_width, gui_height, color, color, color, color,	false );
	draw_set_alpha(1);
}

var color = c_white;
draw_text_color(10,10,string(seconds),color,color,color,color,1);
draw_text_color(10,30,string(minutes),color,color,color,color,1);
draw_text_color(10,50,string(hours),color,color,color,color,1);
draw_text_color(10,70,string(day),color,color,color,color,1);
draw_text_color(10,90,string(season),color,color,color,color,1);
draw_text_color(10,110,string(year),color,color,color,color,1);