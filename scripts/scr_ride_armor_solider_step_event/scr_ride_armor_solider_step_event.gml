function scr_ride_armor_solider_step_event(){
	switch (action) {
		case "fall":
			if(place_meeting(x, y + vsp, objSlope) or place_meeting(x, y + vsp, objPrtSolid)){
				action = "landing";
			}
			break;
		
		case "jump":
			scr_enemy_turn_to_player();
			scr_enemy_jump_by_distance(spr_ras_jump, 80, abs(objPrtPlayer.x - x)/2, image_xscale);
			action = "fall";
			break;
		
	    case "patrol":
			sprite_index = spr_ras_walk;				
			scr_enemy_patrol(xstart, xstart + patrol_hdir * 30, 90, true, false);
			if(hsp > 0){
				image_xscale = 1;	
			}else{
				image_xscale = -1;	
			}							
			if(damage){					
				scr_enemy_turn_to_player();
				action = "approach";
			}
			
			if(collision_rectangle(x, bbox_top , x + image_xscale * 64, bbox_bottom , objPrtPlayer, false, true) >= 0){
				action = "approach";
			}
	        break;
			
		case "approach":			
			if(!on){
				sprite_index = spr_ras_walk;
				hsp = 1 * image_xscale;
				walkCount = (scr_enemy_to_player() / 4 ) / abs(hsp);
				walkCount = walkCount == 0 ? 1 : walkCount;
				on = true;
			}
			
			walkCount--;
			if(walkCount <= 0){			
				sprite_index = spr_ras_idle;
				hsp = 0;
				if(walkCount <= -60){
					action = "landing";
					walkCount = 0;
					on = false;
				}
			}
			
			break;
			
		case "idle":		
			scr_enemy_turn_to_player();
			sprite_index = spr_ras_idle;
			hsp = 0;			
			break;
		
		case "landing":
			scr_enemy_turn_to_player();
			sprite_index = spr_ras_idle;
			hsp = 0;
			//Shoot at player
			
			shootCount --;
			if(shootCount == 15){
				scr_ride_armor_solider_shoot_rocket(x + 6*image_xscale ,y - 22);	
				scr_ride_armor_solider_shoot_rocket(x + 26*image_xscale ,y - 22);	
			}
			if(shootCount <= -60){				
				action = "approach";
				shootCount = 30;				
			}
			break;
		
		default:
			action = "patrol";
			break;
	}
	scr_enemy_gravity();
	scr_enemy_collision_movement();
}