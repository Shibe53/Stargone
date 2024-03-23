
inventory = new Inventory();


inventory.item_add("Space Cactus", 3, spr_seed_space_cactus);
inventory.item_add("Space cactus", 2, spr_seed_space_cactus);
inventory.item_add("Sun flower", 10, spr_seed_sun_flower);
inventory.item_add("Watermelon", 5, spr_seed_spacemelon);

show_debug_message(inventory);

// UI INFORMATION //


display_set_gui_size(1280, 720);

inventory_columns = 4;
inventory_rows = 3;

ui_padding_x = 64;
ui_padding_y = 64;
ui_panel_left = 320;
ui_border_size = 8;
ui_inventory_padding = 48;
ui_inventory_box = 64;
ui_inventory_margin = 16;

color_background = #55507a;
color_border = #36234a;
color_inventory_text = c_white;
color_inventory_highlight = c_white;

showInventory = false;

