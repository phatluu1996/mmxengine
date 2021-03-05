function scr_fire_guy_step_event(){
	switch (action) {
		case "idle":
			sprite_index = spr_fire_guy_idle;
			scr_enemy_turn_to_player();
			if(collision_rectangle(x + image_xscale * 160, bbox_top - 128, x, bbox_bottom + 128, objPrtPlayer, false, true) >= 0){
				action = "attack";		
				image_index = 0;
				count = 0;
			}
			break;
		
		case "attack":
			sprite_index = spr_fire_guy_shoot;
			if(last_frame()){
				image_index = image_number - 1;
				scr_enemy_turn_to_player();
				if(count <= 120){
					if(count == 30){
						scr_fire_guy_shoot();
					}
					count++;	
				}else{
					count = 0;
					action = "wait";
				}
			}
			break;
			
		case "wait":
			sprite_index = spr_fire_guy_idle;
			if(count < 120){				
				count++;	
			}else{
				count = 0;
				action = "attack";
			}	
			break;
		
		default:
			action = "idle";
			break;
	}
}