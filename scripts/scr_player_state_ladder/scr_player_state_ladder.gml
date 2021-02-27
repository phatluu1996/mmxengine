function scr_player_state_ladder(){
	scr_player_get_input();
	busterYOffset = y - 11;	
	
	
	var dir = (key_down - key_up);
	vsp = dir * climbSpd * (!normalAtk) * (!normalShoot) * (!specialShoot);	
	
	if(vsp != 0 or normalAtk or normalShoot or specialShoot){
		image_speed = 1;
	}else{
		scr_player_horizone_turn();
		image_speed = 0;	
	}	
	
	if(vsp < 0 and instance_position(x, bbox_top, objLadder) < 0){
		state = PlayerState.GrabLadder;
		climbDir = ClimbType.GetUp;
		image_index = 0;
	}
	
	if(key_jump){
		image_speed = 1;
		image_index = 0;
		state = PlayerState.Jump;
		normalAtk = false;
	}

	if(character == Character.Z) scr_player_zero_single_attack(Action.climb_attack, sprite_map_get(Action.climb));
	if(scr_is_player_x()) scr_player_x_attack(sprite_map_get(Action.climb_attack), sprite_map_get(Action.climb)); 
}