/// @description Insert description here
// You can write your code in this editor
fade_away = false;
not_alpha = 1;
alarm[0] = room_speed * 1.5;

ds_notifications = -1;

font = fnt_text_12;
offset_notification_height = string_height("M") + 5;
gui_height = display_get_gui_height();
notification_x = 100;
notification_y = (gui_height/2);
notification_color = c_white;