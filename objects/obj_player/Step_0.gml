// inputs
var _right_key = keyboard_check(ord("D"));
var _left_key = keyboard_check(ord("A"));
var _up_key = keyboard_check(ord("W"));
var _down_key = keyboard_check(ord("S"));

// getting x and y speeds
xspd = (_right_key - _left_key) * move_spd;
yspd = (_down_key - _up_key) * move_spd;

// collisions
if place_meeting(x + xspd, y, obj_wall) == true
{
	xspd = 0;
}

if place_meeting(x, y + yspd, obj_wall) == true
{
	yspd = 0;
}

// move the player
x += xspd;
y += yspd;

if (tilemap_get_at_pixel(tilemap, x + 1, y))
{
}
