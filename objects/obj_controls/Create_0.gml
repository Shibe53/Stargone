if instance_exists(obj_pause)
{
	instance_deactivate_object(obj_button_play);
	instance_deactivate_object(obj_button_controls);
	instance_deactivate_object(obj_button_quit);
	instance_deactivate_object(obj_pause);
}
else
{
	instance_deactivate_all(true);
}
lecture = "    Walk: WASD                     Switch tools: Q\nUse held item: SPACE           Open inventory: E\nYou can plant seeds by clicking them from your\ninventory and clicking on an empty dirt patch.\nYou must keep the plants watered and harvest them\n when possible, otherwise they will wither.\n Harvesting will give you items which you can use\nto craft at a workbench for powerups\nand other items.";
instance_create_layer(x + 250, y + 95, "Instances", obj_button_controls_exit);