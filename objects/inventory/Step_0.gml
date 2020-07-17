/// @description Insert description here
// You can write your code in this editor
inventory_inputs();

if(inventory.ds_inventory[# inventory_grid.amount,  selected_slot] <= 0){
	inventory.ds_inventory[# inventory_grid.item,  selected_slot] = items.none;
	inventory.ds_inventory[# inventory_grid.amount,  selected_slot] = 0;
	
}

if(!show_inventory){
	inventory_step_main();
}else{
	inventory_step_detail();
}

