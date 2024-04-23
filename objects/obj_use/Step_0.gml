
var _mouse_press = mouse_check_button_released(mb_left);

switch state
{
	case "seed":
	{
		var _plantable = instance_position(mouse_x, mouse_y, obj_dirt_patch);

		with (_plantable)
		{
			// get distance
			var _dist = distance_to_object(obj_player);
	
			// in range?
			if _dist < other.break_distance
			{
				// get selected
				other.selector_inst = id;
				
				// on click
				if _mouse_press and !has_plant
				{
					plant = instance_create_layer(x, y - 2, "instances", other.plant);
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
	} break;
	
	case "powerup":
	{
		var _powerupable = instance_position(mouse_x, mouse_y, obj_plants);

		with (_powerupable)
		{
			// get distance
			var _dist = distance_to_object(obj_player);
	
			// in range?
			if _dist < other.break_distance and state != "WITHERED" and state != "HARVESTABLE"
			{
				// get selected
				other.selector_inst = id;
			
				// on click
				if _mouse_press
				{
					alarm_speed = 5;
					alarm[0] /= 2;
					alarm_color = c_yellow;
					obj_player.held_item.can_use = true;
					other.destroy = true;
					break;
				}	
			}
		}
	} break;
	
	case "tree":
	{
		var _upgradeable = instance_position(mouse_x, mouse_y, obj_tree);

		with (_upgradeable)
		{
			// get distance
			var _dist = distance_to_object(obj_player);
	
			// in range?
			if _dist < other.break_distance
			{
				// get selected
				other.selector_inst = id;
			
				// on click
				if _mouse_press
				{
					
					break;
				}	
			}
		}
	} break;
}

if mouse_check_button(mb_right) or keyboard_check_pressed(ord("E"))
{
	obj_player.held_item.can_use = true;
	destroy = true;
}

if destroy
	instance_destroy();