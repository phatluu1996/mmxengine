// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_turn_to_player(){
	player = instance_find(objPrtPlayer, 0);
	image_xscale = x > player.x ? -1 : 1;
}