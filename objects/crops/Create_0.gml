/// @description Insert description here
// You can write your code in this editor
ds_crops_types = -1;
ds_crops_instances = -1;
ds_crops_data = ds_grid_create(5,1);
ds_grid_clear(ds_crops_data,-1);

enum crop{
	tomato,
	potato,
	carrot,
	artichoke,
	chilli,
	gourd,
	corn,
	pistol,
	rifle,
	pistol2
}

create_crop_type(4,40,"tomato",items.tomato); //tomato
create_crop_type(3,35,"potato",items.potato); //potato
create_crop_type(2,25,"carrot",items.carrot); //carrot
create_crop_type(4,45,"artichoke",items.artichoke); //artichoke
create_crop_type(3,30,"chilli",items.chilli); //chilli
create_crop_type(2,20,"gourd",items.gourd); //gourd
create_crop_type(5,50,"corn",items.corn); //corn
create_crop_type(2,30,"pistol",items.pistol); //pistol
create_crop_type(7,60,"corn",items.rifle); //rifle
create_crop_type(4,40,"quick pistol",items.pistol2); //pistol2

planting = false;
select_crop = -1;
mouse_crop_x = 0;
mouse_crop_y = 0;

cell_size = 32;
