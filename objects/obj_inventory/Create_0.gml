
randomize();

inventory = new Recipe();

inventory.item_add("Sun Flower seed", 10, spr_seed_sun_flower, true, "seed");
inventory.item_add("Galaxy Cactus seed", 10, spr_seed_galaxy_cactus, true, "seed");
inventory.item_add("Asteroid Melon seed", 10, spr_seed_asteroid_melon, true, "seed");

// recipes
inventory.recipe_add("Compost", [ 
	
		{name: "Clay Crust", //requirement
		quantity: 1
	}], [{
		name: "Compost", //product
		quantity: 1,
		sprite: spr_compost,
		usable: true,
		role: "tree"
	}], spr_compost);
	
inventory.recipe_add("Nebula Nourishment", [
	
		{name: "Space Dust", //requirement 1
		quantity: 1
		},
		{name: "Solar Juice", //requirement 2
		quantity: 1
		}
		], [{
		name: "Nebula Nourishment", //product
		quantity: 1, 
		sprite: spr_nebula_nourishment,
		usable: true,
		role: "powerup"
	}], spr_nebula_nourishment);

// UI INFORMATION //

display_set_gui_size(1280, 720);

inventory_columns = 9;
inventory_rows = 5;

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

show_inventory = false;

