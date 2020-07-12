/// @description Insert description here
// You can write your code in this editor

seconds = 0;
minutes = 0;
hours = 0;

day = 1;
season = 1;
year = 1;

time_increment = 100; // seconds per step
time_pause = true;

max_darkness = 0.7;
darkness = 0;
light_colour = c_black;
draw_daylight = false;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

enum phase{
	sunrise = 6,
	daytime = 8.5,
	sunset = 18,
	nighttime = 22,
}