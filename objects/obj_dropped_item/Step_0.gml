/// @description Insert description here
// You can write your code in this editor
if(drop_move){
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	if( abs(x - goal_x) < 1 && abs(y - goal_y) < 1){
		drop_move = false;
	}
} else {
	if(!keyboard_check(ord("E"))) exit;
	var player_x = obj_player.x;
	var player_y = obj_player.y;
	var radius_pickup = 32;
	
	if(point_in_rectangle(player_x, player_y, x-radius_pickup,y-radius_pickup,x+radius_pickup,y+radius_pickup)){
		//Are we on top of the player?
		radius_pickup = 2;
		if(!point_in_rectangle(player_x, player_y, x-radius_pickup,y-radius_pickup,x+radius_pickup,y+radius_pickup)){
			//move towards the player for pickup
			x = lerp(x, player_x, 0.1);
			y = lerp(y, player_y, 0.1);
		}else{
			//pickup item
			var index_dropped_item = item_index;
			with(inventory){
				
				var inventory_grid = ds_inventory;
				var picked_up = false;
				
				//check if item exists in inventory already
				for(var slot = 0; slot < inventory_slots; slot++){
					if(inventory_grid[# 0, slot] == index_dropped_item){
						inventory_grid[# 1, slot]++;
						picked_up = true;
						break;
					}
				}
				
				//otherwise, add item to an empty slot if there is one
				if(!picked_up){
					for(var slot = 0; slot < inventory_slots; slot++){
						if(inventory_grid[# 0, slot] == items.none){
							inventory_grid[# 0, slot] = index_dropped_item;
							inventory_grid[# 1, slot] = 1;
							picked_up = true;
							break;
						}
					}
				}
			}
			if(picked_up){
				#region Create Notification
				if(!instance_exists(obj_notification)){
					instance_create_layer(0,0,"Instances",obj_notification);
				}
						var index_dropped_item = item_index;
				with(obj_notification){
					if(!ds_exists(ds_notifications,ds_type_grid)){
						ds_notifications = ds_grid_create(2,1);
						var notifications_grid = ds_notifications;
						notifications_grid[# 0, 0] = 1;
						notifications_grid[# 1, 0] = inventory.ds_items_info[# 0, index_dropped_item];
					}else{ //Add to Grid
						event_perform(ev_other,ev_user0);
						
						var notifications_grid = ds_notifications;
						var notifications_amount = ds_grid_height(notifications_grid);
						var item_name = inventory.ds_items_info[# 0, index_dropped_item];
						var in_grid = false;
						
						for(var notification_index = 0; notification_index < notifications_amount; notification_index++){
							if(item_name == notifications_grid[# 1, notification_index]){ //Notification already on the grid?
								notifications_grid[# 0, notification_index]++;
								in_grid = true;
								break;
							}
						}
						
						if(!in_grid){
							ds_grid_resize(notifications_grid,2,notifications_amount+1);
							notifications_grid[# 0, notifications_amount] = 1;
							notifications_grid[# 1, notifications_amount] = inventory.ds_items_info[# 0, index_dropped_item];
						}
					}
				}
				#endregion
				instance_destroy();
				show_debug_message("Picked up an item.");
			}else{
				show_debug_message("No slots avaliable");
			}
		}
		
	}
	
}