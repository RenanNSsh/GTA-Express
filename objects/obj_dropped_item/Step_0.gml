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
				instance_destroy();
				show_debug_message("Picked up an item.");
			}else{
				show_debug_message("No slots avaliable");
			}
		}
		
	}
	
}