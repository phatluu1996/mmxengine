// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wall_collide_1px(){
	return place_meeting(x + image_xscale, y, objPrtSolid);
}