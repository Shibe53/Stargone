
var _mouse_press = mouse_check_button_released(mb_left);

var _plantable = instance_position(mouse_x, mouse_y, obj_dirt_patch);

with (_plantable)
{
	// get distance
	var _dist = distance_to_object(obj_player);
	
	// in range?
	if _dist < other.break_distance
	{
		// on click
		if _mouse_press and !has_plant
		{
			instance_create_layer(x, y, "instances", obj_galaxy_cactus);
			has_plant = true;
			obj_player.held_item.can_use = true;
			other.destroy = true;
			break;
		}	
	}
	
	if keyboard_check_pressed(ord("E")) 
	{
		obj_player.held_item.can_use = true;
		other.destroy = true;
		break;
	}
}

if destroy
	instance_destroy();
