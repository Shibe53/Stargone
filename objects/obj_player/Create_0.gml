// move variables
move_spd = 3.5;
xspd = 0;
yspd = 0;

// direction variables
dir = 0;
_dx = 0;
_dy = 0;

// items variables
items[0] = obj_watercan;
items[1] = obj_shovel;
item_index = 0;
held_item = instance_create_layer(x, y, "instances", obj_watercan);

inv_controls = false;