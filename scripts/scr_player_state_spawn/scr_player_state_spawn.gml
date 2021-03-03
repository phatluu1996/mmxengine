function scr_player_state_spawn(){	
		sprite_index = sprite_map_get(Action.spawn);
		if(y >= ystart) {
			y = ystart;
			vsp = 0;
			if(last_frame()){
				state = PlayerState.Normal;	
			}
		}else{
			y += teleSpd;
			image_index = 0;
		}
}