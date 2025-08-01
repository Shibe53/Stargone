if(showing_dialog == true) {
	var text_x = 30;
	var text_y = 18;
	var height = 32;
	var border = 5;
	var padding = 16;	
	
	height = string_height(current_dialog.message);
	
	if(sprite_get_height(current_dialog.sprite) > height) {
		height = sprite_get_height(current_dialog.sprite);
	}
	
	height += padding * 2;
	text_x = sprite_get_width(current_dialog.sprite) + (padding * 4);
	
	draw_set_alpha(alpha);
	
	var box_pos = display_get_gui_height() - height;
	
	draw_set_font(fnt_dialogue);
	
	draw_set_color(c_purple);
	draw_rectangle(0, box_pos, display_get_gui_width(), box_pos + height, false);
	
	draw_set_color(c_white);
	draw_rectangle(border, box_pos + border, display_get_gui_width() - border, box_pos + height - border, false);
	
	draw_set_color(c_black);
	draw_rectangle((border * 2), box_pos + (border * 2), display_get_gui_width() - (border * 2), box_pos + height - (border * 2), false);
	
	if(current_dialog.sprite != -1) {
		draw_sprite(current_dialog.sprite, 0, border * 3, box_pos + border * 3);
	}
	
	draw_set_color(c_white);
	text_align(fa_left, fa_top);
	draw_text_ext(text_x, box_pos + text_y + 5, current_dialog.message, 50, display_get_gui_width() - 300);
	draw_text_ext_color(display_get_gui_width() - 390, box_pos + height - 55, "Press SPACE to proceed", 20, display_get_gui_width() - 100, c_white, c_white, c_white, c_white, 0.3);
	
	alpha = lerp(alpha, 1, 0.06);
}

draw_set_alpha(1);