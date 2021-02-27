function scr_player_state_dash_up(){
	scr_player_x_buster_charge();
	vsp = 0;
	hsp = 0;
	if(last_frame()){
		image_index = image_number - 1;	
		state = PlayerState.Jump;
		vsp = -jumpSpd;
		hyperJump = true;
	}
	
	sprite_index = sprite_map_get(Action.dash_up);
}