//minutes and seconds for the timer
var _min = floor(alarm[0]) div 60 div 60;
var _sec = floor(alarm[0]) div 60 mod 60;

//formats them 
var _min_string = string_replace(string_format(_min, 2, 0), " ", "0");
var _sec_string = string_replace(string_format(_sec, 2, 0), " ", "0");

//determine coordinates for timer text to appear below space junk
var text_x = x + sprite_get_width(spr_space_junk) / 2;
var text_y = y + sprite_get_width(spr_space_junk);

//draws timer
draw_set_font(fnt_timer_junk);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

//draw space junk 
draw_sprite(spr_space_junk, 0, x, y);
draw_set_color(c_yellow);

//show the timer or the word done depending on the state of spce junk
if (alarm[0] <= 0) {
    text_drop_shadow(text_x, text_y, "Done", 1, 1, c_yellow, c_yellow, c_orange, 1, 1);
} else {
    text_drop_shadow(text_x, text_y, _min_string + ":" + _sec_string, 1, 1, c_lime, c_lime, c_black, 2, 2);
}

//draw the selection box 
if (global.show_selection_box) {
    //get the player's position
    var player_x = obj_player.x;
    var player_y = obj_player.y;
    var player_width = sprite_get_width(obj_player.sprite_index);
    var player_height = sprite_get_height(obj_player.sprite_index);

    //set box position relative to player
    var box_width = 150;
    var box_height = 140; //more hight for more items
    var box_x = player_x + player_width / 2 + 4;
    var box_y = player_y - player_height / 2 - box_height + 20; //adjust last variable depending on where you want to attach the bottom left corner of box to the top right of the player

    //draw black border rectangle
    draw_set_color(c_black);
    draw_rectangle(box_x - 2, box_y - 2, box_x + box_width + 2, box_y + box_height + 2, false);
	
	//draw blue rectangular box
    draw_set_color(c_grey);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);

    //scale factor to reduce the size of the sprites and boxes
    var scale_factor = 0.5;
    var seed_box_spacing = 40; //space between each seed box

    //draw seed options inside the box, including empty boxes for future items
    var total_boxes = array_length(global.seeds) + 3; // Add 3 empty boxes

    for (var i = 0; i < total_boxes; i++) {
        //skip items outside the visible range
        if (i < global.scroll_offset || i >= global.scroll_offset + 3) {
            continue;
        }

        var seed_box_x = box_x + 10;
        var seed_box_y = box_y + 10 + (i - global.scroll_offset) * seed_box_spacing;

        //draw inventory box with scaling
        draw_sprite_ext(spr_Inventory_Box, 0, seed_box_x, seed_box_y, scale_factor, scale_factor, 0, c_white, 1);

        if (i < array_length(global.seeds)) {
            var seed = global.seeds[i];

            //calculate center position of inventory box to draw the seed sprite with scaling
            var seed_sprite_x = seed_box_x + (sprite_get_width(spr_Inventory_Box) * scale_factor - sprite_get_width(seed.sprite) * scale_factor) / 2;
            var seed_sprite_y = seed_box_y + (sprite_get_height(spr_Inventory_Box) * scale_factor - sprite_get_height(seed.sprite) * scale_factor) / 2;

            //draw seed sprite centered in the inventory box with scaling
            draw_sprite_ext(seed.sprite, 0, seed_sprite_x, seed_sprite_y, scale_factor, scale_factor, 0, c_white, 1);

            //draw seed name next to sprite box
            var text_x = seed_box_x + sprite_get_width(spr_Inventory_Box) * scale_factor + 4;
            var text_y = seed_box_y + (sprite_get_height(spr_Inventory_Box) * scale_factor) / 2;
            draw_set_font(fnt_small); 
            draw_set_halign(fa_left); 
            draw_set_valign(fa_middle); 
            draw_set_color(c_white);
            draw_text(text_x, text_y, seed.name);
        }
    }

    //check if individual seed box is clicked
    if (mouse_check_button_pressed(mb_left)) {
        var mousex = device_mouse_x(0); 
        var mousey = device_mouse_y(0); 

        for (var i = 0; i < total_boxes; i++) {
            var seed_box_x = box_x + 10;
            var seed_box_y = box_y + 10 + (i - global.scroll_offset) * seed_box_spacing;

            if (mousex > seed_box_x && mousex < seed_box_x + sprite_get_width(spr_Inventory_Box) * scale_factor &&
                mousey > seed_box_y && mousey < seed_box_y + sprite_get_height(spr_Inventory_Box) * scale_factor) {

                if (i < array_length(global.seeds)) {
                    //box clicked, restart alarm + hide seed box
                    global.selection_box_active = false;
                    global.show_selection_box = false;
                    alarm[0] = 60 * 10;

                    //add the selected seed to the inventory
                    var chosen_seed = global.seeds[i];
                    obj_inventory.inventory.item_add(chosen_seed.name, 1, chosen_seed.sprite, true, "seed", chosen_seed.tooltip);
               
			   //otherwise stop timer + seed box still visible
			   } else if (global.selection_box_active && global.show_selection_box) {
                    alarm[0] = -1;
                }
                break;
            }
        }
    }
}
