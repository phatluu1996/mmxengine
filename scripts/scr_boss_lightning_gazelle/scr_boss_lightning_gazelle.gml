function scr_lightning_gazelle_init(){
	stanceSpr = spr_lg_attack_stance;
	poseSpr = spr_lg_pose;	
	fallSpr = spr_lg_fall;
	idleSpr = spr_lg_idle;
	jumpSpr = spr_lg_jump;
	airSlashSpr = spr_lg_jump_slash;
	slashSpr[0] = spr_lg_slash_0;
	slashSpr[1] = spr_lg_slash_1;
	upSlashSpr[0] = spr_lg_upper_slash_0;
	upSlashSpr[1] = spr_lg_upper_slash_1;
	thunderStrikeSpr = spr_lg_thunder_strike;
	thunderChargeSpr = spr_lg_thunder_charge;
}

function scr_lightning_gazelle_step_event(){
	switch (action) {
	    case "idle":
			var _alarm = 60;
	        sprite_index = stanceSpr;			
			if(count <= _alarm){
				count++;	
			}else{
				count = 0;
				action = "slash_1";
				image_index = 0;
			}
	        break;
		
		case "slash_1":
			sprite_index = slashSpr[0];	
			if(last_frame()){
				action = "slash_2";	
				image_index = 0;
			}
			break;
			
		case "slash_2":
			sprite_index = slashSpr[1];	
			if(last_frame()){
				action = "slash_3";	
				image_index = 0;
			}
			break;
			
		case "slash_3":
			sprite_index = upSlashSpr[0];
			if(last_frame()){
				action = "idle";	
			}
			break;
		
		
	    default:
	        action = "idle";
	        break;
	}
	scr_enemy_collision_movement();
}