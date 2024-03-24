rotation = lerp(rotation, 45, 0.1);

image_angle = rotation * obj_player.image_xscale;
image_xscale = sign(obj_player.image_xscale);

var _waterable = instance_position(obj_player._dx, obj_player._dy, obj_plants);
var _key_press = keyboard_check(ord("Z"));

with (_waterable)
{
	other.selector_inst = id;
	
	if _key_press
	{
		watered = true;
		other.rotation = -80;
	}
}