// inputs
if !inv_controls
{
	var _right_key = keyboard_check(ord("D"));
	var _left_key = keyboard_check(ord("A"));
	var _up_key = keyboard_check(ord("W"));
	var _down_key = keyboard_check(ord("S"));
} 
else
{
	var _right_key = keyboard_check(ord("A"));
	var _left_key = keyboard_check(ord("D"));
	var _up_key = keyboard_check(ord("S"));
	var _down_key = keyboard_check(ord("W"));
}

// getting x and y speeds
xspd = (_right_key - _left_key) * move_spd;
yspd = (_down_key - _up_key) * move_spd;

// collisions
if collision(x + xspd, y)
{
	xspd = 0;
}

if collision(x, y + yspd)
{
	yspd = 0;
}

// get direction player is facing
if xspd > 0
{
	dir = 1;
}
else if xspd < 0
{
	dir = 3;
}
if yspd > 0
{
	dir = 4;
}
else if yspd < 0
{
	dir = 2;
}

// get coordinates right in front of player
var _ad_x = (dir == 1) - (dir == 3);
var _ad_y = (dir == 4) - (dir == 2);
_dx = (x div 16 + _ad_x) * 16;
_dy = (y div 16 + _ad_y) * 16;

// move the player
x += xspd;
y += yspd;

// animation 
if xspd != 0 or yspd != 0
{
	sprite_index = spr_player_move;
	
	if xspd != 0
	{
		image_xscale = sign(xspd);
	}
} 
else 
{
	sprite_index = spr_player_idle;
}

// change held item
if keyboard_check_pressed(ord("Q"))
{
	instance_destroy(held_item);
	item_index++;
	if item_index > 1
	{
		item_index = 0;
	}
	held_item = instance_create_layer(x, y, "instances", items[item_index]);
}