
#region Mouse Slot
mouse_x_gui = device_mouse_x_to_gui(0);
mouse_y_gui = device_mouse_y_to_gui(0);

var cell_x_with_buff_between_slots = (cell_size + x_buffer_between_slots) * scale;
var cell_y_with_buff_between_slots = (cell_size + y_buffer_between_slots) * scale;

var mouse_x_inventory = mouse_x_gui - inventory_slot_x;
var mouse_y_inventory = mouse_y_gui - inventory_slot_y;

var slot_hover_x = mouse_x_inventory div cell_x_with_buff_between_slots;
var slot_hover_y = mouse_y_inventory div cell_y_with_buff_between_slots;

var mouse_in_inventory = true;
if(mouse_x_gui >= inventory_slot_x && slot_hover_x < inventory_slots_width && mouse_y_gui >= inventory_slot_y && slot_hover_y < inventory_slots_height){
	var slot_x = mouse_x_inventory - (slot_hover_x * cell_x_with_buff_between_slots)
	var slot_y = mouse_y_inventory - (slot_hover_y * cell_x_with_buff_between_slots)
	
	if((slot_x < cell_size * scale) && (slot_y < cell_size * scale)){
		mouse_x_slot = slot_hover_x;
		mouse_y_slot = slot_hover_y;
	}
	hover_slot = mouse_x_slot + (mouse_y_slot*inventory_slots_width);
}else{
	mouse_in_inventory = false;
	hover_slot = -1;
}

//Set Selected Slot to Mouse Position
#endregion


#region Pickup Item

var inventory_grid = ds_inventory;
var hover_slot_item;

if(hover_slot >= 0 && hover_slot < inventory_slots ){
	hover_slot_item = inventory_grid[# 0, hover_slot];
}else{
	hover_slot_item = items.none;
}
var create_notification = false;
if(pickup_slot != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(!mouse_in_inventory){
			#region Drop Item into Game World
			var pickup_item = inventory_grid[# 0, pickup_slot];
			var notification_item = pickup_item;
			
			inventory_grid[# 1, pickup_slot] -= 1;
		
			//destroy item in inventory if it was the last one
			if(inventory_grid[# 1, pickup_slot] == 0){
				inventory_grid[# 0, pickup_slot] = items.none;
				pickup_slot = -1;
			}
		
			//create the item
			var dropped_item = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_dropped_item);
			with(dropped_item){
				item_index = pickup_item;
				x_frame = item_index mod (sprite_items_width / cell_size);
				y_frame = item_index div (sprite_items_width / cell_size);
			}
			create_notification = true;
			show_debug_message("Dropped an item.");
			#endregion
		}
		else if(hover_slot_item == items.none){
			inventory_grid[# 0, hover_slot] = inventory_grid[# 0, pickup_slot];
			inventory_grid[# 1, hover_slot] = inventory_grid[# 1, pickup_slot];
			
			inventory_grid[# 1, pickup_slot] = 0;
			inventory_grid[# 0, pickup_slot] = items.none;
			pickup_slot = -1;
		}else if(hover_slot_item == inventory_grid[# 0, pickup_slot]){
			if(hover_slot != pickup_slot){	
				inventory_grid[# 1, hover_slot] += inventory_grid[# 1, pickup_slot];
			
				inventory_grid[# 1, pickup_slot] = 0;
				inventory_grid[# 0, pickup_slot] = items.none;
				
			}
			pickup_slot = -1;
		}else{
			var hover_slot_item_num = inventory_grid[# 1, hover_slot];	
			
			
			inventory_grid[# 0, hover_slot] = inventory_grid[# 0, pickup_slot];
			inventory_grid[# 1, hover_slot] = inventory_grid[# 1, pickup_slot];
			
			inventory_grid[# 1, pickup_slot] = hover_slot_item_num;
			inventory_grid[# 0, pickup_slot] = hover_slot_item;
		}
	}
}else if(hover_slot_item != items.none){
	
	//Drop Item into Game World
	if(mouse_check_button_pressed(mb_middle)){
		var notification_item = inventory_grid[# 0, hover_slot];
			
		inventory_grid[# 1, hover_slot] -= 1;
		
		//destroy item in inventory if it was the last one
		if(inventory_grid[# 1, hover_slot] == 0){
			inventory_grid[# 0, hover_slot] = items.none;
		}
		
		//create the item
		var dropped_item = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_dropped_item);
		with(dropped_item){
			item_index = hover_slot_item;
			x_frame = item_index mod (sprite_items_width / cell_size);
			y_frame = item_index div (sprite_items_width / cell_size);
		}
		create_notification = true;
		show_debug_message("Dropped an item.");
		
	}
	
	//Drop Pickup Item into new Slot
	if(mouse_check_button_pressed(mb_right)){
		pickup_slot = hover_slot;
	}
}

if(create_notification){
	#region Create Notification
if(!instance_exists(obj_notification)){
	instance_create_layer(0,0,"Instances",obj_notification);
}
with(obj_notification){
	if(!ds_exists(ds_notifications,ds_type_grid)){
		ds_notifications = ds_grid_create(2,1);
		var notifications_grid = ds_notifications;
		notifications_grid[# 0, 0] = -1;
		notifications_grid[# 1, 0] = inventory.ds_items_info[# 0, notification_item];
	}else{ //Add to Grid
		event_perform(ev_other,ev_user0);
						
		var notifications_grid = ds_notifications;
		var notifications_amount = ds_grid_height(notifications_grid);
		var item_name = inventory.ds_items_info[# 0, notification_item];
		var in_grid = false;
						
		for(var notification_index = 0; notification_index < notifications_amount; notification_index++){
			if(item_name == notifications_grid[# 1, notification_index]){ //Notification already on the grid?
				notifications_grid[# 0, notification_index]--;
				in_grid = true;
				break;
			}
		}
						
		if(!in_grid){
			ds_grid_resize(notifications_grid,2,notifications_amount+1);
			notifications_grid[# 0, notifications_amount] = -1;
			notifications_grid[# 1, notifications_amount] = inventory.ds_items_info[# 0, notification_item];
		}
	}
}
#endregion
}
#endregion
