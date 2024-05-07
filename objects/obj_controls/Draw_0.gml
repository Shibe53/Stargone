draw_set_font(fnt_help);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if instance_exists(obj_pause)
{
	draw_set_color(c_blue); 
    draw_set_alpha(1.0);
    draw_rectangle(0, 0, room_width, room_height, false);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	draw_text(x + 10, y - 60, lecture);
}
else
{
	draw_text(x + 10, y - 60, lecture);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);