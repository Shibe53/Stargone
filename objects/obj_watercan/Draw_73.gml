if instance_exists(selector_inst) and can_use
{
	with (selector_inst)
	{
		draw_sprite_ext(spr_selector, other.selector_frame, bbox_left, bbox_top, 1, 1, 0, -1, 1);
		draw_sprite_ext(spr_selector, other.selector_frame, bbox_right, bbox_top, 1, 1, -90, -1, 1);
		draw_sprite_ext(spr_selector, other.selector_frame, bbox_right, bbox_bottom, 1, 1, 180, -1, 1);
		draw_sprite_ext(spr_selector, other.selector_frame, bbox_left, bbox_bottom, 1, 1, 90, -1, 1);
	}
	
	selector_frame += 0.15;
	
	if selector_frame >= selector_frame_number
	{
		selector_frame -= selector_frame_number;
	}
	
	selector_inst = noone;
}