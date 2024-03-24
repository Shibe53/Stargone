var _player_exists = instance_exists(obj_player);
var _held_item = noone;

if _player_exists
{
	_held_item = obj_player.held_item;
}

with(all) 
{
	depth = -bbox_bottom;
	
	if _player_exists and _held_item == id
	{
		depth -= 10;
	}
}