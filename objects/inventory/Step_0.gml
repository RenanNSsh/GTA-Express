/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("I"))){
	show_inventory = !show_inventory;
}

if(!show_inventory) exit;

#region Mouse Slot
mouse_x_gui = device_mouse_x_to_gui(0);
mouse_y_gui = device_mouse_y_to_gui(0);

var cell_x_with_buff_between_slots = (cell_size + x_buffer_between_slots) * scale;
var cell_y_with_buff_between_slots = (cell_size + y_buffer_between_slots) * scale;

var mouse_x_inventory = mouse_x_gui - inventory_slot_x;
var mouse_y_inventory = mouse_y_gui - inventory_slot_y;

var slot_hover_x = mouse_x_inventory div cell_x_with_buff_between_slots;
var slot_hover_y = mouse_y_inventory div cell_y_with_buff_between_slots;

if(slot_hover_x >= 0 && slot_hover_x < inventory_slots_width && slot_hover_y >= 0 && slot_hover_y < inventory_slots_height){
	var slot_x = mouse_x_inventory - (slot_hover_x * cell_x_with_buff_between_slots)
	var slot_y = mouse_y_inventory - (slot_hover_y * cell_x_with_buff_between_slots)
	
	if((slot_x < cell_size * scale) && (slot_y < cell_size * scale)){
		mouse_x_slot = slot_hover_x;
		mouse_y_slot = slot_hover_y;
	}
}

//Set Selected Slot to Mouse Position
selected_slot = min(inventory_slots -1, mouse_x_slot + (mouse_y_slot*inventory_slots_width));
#endregion

//Pickup Item

var inventory_grid = ds_inventory;
var selected_slot_item = inventory_grid[# 0, selected_slot];

if(pickup_slot != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(selected_slot_item == items.none){
			inventory_grid[# 0, selected_slot] = inventory_grid[# 0, pickup_slot];
			inventory_grid[# 1, selected_slot] = inventory_grid[# 1, pickup_slot];
			
			inventory_grid[# 1, pickup_slot] = 0;
			inventory_grid[# 0, pickup_slot] = items.none;
			pickup_slot = -1;
		}else if(selected_slot_item == inventory_grid[# 0, pickup_slot]){
			if(selected_slot != pickup_slot){	
				inventory_grid[# 1, selected_slot] += inventory_grid[# 1, pickup_slot];
			
				inventory_grid[# 1, pickup_slot] = 0;
				inventory_grid[# 0, pickup_slot] = items.none;
				
			}
			pickup_slot = -1;
		}else{
			var selected_slot_item_num = inventory_grid[# 1, selected_slot];	
			
			
			inventory_grid[# 0, selected_slot] = inventory_grid[# 0, pickup_slot];
			inventory_grid[# 1, selected_slot] = inventory_grid[# 1, pickup_slot];
			
			inventory_grid[# 1, pickup_slot] = selected_slot_item_num;
			inventory_grid[# 0, pickup_slot] = selected_slot_item;
		}
	}
}else if(selected_slot_item != items.none){
	
	//Drop Item into Game World
	if(mouse_check_button_pressed(mb_middle)){
		inventory_grid[# 1, selected_slot] -= 1;
		
		//destroy item in inventory if it was the last one
		if(inventory_grid[# 1, selected_slot] == 0){
			inventory_grid[# 0, selected_slot] = items.none;
		}
		
		//create the item
		var dropped_item = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_dropped_item);
		with(dropped_item){
			item_index = selected_slot_item;
			x_frame = item_index mod (sprite_items_width / cell_size);
			y_frame = item_index div (sprite_items_width / cell_size);
		}
		show_debug_message("Dropped an item.");
		
	}
	
	//Drop Pickup Item into new Slot
	if(mouse_check_button_pressed(mb_right)){
		pickup_slot = selected_slot;
	}
}