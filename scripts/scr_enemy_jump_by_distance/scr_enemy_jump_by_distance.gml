// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_jump_by_distance(sprite, height, distance, dir){
	vsp = -sqrt(abs(2*gravSpd*height));
	jumpCount = ceil(abs(2*vsp/gravSpd));	
	hsp = (distance/jumpCount)*dir;
	sprite_index = sprite;
}