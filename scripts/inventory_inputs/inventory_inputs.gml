if(keyboard_check_pressed(ord("I")) || keyboard_check_pressed(vk_tab)){
	show_inventory = !show_inventory;
}



for(var number_key = 1; number_key <= inventory_slots_width; number_key++){
	if(keyboard_check( ord(string(number_key)))){
		selected_slot = number_key -1;
	}
}