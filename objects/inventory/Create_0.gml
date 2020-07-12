/// @description Insert description here
// You can write your code in this editor
depth = -1;
scale = 1;
show_inventory = false;

inventory_slots = 20;
inventory_slots_width = 8;
inventory_slots_height = 3;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();


cell_size = 32;
inventory_UI_width = 288;
inventory_UI_height = 192;
sprite_inventory_UI = spr_inventory_UI;

inventory_UI_x = (gui_width / 2) - (inventory_UI_width / 2 * scale);
inventory_UI_y = (gui_height / 2) - (inventory_UI_height / 2 * scale);


sprite_inventory_items = spr_inventory_items;
inventory_items_columns_sprite = sprite_get_width(sprite_inventory_items) / cell_size;
inventory_items_rows_sprite = sprite_get_height(sprite_inventory_items) / cell_size;

x_buffer_between_slots = 2;
y_buffer_between_slots = 4;

inventory_slot_x = inventory_UI_x + (9 * scale);
inventory_slot_y = inventory_UI_y + (40 * scale);

selected_slot = 0;
pickup_slot = -1;
mouse_x_slot = 0;
mouse_y_slot = 0;

#region Player Info
user_name_x =  inventory_slot_x;
user_name_y =  inventory_UI_y + (10 * scale);

user_gold_x = user_name_x + (178 * scale);
user_gold_y = user_name_y + (3 * scale);

user_silver_x = user_name_x + (210 * scale);
user_silver_y = user_gold_y;

user_copper_x = user_name_x + (243 * scale);
user_copper_y = user_gold_y;


//-------Player Info
//0 = GOLD
//1 = SILVER
//2 = BRONZE
//3 = NAME

ds_player_info = ds_grid_create(2, 4);
var player_info = ds_player_info;
player_info[# 0, 0] = "Gold";
player_info[# 0, 1] = "Silver";
player_info[# 0, 2] = "Copper";
player_info[# 0, 3] = "Name";

player_info[# 1, 0] = irandom_range(0,99);
player_info[# 1, 1] = irandom_range(0,99);
player_info[# 1, 2] = irandom_range(0,99);
player_info[# 1, 3] = "Mafia";
#endregion

#region Inventory
//---------Inventory
//0 = ITEM
//1 = NUMBER

ds_inventory = ds_grid_create(2, inventory_slots);

enum items{
 none			= 0,
 tomato			= 1,
 potato			= 2,
 carrot			= 3,
 artichoke		= 4,
 chilli			= 5,
 gourd			= 6,
 corn			= 7,
 wood			= 8,
 stone			= 9,
 bucket			= 10,
 chair			= 11,
 picture		= 12,
 axe			= 13,
 potion			= 14,
 starfish		= 15,
 mushroom		= 16,
 height			= 17
}

#region Create Items Info Grid
description_position_x = user_name_x;
description_position_y = inventory_UI_y + (156 * scale);

ds_items_info = ds_grid_create(2,items.height);

//---Item Names
var name_index = 0;
var description_index = 1;
ds_items_info[# name_index, items.none]		 = "Nothing";
ds_items_info[# name_index, items.tomato]    = "Tomato";
ds_items_info[# name_index, items.potato]	 = "Potato";
ds_items_info[# name_index, items.carrot]	 = "Carrot";
ds_items_info[# name_index, items.artichoke] = "Artichoke";
ds_items_info[# name_index, items.chilli]	 = "Chilli";
ds_items_info[# name_index, items.gourd]	 = "Gourd";
ds_items_info[# name_index, items.corn]		 = "Corn";
ds_items_info[# name_index, items.wood]		 = "Wood";
ds_items_info[# name_index, items.stone]	 = "Stone";
ds_items_info[# name_index, items.bucket]	 = "Bucket";
ds_items_info[# name_index, items.chair]	 = "Chair";
ds_items_info[# name_index, items.picture]	 = "Picture";
ds_items_info[# name_index, items.axe]		 = "Axe";
ds_items_info[# name_index, items.potion]	 = "Potion";
ds_items_info[# name_index, items.starfish]  = "Starfish";
ds_items_info[# name_index, items.mushroom]  = "Mushroom";

//----Item Descriptions
ds_items_info[# description_index, items.none]		 = "Empty.";
ds_items_info[# description_index, items.tomato]    = "To-mah... may-to.";
ds_items_info[# description_index, items.potato]	 = "Pre-chips.";
ds_items_info[# description_index, items.carrot]	 = "Keep away from rabbits.";
ds_items_info[# description_index, items.artichoke] = "The heartiest vegetable";
ds_items_info[# description_index, items.chilli]	 = "But oddly hot.";
ds_items_info[# description_index, items.gourd]	 = "Or is it an eggplant?";
ds_items_info[# description_index, items.corn]		 = "Better popped.";
ds_items_info[# description_index, items.wood]		 = "Knock on it.";
ds_items_info[# description_index, items.stone]	 = "There's nothing writtern in it.";
ds_items_info[# description_index, items.bucket]	 = "You could fit a bucket-full of a watter in here!";
ds_items_info[# description_index, items.chair]	 = "this chair is just right.";
ds_items_info[# description_index, items.picture]	 = "Wait, who even is this?";
ds_items_info[# description_index, items.axe]		 = "Chop chop!";
ds_items_info[# description_index, items.potion]	 = "The liquid looks... oozy.";
ds_items_info[# description_index, items.starfish]  = "So called because it looks like a star... but aren't real stars";
ds_items_info[# description_index, items.mushroom]  = "A fungus; not mush room for interpretation.";


#endregion

for(var slot = 0; slot < inventory_slots; slot++){
	ds_inventory[# 0, slot] = irandom_range(0,items.height -1);
	ds_inventory[# 1, slot] = irandom_range(1,10);
}
#endregion