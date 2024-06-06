
var g_width = display_get_gui_width();
var g_height = display_get_gui_height();

// draw outside shadow
draw_set(c_black, 0.2);
draw_rectangle(
	ui_padding_x + ui_border_size,
	ui_padding_y + ui_border_size,
	(g_width - ui_padding_x) + ui_border_size,
	(g_height - ui_padding_y) + ui_border_size,
	false
);

// draw outside rectangle
draw_set(color_border, 1);
draw_rectangle(
	ui_padding_x,
	ui_padding_y,
	g_width - ui_padding_x,
	g_height - ui_padding_y,
	false
);

// draw rectangle inside
draw_set(color_background, 1);
draw_rectangle(
	ui_padding_x + ui_border_size,
	ui_padding_y + ui_border_size,
	g_width - ui_padding_x - ui_border_size,
	g_height - ui_padding_y - ui_border_size,
	false
);

// draw horizontal line
draw_set(color_border, 1);
draw_rectangle(
	ui_padding_x + ui_panel_left,
	ui_padding_y + ui_border_size,
	ui_padding_x + ui_panel_left + ui_border_size,
	g_height - ui_padding_y - ui_border_size,
	false
);

// draw text
draw_set_font(fn_Ubuntu);
text_align(fa_left, fa_top);
draw_set(color_inventory_text, 1);

draw_set(c_black, 0.5);
draw_text(
	ui_padding_x + (ui_border_size * 3) + 4,
	ui_padding_y + (ui_border_size * 4) + 4,
	"Craft"
);
draw_set(c_white, 1);
draw_text(
	ui_padding_x + (ui_border_size * 3),
	ui_padding_y + (ui_border_size * 4),
	"Craft"
);

draw_set(c_black, 0.5);
draw_text(
	ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
	ui_padding_y + (ui_border_size * 4) + 4,
	"Inventory"
);
draw_set(c_white, 1);
draw_text(
	ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin,
	ui_padding_y + (ui_border_size * 4),
	"Inventory"
);

// reset text
draw_set_font(-1);

// mouse position
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// draw inventory place holders
var inventory_items = inventory.item_get();
for (var row = 0; row < inventory_rows; row++) {
	var pos_y = ui_padding_y + (ui_border_size * 13) +
	(row * (ui_inventory_margin + ui_inventory_box));
    for (var column = 0; column < inventory_columns; column++) {
		var pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
		
		// draw offset sprite for shadow
		draw_sprite_ext(
			spr_Inventory_Box,
			0,
			pos_x + 4,
			pos_y + 4,
			1,
			1,
			0,
			c_black,
			0.4
		);
		
		// draw inventory box sprite
		draw_sprite(spr_Inventory_Box, 0, pos_x, pos_y);
		
		var inventory_index = (row * inventory_columns) + column;
		if(inventory_index <= array_length(inventory_items) - 1) {
			// draw inventory sprite
			draw_sprite(inventory_items[inventory_index].sprite, 0, pos_x + 13, pos_y + 13);
		}
		
		// if our mouse is between one of the columns let's highlight it
		if(is_between(mx, pos_x, pos_x + ui_inventory_box + 10)) {
			if(is_between(my, pos_y, pos_y + ui_inventory_box + 10)) {
				draw_set(color_inventory_highlight, 0.2);
				draw_rectangle(
					pos_x,
					pos_y,
					pos_x + ui_inventory_box + 10,
					pos_y + ui_inventory_box + 10,
					false
				);
				draw_reset();
				if inventory_index <= array_length(inventory_items) - 1
				{
					// draw tooltip
					/*
					draw_set_alpha(0.9);
					draw_rectangle_color(
						mx - 200,
						my - 150,
						mx - 5,
						my - 5,
						c_yellow,
						c_yellow,
						c_orange,
						c_orange,
						false
					);*/
					draw_sprite_ext(spr_tooltip, 1, mx - 240, my - 150, 1.2, 0.8, 0, c_white, 1);
					
					text_align(fa_left, fa_top);
					draw_set_alpha(1.0);
					
					draw_text_color(
						mx - 225,
						my - 145,
						$"{inventory_items[inventory_index].name}",
						c_purple,
						c_purple,
						c_purple,
						c_purple,
						1
					);

					draw_text_color(
						mx - 225,
						my - 125,
						$"{inventory_items[inventory_index].tooltip}",
						c_black,
						c_black,
						c_black,
						c_black,
						1
					);
				}
			}
		}
		
		// now do this again but for quantity only
		if(inventory_index <= array_length(inventory_items) - 1) {
			draw_set(#232323, 1);
			draw_circle(
				pos_x + ui_inventory_box,
				pos_y + ui_inventory_box,
				14,
				false
			);
			
			draw_set(c_white, 1);
			text_align(fa_center, fa_middle);
			
			draw_text(
				pos_x + ui_inventory_box,
				pos_y + ui_inventory_box,
				inventory_items[inventory_index].quantity
			);
		}
	}
}

//recipe GUI
if point_distance(obj_player.x, obj_player.y, obj_workbench.x + 32, obj_workbench.y + 64) <= 120
{
	var _recipies = inventory.recipe_get();
	var pos_x = ui_padding_x + (ui_border_size * 3) + 4;
	for(var recipe_index = 0; recipe_index < array_length(_recipies); recipe_index++) {
		var pos_y = ui_padding_y + (ui_border_size * 13) + (recipe_index * (ui_inventory_margin + ui_inventory_box));
	
		draw_sprite(spr_Recipe_Box, 0, pos_x, pos_y);
		draw_sprite(_recipies[recipe_index].sprite, 0, pos_x + 5, pos_y + 5);
		
		text_align(fa_center, fa_middle);
		draw_set_font(fnt_recipe_name);
		draw_set_halign(fa_left);
		draw_text_color(pos_x + 83, pos_y + 16, _recipies[recipe_index].name, c_lime, c_lime, c_lime, c_lime, 1); // make constants with this stuff
	
		draw_set_font(fnt_recipe_req);
		var requirement_string = "";
		for(var requirement_index = 0; requirement_index < array_length(_recipies[recipe_index].requirements); requirement_index++) {
			requirement_string += $"{_recipies[recipe_index].requirements[requirement_index].name}: {_recipies[recipe_index].requirements[requirement_index].quantity}\n";
		}
	
		draw_text(pos_x + 83, pos_y + 32 + 16, $"{requirement_string}");
	
		// hover
		if(is_between(mx, pos_x, pos_x + ui_panel_left - 32)) {
			if(is_between(my, pos_y, pos_y + ui_inventory_box + 10)) 
			{
				draw_set(color_inventory_highlight, 0.2);
				
				draw_rectangle(
					pos_x,
					pos_y,
					pos_x + ui_panel_left - 30,
					pos_y + ui_inventory_box - 5,
					false
				);
			
				draw_reset();
				draw_set_font(-1);
					// draw tooltip
					/*(0.9);
					draw_rectangle_color(
						mx + 200,
						my - 150,
						mx + 5,
						my + 5,
						c_yellow,
						c_yellow,
						c_orange,
						c_orange,
						false
					);
					
					text_align(fa_left, fa_top);
					draw_set_alpha(1.0);
					
					draw_text_color(
						mx + 5,
						my - 150,
						$"{_recipies[recipe_index].products[0].tooltip}",
						c_black,
						c_black,
						c_black,
						c_black,
						1
					);*/
					
					draw_sprite_ext(spr_tooltip, 1, mx, my - 150, 1.2, 0.8, 0, c_white, 1);
					
					text_align(fa_left, fa_top);
					draw_set_alpha(1.0);
					
					draw_text_color(
						mx + 15,
						my - 145,
						$"{_recipies[recipe_index].products[0].name}",
						c_purple,
						c_purple,
						c_purple,
						c_purple,
						1
					);

					draw_text_color(
						mx + 15,
						my - 125,
						$"{_recipies[recipe_index].products[0].tooltip}",
						c_black,
						c_black,
						c_black,
						c_black,
						1
					);
			}
		}
	}
}
else
{
	var pos_x = ui_padding_x + (ui_border_size * 3) + 10;
	var pos_y = ui_padding_y + (ui_border_size * 13) + 75;
	draw_set_font(fn_Ubuntu);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text(pos_x, pos_y, "You have to\nget closer to\na workbench\nto craft!");
}

draw_reset();