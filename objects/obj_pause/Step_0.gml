var _key_press = keyboard_check_pressed(vk_escape);

if (_key_press) and pausable
{
    if (state == "PLAYING")
    {
        // Let's pause the game
        surface_copy(surface, 0, 0, application_surface);
        instance_deactivate_all(true);
		instance_create_layer(camera_get_view_x(view_camera[0]) + 330, camera_get_view_y(view_camera[0]) + 310, "GUI", obj_button_quit);
        //instance_create_layer(camera_get_view_x(view_camera[0]) + 330, camera_get_view_y(view_camera[0]) + 230, "GUI", obj_button_controls);
		var play = instance_create_layer(camera_get_view_x(view_camera[0]) + 330, camera_get_view_y(view_camera[0]) + 150, "GUI", obj_button_play);
		play.button_text = "Resume";
		state = "PAUSED";
    }
    else if (state == "PAUSED")
    {
        // Let's start the game
		instance_destroy(obj_button_play);
		//instance_destroy(obj_button_controls);
		instance_destroy(obj_button_quit);
        instance_activate_all();
        state = "PLAYING";
    }
}

// Reset _key_press
_key_press = 0;