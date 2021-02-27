function scr_player_state_crouch(){
	scr_player_get_input();
	scr_player_zero_technique_perform();
	
	busterYOffset = y - 7;
	mask_index = lower_mask;
	hsp = 0;
	
	scr_player_horizone_turn();
	
	if(!key_down){
		state = PlayerState.Normal;	
		mask_index = normal_mask;
		if(normalAtk){
			normalAtk = false;	
		}
	}
	
	if (key_dash_press and !wall_collide_1px()) {
		state = PlayerState.Dash;	
		image_index = 0;
		mask_index = lower_mask;
	}

	if(character == Character.Z) scr_player_zero_single_attack(Action.crouch_attack, sprite_map_get(Action.crouch));	
	if(scr_is_player_x()) scr_player_x_attack(sprite_map_get(Action.crouch_attack), sprite_map_get(Action.crouch)); 
}