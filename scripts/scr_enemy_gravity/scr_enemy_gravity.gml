// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_gravity(){
	if(!place_meeting(x, y + 1, objPrtSolid) and !place_meeting(x, y + 1, objSlope)) 
		vsp = vsp >= 5.25 ? 5.25 : vsp + gravSpd;
}