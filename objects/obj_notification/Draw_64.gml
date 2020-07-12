/// @description Insert description here
// You can write your code in this editor

//Draw Notifications

var notification_grid = ds_notifications;
var notification_amount = ds_grid_height(ds_notifications);
for(var notification_index = 0; notification_index< notification_amount; notification_index++){
	
	var notification_sign = "";
	if(notification_grid[# 0, notification_index] > 0){
		notification_sign = "+"
	}
	
	draw_set_font(font);
	draw_text_color(
		notification_x, 
		notification_y + (notification_index * offset_notification_height)-(notification_amount*offset_notification_height),
		notification_sign + string(notification_grid[# 0, notification_index]) + " " + string(notification_grid[# 1, notification_index]),
		notification_color,
		notification_color,
		notification_color,
		notification_color,
		not_alpha
	);
	draw_set_font(fnt_text_12);
}

//Fade Away
if(fade_away){
	not_alpha -= 0.1
}

if(not_alpha <= 0) instance_destroy();