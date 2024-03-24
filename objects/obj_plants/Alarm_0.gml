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
			alarm[0] = 60 * 5;
			break;
		}
		case "SPROUT":
		{
			image_index = 2;
			state = "HARVEST";
			alarm[0] = 60 * 5;
			break;
		}
		case "HARVEST":
		{
			image_index = 3;
			state = "WITHERED";
			hide_timer = true;
			break;
		}
	}
}