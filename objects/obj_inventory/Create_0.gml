
randomize();

inventory = new Recipe();

inventory.item_add("Galaxy Cactus seed", 2, spr_seed_galaxy_cactus, true, "seed", "SEED\nDrops: Space Dust\nTimer: 10 seconds");

// recipes
inventory.recipe_add("Compost", [ 
	
		{name: "Clay Crust", //requirement
		quantity: 1
	}], [{
		name: "Compost", //product
		quantity: 1,
		sprite: spr_compost,
		usable: true,
		role: "tree",
		tooltip: "TREE NUTRIENT\nYou can use this\nitem to help with the\ntree's growth!"
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
		role: "powerup",
		tooltip: "POWERUP\nEffect: halves timer\nduration for a plant"
	}], spr_nebula_nourishment);
	
inventory.recipe_add("Cosmic Cocktail", [
	
		{name: "Solar Juice", //requirement 1
		quantity: 1
		},
		{name: "THC", //requirement 2
		quantity: 1
		}
		], [{
		name: "Cosmic Cocktail", //product
		quantity: 1, 
		sprite: spr_cosmic_cocktail,
		usable: true,
		role: "drink",
		tooltip: "POWERUP\nEffect: makes you\nwonky ;)"
	}], spr_cosmic_cocktail);

// UI INFORMATION //

display_set_gui_size(1280, 720);

inventory_columns = 5;
inventory_rows = 3;

ui_padding_x = 128;
ui_padding_y = 128;
ui_panel_left = 320;
ui_border_size = 8;
ui_inventory_padding = 80;
ui_inventory_box = 80;
ui_inventory_margin = 26;

color_background = #55507a;
color_border = #36234a;
color_inventory_text = c_white;
color_inventory_highlight = c_white;

show_inventory = false;

