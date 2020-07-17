//@arg sprite_inventory

draw_sprite_ext(sprite_inventory_UI,
	0,
	inventory_UI_x,
	inventory_UI_y,
	inventory_UI_scale,
	inventory_UI_scale,
	0,
	c_white,
	1
);


var text_color = c_black;
var position_x_slot;
var position_y_slot;
var inventory_item;
var sprite_x;
var sprite_y;
var inventory_grid = ds_inventory;

for(var slot = 0, inventory_row = 0, inventory_column = 0; slot < inventory_slots_width; ){
	//x,y location for slot
	position_x_slot = inventory_quick_slot_x + ((x_buffer_between_slots + cell_size) * inventory_column * inventory_UI_scale);
	position_y_slot = inventory_quick_slot_y + ((y_buffer_between_slots + cell_size) * inventory_row * inventory_UI_scale);
	
	//Item
	//The index 0 of inventory contains the index of the item, example: tomato = 1
	inventory_item = inventory_grid[# 0, slot];
	sprite_x = (inventory_item mod inventory_items_columns_sprite) * cell_size;
	sprite_y = (inventory_item div inventory_items_columns_sprite) * cell_size;
	
	//Draw Slot and Item
	draw_sprite_part_ext(
		sprite_inventory_UI_opened,
		0,
		0,
		0,
		cell_size,
		cell_size,
		position_x_slot, 
		position_y_slot, 
		inventory_UI_scale,
		inventory_UI_scale,
		c_white,
		1
	);
	
	switch(slot){
		case hover_slot:
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
					inventory_UI_scale, 
					inventory_UI_scale,
					c_white,
					1
				);
				gpu_set_blendmode(bm_add);
				draw_sprite_part_ext(
					sprite_inventory_UI_opened,
					0,
					0,
					0,
					cell_size,
					cell_size,
					position_x_slot, 
					position_y_slot, 
					inventory_UI_scale,
					inventory_UI_scale,
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
							inventory_UI_scale, 
							inventory_UI_scale,
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
					inventory_UI_scale, 
					inventory_UI_scale,
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


if(selected_slot != -1){
	var position_x_selected_slot = inventory_quick_slot_x + ((x_buffer_between_slots + cell_size) * selected_slot * inventory_UI_scale);
	var position_y_selected_slot = inventory_quick_slot_y + ((cell_size -1 ) * inventory_UI_scale);
	draw_rectangle_color(
		position_x_selected_slot,
		inventory_quick_slot_y,
		position_x_selected_slot + ((cell_size -1) * inventory_UI_scale),
		position_y_selected_slot,
		selected_slot_color,
		selected_slot_color,
		selected_slot_color,
		selected_slot_color,
		true
	);
}

