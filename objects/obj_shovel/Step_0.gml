if can_use
{
	rotation = lerp(rotation, 45, 0.1);

	image_angle = rotation * obj_player.image_xscale;
	image_xscale = sign(obj_player.image_xscale);

	var _harvestable = instance_nearest(x, y, obj_plants);
	var _key_press = keyboard_check_pressed(ord("Z"));

	with (_harvestable)
	{
		if (state = "HARVEST" or state = "WITHERED") and distance_to_object(obj_player) <= 30 // distance doesn't work lmao
		{
			other.selector_inst = id;
		
			if _key_press
			{
				instance_destroy();
				other.rotation = -80;
			}
		}
	}
}