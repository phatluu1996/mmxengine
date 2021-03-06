function scr_player_state_boss_encounter(){
	if(!place_meeting(x, y + 1, objPrtSolid)){
		vsp = vsp >= jumpSpd ? jumpSpd : vsp + gravSpd;
	}
	if(vsp != 0){
		sprite_index = sprite_map_get(Action.fall);	
	}else{
		sprite_index = sprite_map_get(Action.idle);	
		if(!global.bossStart){
			global.bossStart = true;	
		}
	}	
}