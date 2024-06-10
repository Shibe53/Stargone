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


if (global.show_selection_box) {
    //get the player's position
    var player_x = obj_player.x;
    var player_y = obj_player.y;
    var player_width = sprite_get_width(obj_player.sprite_index);
    var player_height = sprite_get_height(obj_player.sprite_index);

    //set item box position relative to player
    var box_width = 150;
    var box_height = 140; 
    var box_x = player_x + player_width / 2 + 4;
    var box_y = player_y - player_height / 2 - box_height + 20; //adjust last variable depending on where you want to attach the bottom left corner of box to the top right of the player

    //scrollbar properties
    var scrollbar_x = box_x + box_width - scrollbar_width - 2;
    var scrollbar_y = box_y + 2;
    var scrollbar_height = box_height - 4;
    var visible_items = 3; //number of items that fit without scrolling
    var total_items = array_length(global.seeds) + 3; //including 3 extra empty boxes
    var max_scroll_offset = max(0, total_items - visible_items);
    var scrollbar_slider_height = max(20, scrollbar_height * (visible_items / total_items)); 

    //scroll using mouse wheel
    if (mouse_wheel_up()) {
        global.scroll_offset = max(global.scroll_offset - 1, 0);
    }
    if (mouse_wheel_down()) {
        global.scroll_offset = min(global.scroll_offset + 1, max_scroll_offset);
    }

    //get mouse position
    var mousex = device_mouse_x(0);
    var mousey = device_mouse_y(0);

    //calculate the slider's current position
    var slider_position = (global.scroll_offset / max_scroll_offset) * (scrollbar_height - scrollbar_slider_height);
    var slider_y = scrollbar_y + slider_position;

    //check if left mouse button is pressed on the scrollbar slider
    if (mouse_check_button_pressed(mb_left) &&
        mousex > scrollbar_x && 
		mousex < scrollbar_x + scrollbar_width &&
        mousey > slider_y && 
		mousey < slider_y + scrollbar_slider_height) {
        dragging_slider = true;
        //store offset to maintain consistent position between the mouse and the slider
        slider_drag_offset_y = mousey - slider_y;
    }

    //release slider when left mouse button is released
    if (mouse_check_button_released(mb_left)) {
        dragging_slider = false;
    }

    //handle dragging the slider
    if (dragging_slider) {
        //calculate new slider position based on mouse position and drag offset
        var new_slider_y = clamp(mousey - slider_drag_offset_y, scrollbar_y, scrollbar_y + scrollbar_height - scrollbar_slider_height);
        //update scroll offset proportionally based on new slider position
        var new_scroll_offset = round((new_slider_y - scrollbar_y) / (scrollbar_height - scrollbar_slider_height) * max_scroll_offset);
        global.scroll_offset = clamp(new_scroll_offset, 0, max_scroll_offset);
    }
}
