if can_use
{
	rotation = lerp(rotation, 45, 0.1);

	image_angle = rotation * obj_player.image_xscale;
	image_xscale = sign(obj_player.image_xscale);

	var _harvestable = instance_nearest(obj_player.x - 30, obj_player.y - 50, obj_plants);
	var _key_press = keyboard_check_pressed(ord("F"));

	with (_harvestable)
	{
		if (state = "HARVEST" or state = "WITHERED") and distance_to_object(obj_player) <= 30 // distance doesn't work lmao
		{
			other.selector_inst = id;
		
			if _key_press
			{
				if state = "HARVEST"
				{
					switch (object_get_name(object_index)) 
					{
						case "obj_galaxy_cactus":
						{
							obj_inventory.inventory.item_add("Space Dust", 1, spr_space_dust, false, "crafting", "Space Dust\nCRAFTING REAGENT\n");
							show_debug_message("Added Space Dust to inventory."); // Debug message
							show_debug_message("Inventory Contents: " + string(obj_inventory.inventory.item_get()));
						} break;
						case "obj_asteroid_melon":
						{
							obj_inventory.inventory.item_add("Clay Crust", 1, spr_clay_crust, false, "crafting", "Clay Crust\nCRAFTING REAGENT\n");
							show_debug_message("Added Space Crust to inventory."); // Debug message
							show_debug_message("Inventory Contents: " + string(obj_inventory.inventory.item_get()));
						} break;
						case "obj_sun_flower":
						{
							obj_inventory.inventory.item_add("Solar Juice", 1, spr_solar_juice, false, "crafting", "Solar Juice\nCRAFTING REAGENT\n");
							show_debug_message("Added Solar Juice to inventory."); // Debug message
							show_debug_message("Inventory Contents: " + string(obj_inventory.inventory.item_get()));
						} break;
						case "obj_hell_flame":
						{
							obj_inventory.inventory.item_add("THC", 1, spr_thc, false, "crafting", "THC\nCRAFTING REAGENT\n");
							show_debug_message("Added weed to inventory."); // Debug message
							show_debug_message("Inventory Contents: " + string(obj_inventory.inventory.item_get()));
						} break;
					}
				}
				instance_destroy();
				other.rotation = -80;
			}
		}
	}
}