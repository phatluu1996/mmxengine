function scr_player_state_damaged(){
	scr_player_get_input();
	
	hsp = -image_xscale * runSpd
	
	vsp = (vsp >= jumpSpd ? jumpSpd : vsp + gravSpd);
	
	if(damagedCount < damagedDuration){
		damagedCount++;
	}else{
		if(place_meeting(x,y,objTopLadder)){
			state = PlayerState.Jump;	
		}else{
			state = PlayerState.Normal;	
		}
	}
	
	sprite_index = sprite_map_get(Action.damaged);
}