event_inherited();

if instance_exists(obj_controls)
{
	instance_destroy(obj_controls);
	instance_destroy(obj_button_controls_exit);
}