// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.g_one_second = 240;

game_set_speed(global.g_one_second, gamespeed_fps);

/*
	Functions used for player movement
*/

function	player_get_commands()
{
	var _right		= keyboard_check(ord("D"));
	var _left		= keyboard_check(ord("A"));
	var _up			= keyboard_check(ord("W"));
	var _down		= keyboard_check(ord("S"));
	var _is_moving	= _up || _down || _right || _left;
	var _shoot		= mouse_check_button_pressed(mb_left);
	var _reload		= keyboard_check_pressed(ord("R"));

	return 
	{
		right		: _right,
		left		: _left,
		up			: _up,
		down		: _down,
		is_moving	: _is_moving,
		shoot		: _shoot,
		mRaload		: _reload,
	}
}

function	get_sign(n)
{
	return ((n > 0) - (n < 0));
}

function	vertical_walking(move_direction_speed)
{
	var	_vSpeed		= move_direction_speed;
	var	_vMove		= get_sign(_vSpeed);
	
	y += _vSpeed;
}

function	horizontal_walking(move_direction_speed)
{
	var	_hSpeed		= move_direction_speed;
	var	_hMove		= get_sign(_hSpeed);

	if (_hMove != 0)
		image_xscale = _hMove;
	x += _hSpeed;
}

function	walking(move_direction_x, move_direction_y, move_speed)
{
	var	_hMove = move_direction_x;
	var	_vMove = move_direction_y;
	var	_vSpeed;
	var	_hSpeed;
	
	//Vector normalize if walking in diagonal
	if (_hMove != 0 && _vMove != 0)
	{
		var	vector_length	= sqrt(sqr(_hMove) + sqr(_vMove));
		_hSpeed				= (_hMove / vector_length) * move_speed;
		_vSpeed				= (_vMove / vector_length) * move_speed;
	}
	else
	{
		_hSpeed		= _hMove * move_speed;
		_vSpeed		= _vMove * move_speed;
	}
	horizontal_walking(_hSpeed);
	vertical_walking(_vSpeed);
}
