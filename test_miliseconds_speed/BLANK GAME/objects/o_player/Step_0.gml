/// @description Insert description here
// You can write your code in this editor

var	commands = player_get_commands();

walking(commands.right - commands.left, commands.down - commands.up, move_speed);

