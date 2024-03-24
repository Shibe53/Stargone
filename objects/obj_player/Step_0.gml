// inputs
var _right_key = keyboard_check(vk_right);
var _left_key = keyboard_check(vk_left);
var _up_key = keyboard_check(vk_up);
var _down_key = keyboard_check(vk_down);

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
