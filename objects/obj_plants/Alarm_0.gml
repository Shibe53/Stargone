if !watered
{
	state = "WITHERED";
	image_index = 3;
	hide_timer = true;
} 
else 
{
	switch state
	{
		case "SEED":
		{
			image_index = 1;
			state = "SPROUT";
			watered = false;
			alarm[0] = 60 * alarm_speed;
		} break;
		
		case "SPROUT":
		{
			image_index = 2;
			state = "HARVEST";
			alarm[0] = 60 * alarm_speed / 1.5;
			if instance_exists(obj_tutorial)
			{
				obj_tutorial.state = "HARVEST";
				alarm_pause = true;
			}
		} break;
		
		case "HARVEST":
		{
			image_index = 3;
			state = "WITHERED";
			hide_timer = true;
		} break;
	}
}