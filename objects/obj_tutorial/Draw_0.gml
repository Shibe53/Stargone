draw_set_font(fnt_help);
draw_set_color(c_white); 
draw_set_alpha(1.0); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_alpha(0.6);
draw_set_color(c_purple); 
draw_rectangle(camera_get_view_x(view_camera[0]) + 100, camera_get_view_y(view_camera[0]) + 260, camera_get_view_x(view_camera[0]) + 550, camera_get_view_y(view_camera[0]) + 335, false);
draw_set_alpha(1.0); 
draw_set_color(c_white);
text_drop_shadow(camera_get_view_x(view_camera[0]) + 330, camera_get_view_y(view_camera[0]) + 300, tip, 1, 1, c_white, c_white, c_dkgray, 3, 2);