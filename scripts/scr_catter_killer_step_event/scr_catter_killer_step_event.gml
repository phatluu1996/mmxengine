function scr_catter_killer_step_event(){
	switch (action) {		
	    case "patrol":
			resist = false;
			sprite_index = spr_ck_move;				
			scr_enemy_patrol(ystart, ystart + patrol_vdir * 40, 120, false, true);
			if(vsp > 0){
				image_yscale = 1;	
			}else{
				image_yscale = -1;	
			}
			if(collision_rectangle(x + image_xscale * 32, bbox_top - 64, x + image_xscale * 64, bbox_bottom + 64, objPrtPlayer, false, true) >= 0){
				action = "shoot";
			}
	        break;		
			
		case "patrol_2":
			resist = false;
			sprite_index = spr_ck_move;				
			scr_enemy_patrol(ystart, ystart + 40, 90, false, true);
			if(vsp > 0){
				image_yscale = 1;	
			}else{
				image_yscale = -1;	
			}
			if(count < 75){
				count++;
			}else{								
				count = 0;
				action = "patrol";
			}
	        break;
		
		case "shoot":
			resist = true;
			vsp = 0;
			sprite_index = spr_ck_shoot;
			if(count < 60){
				count++;
			}else{				
				scr_catter_killer_blaster_shoot(1);
				scr_catter_killer_blaster_shoot(-1);
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