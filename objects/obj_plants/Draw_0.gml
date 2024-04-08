// Minutes and seconds for the timer
var _min = floor(alarm[0]) div 60 div 60;
var _sec = floor(alarm[0]) div 60 mod 60;

// Formats them properly
var _min_string = string_replace(string_format(_min, 2, 0), " ", "0");
var _sec_string = string_replace(string_format(_sec, 2, 0), " ", "0");

// Draws the timer

draw_self();

draw_set_font(fnt_timer);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if !hide_timer
{
	draw_text_transformed_color(x, y + 10, _min_string + ":" + _sec_string, 0.12, 0.12, 0, alarm_color, alarm_color, alarm_color, alarm_color, 1);
}

if !watered and state != "WITHERED"
{
	draw_sprite_ext(spr_no_water, 1, x + 20, y - 10, 0.70, 0.70, 0, c_white, 1);
}

if state = "HARVEST"
{
	draw_sprite_ext(spr_harvestable, 1, x + 20, y - 10, 0.70, 0.70, 0, c_white, 1);
}

if state = "WITHERED"
{
	draw_sprite_ext(spr_withered, 1, x + 20, y - 10, 0.70, 0.70, 0, c_white, 1);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);