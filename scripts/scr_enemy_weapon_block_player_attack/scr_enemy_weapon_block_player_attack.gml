// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_weapon_block_player_attack(){
	var buster = instance_place(x, y, objXBuster);
	if(buster >= 0){
		var block = instance_create_depth(x, y, depth - 1, objPlayerWeaponImpact);
		block.sprite_index = spr_x_buster_block_lv3;
		instance_destroy(buster);
	}else if(place_meeting(x, y, objZSaber)){
		if(instance_number(objPlayerWeaponImpact) < 1){
			var block = instance_create_depth(x, y, depth - 1, objPlayerWeaponImpact);
			block.sprite_index = spr_x_buster_block_lv2;
		}
	}
}