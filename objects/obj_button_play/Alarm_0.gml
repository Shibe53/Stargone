event_inherited();

if instance_exists(obj_pause)
{
	keyboard_key_press(vk_escape);
	keyboard_key_release(vk_escape);
}
else
{
	room_goto(rm_game);
}