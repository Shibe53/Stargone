// Minutes and seconds for the timer
var _min = floor(alarm[0]) div 60 div 60;
var _sec = floor(alarm[0]) div 60 mod 60;

// Formats them properly
var _min_string = string_replace(string_format(_min, 2, 0), " ", "0");
var _sec_string = string_replace(string_format(_sec, 2, 0), " ", "0");

// Determine coordinates for the timer text to appear below the space junk
var text_x = x + sprite_get_width(spr_space_junk) / 2; 
var text_y = y + sprite_get_height(spr_space_junk) - 10; 

// Draws the timer
draw_set_font(fnt_timer_junk); 
draw_set_halign(fa_center); 
draw_set_valign(fa_top); 

// Draw the space junk if it's visible
draw_sprite(spr_space_junk, 0, x, y);
draw_set_color(c_yellow); 
if (space_junk_visible = true) {
    draw_text(text_x, text_y, "Done");
} else {
    if (alarm[0] > 0) {
        draw_text_transformed_color(text_x, text_y, _min_string + ":" + _sec_string, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
    }   
}


