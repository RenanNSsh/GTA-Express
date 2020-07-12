/// @description Insert description here
// You can write your code in this editor
collideable = false;

cell_size = 32;
items_sprite = spr_inventory_items;
sprite_items_width = sprite_get_width(items_sprite);
sprite_items_height = sprite_get_height(items_sprite);

item_index = -1;
x_frame = 0;
y_frame = 0;

x_offset = cell_size / 2;
y_offset = cell_size * (2/3);

drop_move = true;
var item_direction = irandom_range(0,259);
var distance_fly = 32;
goal_x = x + lengthdir_x(distance_fly, item_direction);
goal_y = y + lengthdir_y(distance_fly, item_direction);