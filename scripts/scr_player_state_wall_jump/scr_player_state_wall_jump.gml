function scr_player_state_wall_jump(){
	scr_player_get_input();
	busterYOffset = y - 13;
	if(place_meeting(x , y - 1, objPrtSolid)){
		wallJumpCount = 0;
		image_index = 0;
		state = PlayerState.Jump;		
	}else{
		if(wallJumpCount < wallJumpDuration/4){		
			image_index = 5;
			var spd = hyperJump ? runSpd * 3 : (runSpd + 0.5);			
			hsp = wallJumpDir * spd;
			wallJumpCount++;
		}else{
			wallJumpCount = 0;
			image_index = 0;
			state = PlayerState.Jump;	
		}	
	}
	
	vsp = vsp >= jumpSpd ? jumpSpd : vsp + gravSpd;
	
	var ladder = instance_place(x, y, objLadder);
	if(ladder >= 0 and (key_up or key_down) and x < ladder.x + 4 and x > ladder.x - 4) {
		state = PlayerState.Ladder;	
		x = ladder.x;
		image_index = 0;
		hsp = 0;
	}
	
	
	
	if(character == Character.Z) scr_player_zero_single_attack(Action.jump_attack, sprite_map_get(Action.wall_kick));
	if(scr_is_player_x()) scr_player_x_attack(sprite_map_get(Action.jump_attack), sprite_map_get(Action.wall_kick)); 
}