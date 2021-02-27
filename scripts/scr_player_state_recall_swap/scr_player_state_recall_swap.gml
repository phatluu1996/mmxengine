function scr_player_state_recall_swap(){
	sprite_index = sprite_map_get(Action.recall);
	if(last_frame()){
		image_index = image_number - 1;
		y += -jumpSpd;
		if(camera_y > y + camera_h){			
			instance_destroy();	
		}
	}
}