function scr_hoganmer_step_event(){
	switch (action) {
		case "idle":
			scr_enemy_turn_to_player();
			sprite_index = spr_hoganmer_idle;
			resist = true;
			if(collision_rectangle(x + image_xscale * 160, bbox_top - 64, x, bbox_bottom + 64, objPrtPlayer, false, true) >= 0){
				action = "attack";		
				image_index = 0;
				count = 0;
			}
			break;
			
		case "attack":
			resist = false;
			sprite_index = spr_hoganmer_attack;
			if(last_frame()){
				image_index = image_number - 1;				
				if(count == 0){
					scr_hoganmer_attack();
				}
				count--;
				if(count < 0){
					count = 0;
					action = "wait";	
				}
			}
			break;
			
		case "wait":
			scr_enemy_turn_to_player();
			sprite_index = spr_hoganmer_idle;
			resist = true;
			if(count < 120){
				count++;	
			}else{
				count = 0;
				action = "idle";
			}
			break;
		
		
		default:
			action = "idle";
			break;
	}
	scr_enemy_gravity();
	scr_enemy_collision_movement();
}