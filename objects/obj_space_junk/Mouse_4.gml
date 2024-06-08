// Check if the space junk is visible and the click is on object
if (space_junk_visible = true && alarm[0] <= 0 && position_meeting(mouse_x, mouse_y, id) && distance_to_object(obj_player) < 50) {
    var global.seeds = [
        {name: "Sun Flower seed", sprite: spr_seed_sun_flower, tooltip: "SEED\nDrops: Solar Juice\nTimer: 5 seconds"},  
        {name: "Galaxy Cactus seed", sprite: spr_seed_galaxy_cactus, tooltip: "SEED\nDrops: Space Dust\nTimer: 10 seconds"},
        {name: "Asteroid Melon seed", sprite: spr_seed_asteroid_melon, tooltip: "SEED\nDrops: Clay Crust\nTimer: 30 seconds"},
        {name: "Hell Flame seed", sprite: spr_seed_hell_flame, tooltip: "SEED\nDrops: THC\nTimer: 5 seconds"}
    ];
	
	alarm[1] = 60 * 0.25;
	
	// Show the selection box
    show_selection_box = true;
   
    // Add the randomly selected seed to the inventory
    //obj_inventory.inventory.item_add(chosen_seed.name, 1, chosen_seed.sprite, true, "seed", chosen_seed.tooltip);

    // Debug messages to see if it works correctly
    //show_debug_message("Added " + chosen_seed.name + " to inventory.");
    //show_debug_message("Inventory Contents: " + json_stringify(obj_inventory.inventory.item_get()));

    // Hide space junk and restart timer
    space_junk_visible = false;
}

// Disable other interactions when the box is shown
if (show_selection_box) {
    exit;
}

if instance_exists(obj_tutorial)
{
	if obj_tutorial.state = "TRASH"
	{
		obj_tutorial.state = "FINISH";
	}
}