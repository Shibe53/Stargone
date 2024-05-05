// Check if the space junk is visible and the click is on object
if (space_junk_visible = true && position_meeting(mouse_x, mouse_y, id) && distance_to_object(obj_player) < 50) {
    var seeds = [
        {name: "Sun Flower seed", sprite: spr_seed_sun_flower, tooltip: "Sun Flower seeds\nSEED\nDrops: Solar Juice\nTimer: 5 seconds"},  
        {name: "Galaxy Cactus seed", sprite: spr_seed_galaxy_cactus, tooltip: "Galaxy Cactus seeds\nSEED\nDrops: Space Dust\nTimer: 10 seconds"},
        {name: "Asteroid Melon seed", sprite: spr_seed_asteroid_melon, tooltip: "Asteroid Melon seeds\nSEED\nDrops: Clay Crust\nTimer: 30 seconds"},
        {name: "Hell Flame seed", sprite: spr_seed_hell_flame, tooltip: "Hell Flame seeds\nSEED\nDrops: THC\nTimer: 5 seconds"}
    ];
    var chosen_seed = seeds[irandom_range(0, array_length_1d(seeds) - 1)];

    // Add the randomly selected seed to the inventory
    obj_inventory.inventory.item_add(chosen_seed.name, 1, chosen_seed.sprite, true, "seed", chosen_seed.tooltip);

    // Debug messages to see if it works correctly
    show_debug_message("Added " + chosen_seed.name + " to inventory.");
    show_debug_message("Inventory Contents: " + json_stringify(obj_inventory.inventory.item_get()));

    // Hide space junk and restart timer
    space_junk_visible = false;
    alarm[0] = 60 * 60;  // Restart the timer
}

if instance_exists(obj_tutorial)
{
	if obj_tutorial.state = "TRASH"
	{
		obj_tutorial.state = "FINISH";
	}
}