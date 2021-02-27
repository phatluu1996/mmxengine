// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_weapon_init(){
	global.weaponIndex = 0;
	
	for (var i = 0; i < 9; ++i) {
		global.weaponUnlocked[i] = true;
	}
}