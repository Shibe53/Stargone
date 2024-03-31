if (!obj_inventory.show_inventory)
{
	draw_sprite_ext(spr_hotbar, 1, x, y, 1.5, 1.5, 0, c_white, 1);
	draw_sprite_ext(object_get_sprite(obj_player.items[obj_player.item_index]), 1, x + 50, y + 75, 2.5, 2.5, 30, c_white, 1);
}

draw_reset();