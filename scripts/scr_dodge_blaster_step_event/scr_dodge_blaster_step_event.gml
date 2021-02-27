function scr_dodge_blaster_step_event(){
	switch (action) {		
	    case "patrol":
			sprite_index = spr_db_move;				
			scr_enemy_patrol(ystart, ystart + patrol_vdir * 40, 90, false, true);
			if(vsp > 0){
				image_yscale = 1;	
			}else{
				image_yscale = -1;	
			}
			if(collision_rectangle(x, bbox_top, x + image_xscale * 128, bbox_bottom, objPrtPlayer, false, true) >= 0){
				action = "shoot";
			}
	        break;		
			
		case "patrol_2":
			sprite_index = spr_db_move;				
			scr_enemy_patrol(ystart, ystart + 40, 90, false, true);
			if(vsp > 0){
				image_yscale = 1;	
			}else{
				image_yscale = -1;	
			}
			if(count < 60){
				count++;
			}else{								
				count = 0;
				action = "patrol";
			}
	        break;
		
		case "shoot":
			vsp = 0;
			sprite_index = spr_db_shoot;
			if(count < 10){
				count++;
			}else{				
				scr_dodge_blaster_shoot();
				count = 0;
				action = "patrol_2";
			}
			break;
		
		default:
			action = "patrol";
			break;
	}
	scr_enemy_collision_movement();
}