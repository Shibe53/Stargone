if space_junk_visible = false {
    space_junk_visible = true;
    alarm[0] = -1;  // Stop the alarm until space junk is clicked
} else {
    space_junk_visible = false;
    alarm[0] = 60 * 60;  // Restart the timer
	selector_inst = noone;
}