function scr_boss_state_machine(){
	switch (state) {
	    case BossState.Deactive:
	        sprite_index = idleSpr;
			if(global.bossStart){
				state = BossState.Intro;
			}
	        break;
			
		case BossState.Intro:
	        sprite_index = poseSpr;
			if(last_frame()){
				image_index = image_number - 1;
				count++;
				if(count >= 60 and count mod 3 == 0){
					hp++;	
				}
				
				if(hp >= maxHp){
					var player = collision_rectangle(camera_x, camera_y, camera_x + camera_w, camera_y + camera_h, objPrtPlayer, false, true);
					if(player >= 0){
						player.state = PlayerState.Normal;	
					}else{
						//objPrtPlayer.state = PlayerState.Normal;	
					}
					state = BossState.Active;
					count = 0;
				}
			}
	        break;
		
		case BossState.Explode:
	        scr_boss_explode();
	        break;
			
		case BossState.Active:
	        scr_boss_step_event();
	        break;
	}
}