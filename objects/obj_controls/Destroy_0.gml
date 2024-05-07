if instance_exists(obj_pause)
{
	instance_activate_object(obj_button_play);
	instance_activate_object(obj_button_controls);
	instance_activate_object(obj_button_quit);
}
else
{
	instance_activate_all();
}