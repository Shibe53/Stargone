var _key_press = keyboard_check_pressed(ord("P"));

if (_key_press)
{
    if (state == PLAYING)
    {
        // Let's pause the game
        surface_copy(surface, 0, 0, application_surface);
        instance_deactivate_all(true);
        state = PAUSED;
    }
    else if (state == PAUSED)
    {
        // Let's start the game
        instance_activate_all();
        state = PLAYING;
    }
}

// Reset _key_press
_key_press = 0;