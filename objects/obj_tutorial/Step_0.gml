switch state
{
	case "MOVE":
	{
		if keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("S")) or keyboard_check_pressed(ord("D"))
		{
			state = "INV";
			tip = "Open your inventory by pressing E";
		}
	} break;
	case "INV":
	{
		if keyboard_check_pressed(ord("E"))
		{
			state = "PLANT";
			tip = "Click on a seed and plant it\nby clicking on an empty dirt patch";
		}
	} break;
	case "PLANT":
	{
		break;
	}
	case "WATER":
	{
		tip = "Water the plant by pressing F\nDo so before the timer runs out!";
	} break;
	case "MORE WATER":
	{
		tip = "You have to water the plant 2 times\nbefore you can harvest";
	} break;
	case "HARVEST":
	{
		tip = "The plant is now harvestable!\nPress Q to switch to your shovel";
	} break;
	case "HARVESTED":
	{
		tip = "Press F to harvest the plant";
		state = "WITHER";
	} break;
	case "WITHER":
	{
		if keyboard_check_pressed(ord("F"))
		{
			tip = "If a timer ends, the plant will wither\nUse the shovel to remove it";
			alarm[0] = 60 * 6;
		}
	} break;
	case "CRAFT":
	{
		tip = "You can use the plant drops\nto craft useful items, like powerups";
		if alarm_on
		{
			alarm[1] = 60 * 6;
			alarm_on = false;
		}
		else
		{
			if keyboard_check_pressed(ord("E"))
			{
				instance_destroy();
			}
		}
	} break;
}