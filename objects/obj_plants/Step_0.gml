if alarm_pause
{
	alarm[0] += 1;
}

if instance_exists(obj_tutorial)
{
	if keyboard_check_pressed(vk_space) and obj_tutorial.state = "WATER"
	{
		obj_tutorial.state = "MORE WATER";
		alarm_pause = false;
	}

	if keyboard_check_pressed(ord("Q")) and obj_tutorial.state = "HARVEST"
	{
		obj_tutorial.state = "HARVESTED";
		alarm_pause = false;
	}
}