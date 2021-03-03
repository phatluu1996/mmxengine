function scr_player_state_move(){
	scr_player_get_input();
	busterYOffset = y - 13;
	mask_index = normal_mask;
	scr_player_horizone_turn();
	hsp = (key_right - key_left) * runSpd * (!wall_collide_1px());
	
	
	if((!key_left and !key_right) or place_meeting(x + image_xscale, y, objPrtSolid) or place_meeting(x + image_xscale * 2, y + vsp, objMovingSolid)) state = PlayerState.Normal;
	
	if (key_jump and !airDash and !place_meeting(x , y - 1, objPrtSolid) and !place_meeting(x, y - 1, objSlope)) {
		state = PlayerState.Jump;
		sideMovingPlatform = noone;
		vsp = -jumpSpd;	
		if(key_dash_press) hyperJump = true;
	}else if(!place_meeting(x,y+1, objPrtSolid) and !place_meeting(x, y + vsp + 1, objMovingSolid) and !place_meeting(x,y+1, objTopLadder) and !place_meeting(x,y+1, objSlope)){
		state = PlayerState.Jump;	
	}
	
	if (key_dash_press and !key_jump) {
		mask_index = lower_mask;
		if (!wall_collide_1px()){
			state = PlayerState.Dash;	
			image_index = 0;		
		}else{
			mask_index = normal_mask;
		}
	}
	
	
	if (key_down){
		hsp = 0;
		state = PlayerState.Normal;
	}
	
	if(scr_is_player_x()){
		scr_player_x_attack(sprite_map_get(Action.run_attack), sprite_map_get(Action.run)); 
	}else {
		scr_player_zero_technique_perform();
		if(key_attack_press and !normalAtk){		
			normalAtk = true;
			image_index = 0;	
			state = PlayerState.Normal;
			scr_player_zero_new_saber_mask();
		}
		sprite_index = sprite_map_get(Action.run);
	}
}