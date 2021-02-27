function scr_player_state_normal(){
	scr_player_get_input();	
	busterYOffset = y - 11;
	hsp = 0;
	mask_index = normal_mask;	
	hyperJump = false;		
	
	if ((key_left or key_right) and !normalAtk and !specialShoot and !place_meeting(x + (key_right - key_left), y, objPrtSolid)) state = PlayerState.Movement;	
	
	if (key_jump and !specialShoot and !place_meeting(x , y - 1, objPrtSolid) and !place_meeting(x, y - 1, objSlope)) {
		state = PlayerState.Jump;
		vsp = -jumpSpd;	
		normalAtk = false;
		atkIndex = 0;
		sideMovingPlatform = noone;
		if(key_dash_press) hyperJump = true;
		exit;
	}else if(!place_meeting(x,y+1, objPrtSolid) and !place_meeting(x, y + vsp + 1, objMovingSolid) and !place_meeting(x,y+1, objTopLadder) and !place_meeting(x,y+1, objSlope)){
		state = PlayerState.Jump;	
	}

	
	if (key_dash_press and !specialShoot and !key_jump) {
		mask_index = lower_mask;
		normalAtk = false;
		atkIndex = 0;
		if (!wall_collide_1px()){
			state = PlayerState.Dash;	
			image_index = 0;		
		}else{
			mask_index = normal_mask;
		}
	}
	
	var ladderDown = instance_place(x, y + 1, objTopLadder);
	var ladderUp = instance_place(x, y, objLadder);
	if(ladderDown >= 0 and x < ladderDown.x + 8 and x > ladderDown.x - 8 and key_down and ladderDown.y > y and !specialShoot ){		
		climbDir = ClimbType.Down;
		state = PlayerState.GrabLadder;
		x = ladderDown.x;
		hsp = 0;
		image_index = 0;
		normalAtk = false;
		atkIndex = 0;
		exit;
	}else if(ladderUp >= 0 and x < ladderUp.x + 8 and x > ladderUp.x - 8 and key_up and !specialShoot ){
		climbDir = ClimbType.Up;
		state = PlayerState.GrabLadder;		
		x = ladderUp.x;
		hsp = 0;
		image_index = 0;
		normalAtk = false;
		atkIndex = 0;
	}else{
		if (key_down and !specialShoot){
			hsp = 0;
			state = PlayerState.Crouch;
			mask_index = lower_mask;
			normalAtk = false;
			atkIndex = 0;
		}	
	}	
	
	if(character == Character.Z) scr_player_zero_combo_attack(sprite_map_get(Action.idle));
	if(scr_is_player_x()) scr_player_x_attack(sprite_map_get(Action.attack), sprite_map_get(Action.idle));
}