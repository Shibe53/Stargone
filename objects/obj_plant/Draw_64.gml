// Minutes and seconds for the timer
var _min = floor(alarm[0]) div 60 div 60;
var _sec = floor(alarm[0]) div 60 mod 60;

// Formats them properly
var _min_string = string_replace(string_format(_min, 2, 0), " ", "0");
var _sec_string = string_replace(string_format(_sec, 2, 0), " ", "0");

// Draws the timer
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, _min_string + ":" + _sec_string);