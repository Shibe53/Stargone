switch state
{
	case "MOVE":
	{
		if keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("S")) or keyboard_check_pressed(ord("D"))
		{
			state = "INV";
			tip = "Open your inventory by pressing E";
		}
	} break;
	case "INV":
	{
		if keyboard_check_pressed(ord("E"))
		{
			state = "PLANT";
			tip = "Click on a seed and plant it\nby clicking on an empty dirt patch";
		}
	} break;
	case "PLANT":
	{
		break;
	}
	case "WATER":
	{
		tip = "Water the plant by pressing SPACE\nDo so before the timer runs out!";
	} break;
	case "MORE WATER":
	{
		tip = "You have to water the plant 2 times\nbefore you can harvest it";
	} break;
	case "HARVEST":
	{
		tip = "The plant is now harvestable!\nPress Q to switch to your shovel";
	} break;
	case "HARVESTED":
	{
		tip = "Press SPACE to harvest the plant";
		state = "WITHER";
	} break;
	case "WITHER":
	{
		if keyboard_check_pressed(vk_space)
		{
			tip = "If a timer ends, the plant will wither\nUse the shovel to remove it";
			alarm[0] = 60 * 6;
		}
	} break;
	case "CRAFT":
	{
		if alarm_on
		{
			tip = "You can use the plant drops\nto craft useful items, like powerups";
			alarm[1] = 60 * 6;
			alarm_on = false;
		}
		else
		{
			if keyboard_check_pressed(ord("E"))
			{
				state = "TRASH";
			}
		}
	} break;
	case "TRASH":
	{
		tip = "Every minute, you can get a seed\nfrom the trash collector (right room)";
	} break;
	case "FINISH":
	{	
		tip = "Enjoy the game!\nHere are some extra seeds :)";
		if keyboard_check_pressed(ord("E"))
		{
			obj_inventory.inventory.item_add("Sun Flower seed", 2, spr_seed_sun_flower, true, "seed", "SEED\nDrops: Solar Juice\nTimer: 5 seconds");
			obj_inventory.inventory.item_add("Galaxy Cactus seed", 2, spr_seed_galaxy_cactus, true, "seed", "SEED\nDrops: Space Dust\nTimer: 10 seconds");
			obj_inventory.inventory.item_add("Asteroid Melon seed", 2, spr_seed_asteroid_melon, true, "seed", "SEED\nDrops: Clay Crust\nTimer: 30 seconds");
			obj_inventory.inventory.item_add("Hell Flame seed", 2, spr_seed_hell_flame, true, "seed", "SEED\nDrops: THC\nTimer: 5 seconds");
			instance_create_layer(x, y, "GUI", obj_d_tree_init);
			instance_destroy();
		}
	} break;
}

if keyboard_check_pressed(ord("L"))
{
	obj_inventory.inventory.item_add("Sun Flower seed", 10, spr_seed_sun_flower, true, "seed", "SEED\nDrops: Solar Juice\nTimer: 5 seconds");
	obj_inventory.inventory.item_add("Galaxy Cactus seed", 10, spr_seed_galaxy_cactus, true, "seed", "SEED\nDrops: Space Dust\nTimer: 10 seconds");
	obj_inventory.inventory.item_add("Asteroid Melon seed", 10, spr_seed_asteroid_melon, true, "seed", "SEED\nDrops: Clay Crust\nTimer: 30 seconds");
	obj_inventory.inventory.item_add("Hell Flame seed", 10, spr_seed_hell_flame, true, "seed", "SEED\nDrops: THC\nTimer: 5 seconds");
	obj_inventory.inventory.item_add("Nebula Nourishment", 10, spr_nebula_nourishment, true, "powerup", "POWERUP\nEffect: halves timer\nduration for a plant");
	obj_inventory.inventory.item_add("Cosmic Cocktail", 10, spr_cosmic_cocktail, true, "drink", "POWERUP\nEffect: makes you\nwonky ;)");
	obj_inventory.inventory.item_add("Compost", 10, spr_compost, true, "tree", "TREE NUTRIENT\nYou can use this\nitem to help with the\ntree's growth!");
	instance_destroy();
}
