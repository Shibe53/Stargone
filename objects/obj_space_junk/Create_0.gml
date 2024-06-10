alarm[0] = 60 * 60;  
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


//variables for the scrollbar
scrollbar_x = 0;
scrollbar_y = 0;
scrollbar_width = 10;
scrollbar_height = 100;
scrollbar_slider_y = 0;
scrollbar_slider_height = 20;

dragging_slider = false; //indicates if slider is being dragged
slider_drag_offset_y = 0; //offset to maintain relative mouse position during dragging

global.box_x = 0;
global.box_y = 0;
