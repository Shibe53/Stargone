function text_drop_shadow(_x, _y, _string, _xscale, _yscale, _color1, _color2, _color_shadow, _h_offset, _v_offset){  
    draw_set_color(_color_shadow);
    draw_text_transformed(_x, _y, _string, _xscale, _yscale, 0);
	draw_text_transformed_color(_x+_h_offset, _y+_v_offset, _string, _xscale, _yscale, 0, _color1, _color1, _color2, _color2, 1);
	draw_set_color(c_white);
}