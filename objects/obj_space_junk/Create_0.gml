alarm[0] = 60 * 10;  
space_junk_visible = false;
alarm_color = c_white;

selector_inst = noone;
selector_frame = 0;
selector_frame_number = sprite_get_number(spr_selector_use);

show_selection_box = false;

if (!variable_global_exists("seeds")) {
    global.seeds = [];
}

global.show_selection_box = false;
global.selection_box_active = false;
global.scroll_offset = 0;

