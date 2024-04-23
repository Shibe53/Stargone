if (state == PAUSED)
{
    draw_set_color(c_black);
    draw_set_alpha(1.0);
    draw_surface(surface, 0, 0);

    draw_set_alpha(0.4);
    draw_rectangle(0, 0, room_width, room_height, false);

    draw_set_color(c_white); 
    draw_set_alpha(1.0); 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle); 
    draw_text(room_width / 2, room_height / 2, "Game Paused");
}