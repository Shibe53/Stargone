
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
	
var inventory_items = inventory.item_get();
var pos_x = 0;
var pos_y = 0;
	
if mouse_check_button_released(mb_left) and show_inventory 
{		
	#region INVENTORY	
		for (var row = 0; row < inventory_rows and show_inventory; row++) {				
			pos_y = ui_padding_y + (ui_border_size * 13) + (row * (ui_inventory_margin + ui_inventory_box));
			for (var column = 0; column < inventory_columns and show_inventory; column++) {
				pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
				
				if(is_between(mx, pos_x, pos_x + ui_inventory_box + 10)) {
					if(is_between(my, pos_y, pos_y + ui_inventory_box + 10)) {
						var inventory_index = (row * inventory_columns) + column;
						// now we need to check if we have a usable inventory item here
						if(inventory_index <= array_length(inventory_items) - 1 and inventory_items[inventory_index].usable)
						{
							show_inventory = false;
							inventory.item_use(inventory_index);
						}
					}
				}
			}
		}
	#endregion

    #region RECIPE
        var _recipies = inventory.recipe_get();
        var pos_x = ui_padding_x + (ui_border_size * 3) + 4;
        for(var recipe_index = 0; recipe_index < array_length(_recipies); recipe_index++) {
            var pos_y = ui_padding_y + (ui_border_size * 13) + (recipe_index * (ui_inventory_margin + ui_inventory_box));

            // hover
            if(is_between(mx, pos_x, pos_x + ui_panel_left - 64)) {
                if(is_between(my, pos_y, pos_y + ui_inventory_box)) {
                    if(inventory.recipe_has(_recipies[recipe_index].name)) {
                        inventory.recipe_craft(_recipies[recipe_index].name);
                    }
                }
            }
        }
    #endregion 
}

if keyboard_check_pressed(ord("E"))
{
	show_inventory = !show_inventory;
}

if keyboard_check_released(vk_escape)
{
	show_inventory = false;
}

if show_inventory
{
	obj_inventory.visible = true;
	obj_pause.pausable = false;
} 
else
{
	obj_inventory.visible = false;
	obj_pause.pausable = true;
}