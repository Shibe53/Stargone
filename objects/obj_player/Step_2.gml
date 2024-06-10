// change held item position
if instance_exists(held_item)
{
	held_item.x = x - 10 * image_xscale;
	held_item.y = y - 15;
	held_item.depth = obj_player.depth - 3;
}

// manual camera implementation
#region

var _half_view_width = camera_get_view_width(view_camera[0]) / 2;
var _half_view_height = camera_get_view_height(view_camera[0]) / 2;

camera_set_view_pos(view_camera[0], x - _half_view_width, y - _half_view_height);

#endregion