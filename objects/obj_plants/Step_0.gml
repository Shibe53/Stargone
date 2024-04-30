if alarm_pause
{
	alarm[0] += 1;
}

if keyboard_check_pressed(ord("F")) and obj_tutorial.state = "WATER"
{
	obj_tutorial.state = "MORE WATER";
	alarm_pause = false;
}

if keyboard_check_pressed(ord("Q")) and obj_tutorial.state = "HARVEST"
{
	obj_tutorial.state = "HARVESTED";
	alarm_pause = false;
}