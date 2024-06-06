if distance_to_object(obj_player) < 50 and space_junk_visible
{
	selector_inst = id;
}


//get the player's position
var player_x = obj_player.x;
var player_y = obj_player.y;

//calculate the distance between the player and the space junk
var distance_to_space_junk = point_distance(player_x, player_y, x, y);
var max_distance = 200; // Maximum distance to show the seed box

//check if the player is within the maximum distance
if (distance_to_space_junk <= max_distance && global.selection_box_active) {
    global.show_selection_box = true;
} else {
    global.show_selection_box = false;
}


//update scrolling based on mouse wheel
if (global.show_selection_box) {
    if (mouse_wheel_up()) {
        global.scroll_offset = max(global.scroll_offset - 1, 0);
    }
    if (mouse_wheel_down()) {
        global.scroll_offset = min(global.scroll_offset + 1, array_length(global.seeds) + 3 - 3);
    }
}




	
