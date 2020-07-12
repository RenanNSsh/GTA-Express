/// @description Insert description here
// You can write your code in this editor
if(!show_inventory) exit;

//--------Inventory Back
	draw_sprite_part_ext(
		sprite_inventory_UI, 
		0, 
		cell_size, 
		0,
		inventory_UI_width,
		inventory_UI_height,
		inventory_UI_x,
		inventory_UI_y,
		scale,
		scale,
		c_white, 1
	);

var player_info = ds_player_info;

draw_set_font(fnt_text_24);
var text_color = c_black;
draw_text_color(
	user_name_x, 
	user_name_y, 
	player_info[# 0,3] + ": " + player_info[# 1, 3], 
	text_color,
	text_color,
	text_color,
	text_color,
	1
);

draw_set_font(fnt_smalldigits);
draw_text_color(
	player_info[# 1,0] < 10 ? user_gold_x +  (2 * scale) : user_gold_x, 
	user_gold_y, 
	player_info[# 1,0], 
	text_color,
	text_color,
	text_color,
	text_color,
	1
);

draw_text_color(
	player_info[# 1,1] < 10 ? user_silver_x + (2 * scale) : user_silver_x, 
	user_silver_y, 
	player_info[# 1,1], 
	text_color,
	text_color,
	text_color,
	text_color,
	1
);

draw_text_color(
	player_info[# 1,2] < 10 ? user_copper_x + (2 * scale) : user_copper_x, 
	user_copper_y, 
	player_info[# 1,2], 
	text_color,
	text_color,
	text_color,
	text_color,
	1
);

draw_set_font(fnt_text_12);

#region Inventory
var position_x_slot;
var position_y_slot;
var inventory_item;
var sprite_x;
var sprite_y;
var inventory_grid = ds_inventory;

for(var slot = 0, inventory_row = 0, inventory_column = 0; slot < inventory_slots; ){
	//x,y location for slot
	position_x_slot = inventory_slot_x + ((x_buffer_between_slots + cell_size) * inventory_column * scale);
	position_y_slot = inventory_slot_y + ((y_buffer_between_slots + cell_size) * inventory_row * scale);
	
	//Item
	//The index 0 of inventory contains the index of the item, example: tomato = 1
	inventory_item = inventory_grid[# 0, slot];
	sprite_x = (inventory_item mod inventory_items_columns_sprite) * cell_size;
	sprite_y = (inventory_item div inventory_items_columns_sprite) * cell_size;
	
	//Draw Slot and Item
	draw_sprite_part_ext(
		sprite_inventory_UI,
		0,
		0,
		0,
		cell_size,
		cell_size,
		position_x_slot, 
		position_y_slot, 
		scale,
		scale,
		c_white,
		1
	);
	
	switch(slot){
		case selected_slot:
			if(inventory_item > 0){
		
				draw_sprite_part_ext(
					sprite_inventory_items, 
					0, 
					sprite_x, 
					sprite_y, 
					cell_size, 
					cell_size,
					position_x_slot, 
					position_y_slot, 
					scale, 
					scale,
					c_white,
					1
				);
				gpu_set_blendmode(bm_add);
				draw_sprite_part_ext(
					sprite_inventory_UI,
					0,
					0,
					0,
					cell_size,
					cell_size,
					position_x_slot, 
					position_y_slot, 
					scale,
					scale,
					c_white,
					.3
				);
				gpu_set_blendmode(bm_normal);
	
			}
			break;
		case pickup_slot:
			if(inventory_item > 0){
		
						draw_sprite_part_ext(
							sprite_inventory_items, 
							0, 
							sprite_x, 
							sprite_y, 
							cell_size, 
							cell_size,
							position_x_slot, 
							position_y_slot, 
							scale, 
							scale,
							c_white,
							0.2
						);
					}
		break;
		
		default: 
			if(inventory_item > 0){
		
				draw_sprite_part_ext(
					sprite_inventory_items, 
					0, 
					sprite_x, 
					sprite_y, 
					cell_size, 
					cell_size,
					position_x_slot, 
					position_y_slot, 
					scale, 
					scale,
					c_white,
					1
				);
			}
	}
		
	//Draw Item Number
	if(inventory_item > 0){
		var item_amount = inventory_grid[# 1, slot];
		draw_text_color(position_x_slot, position_y_slot, string(item_amount),text_color,text_color,text_color,text_color,1);
	}
	
	//Increment
	slot++
	inventory_column = slot mod inventory_slots_width;
	inventory_row = slot div inventory_slots_width;
}

//Draw Item Description
var info_grid = ds_items_info;
var description = "";
var inventory_selected_item = inventory_grid[# 0, selected_slot]
if(inventory_selected_item > 0){
	description = info_grid[# 0, inventory_selected_item] + ". " + info_grid[# 1, inventory_selected_item];
	draw_set_font(fnt_text_12);
	draw_text_ext_color(description_position_x,description_position_y,description,string_height("M"),(inventory_UI_width * scale) - (x_buffer_between_slots * 2),text_color,text_color,text_color,text_color,1);
}


if(pickup_slot != -1){
	//Item
	//The index 0 of inventory contains the index of the item, example: tomato = 1
	inventory_item = inventory_grid[# 0, pickup_slot];
	sprite_x = (inventory_item mod inventory_items_columns_sprite) * cell_size;
	sprite_y = (inventory_item div inventory_items_columns_sprite) * cell_size;
	draw_sprite_part_ext(
		sprite_inventory_items, 
		0, 
		sprite_x, 
		sprite_y, 
		cell_size, 
		cell_size,
		mouse_x_gui, 
		mouse_y_gui, 
		scale, 
		scale,
		c_white,
		1
	);
	
	var item_amount = inventory_grid[# 1, pickup_slot];
	draw_text_color(mouse_x_gui + (cell_size /2 * scale), mouse_y_gui, string(item_amount),text_color,text_color,text_color,text_color,1);

}

#endregion