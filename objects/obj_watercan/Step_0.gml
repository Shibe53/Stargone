rotation = lerp(rotation, 45, 0.1);

image_angle = rotation * obj_player.image_xscale;
image_xscale = sign(obj_player.image_xscale);

var _waterable = instance_nearest(x, y, obj_plants);
var _key_press = keyboard_check(ord("Z"));

with (_waterable)
{
	if distance_to_object(obj_player) <= 10 
	{
		other.selector_inst = id;
		
		if _key_press
		{
			watered = true;
			other.rotation = -80;
		}
	}
}