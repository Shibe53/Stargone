if can_use
{
	rotation = lerp(rotation, 45, 0.1);

	image_angle = rotation * obj_player.image_xscale;
	image_xscale = sign(obj_player.image_xscale);

	var _waterable = instance_nearest(obj_player.x - 30, obj_player.y - 50, obj_plants);
	var _key_press = keyboard_check_pressed(vk_space);

	with (_waterable)
	{
		if (state = "SEED" or state = "SPROUT") and distance_to_object(obj_player) <= 30 //wtf distance
		{
			other.selector_inst = id;
		
			if _key_press
			{
				watered = true;
				other.rotation = -80;
			}
		}
	}
}