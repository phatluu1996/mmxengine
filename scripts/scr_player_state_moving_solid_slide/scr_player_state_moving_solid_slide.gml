function scr_player_state_moving_solid_slide(){
	scr_player_get_input();
	busterYOffset = y - 11;
	if(airJump) airJump = false;	
	if(airDash) airDash = false;
	if(hyperJump) hyperJump = false;
	
	if(key_right - key_left == 0){
		state = PlayerState.Jump;	
		sideMovingPlatform = noone;
		normalAtk = false;	
	}else{		
		if(sideMovingPlatform != noone){
			vsp = sideMovingPlatform.vsp + wallSpd;
			if(sideMovingPlatform.hsp != 0){
				if(key_right and sideMovingPlatform.x > x){						
					x = sideMovingPlatform.bbox_left - 1 - (bbox_right - x);
					image_xscale = 1;
					//while(!place_meeting(x + abs(sideMovingPlatform.hsp), y + vsp, objMovingSolid)){
					//	x+=sign(abs(sideMovingPlatform.hsp));	show_debug_message("4");	
					//}			
					if(!place_meeting(x + abs(sideMovingPlatform.hsp), y + vsp, objMovingSolid)){
						sideMovingPlatform = noone;
						state = PlayerState.Jump;
						normalAtk = false;		
					}
				}else if(key_left and sideMovingPlatform.x < x){
					x = sideMovingPlatform.bbox_right + 1 + (x - bbox_left);
					image_xscale = -1;
					//while(!place_meeting(x - abs(sideMovingPlatform.hsp), y + vsp, objMovingSolid)){						
					//	x-=sign(abs(sideMovingPlatform.hsp));	show_debug_message("5");	
					//}					
					if(!place_meeting(x - abs(sideMovingPlatform.hsp), y + vsp, objMovingSolid)){
						sideMovingPlatform = noone;
						state = PlayerState.Jump;
						normalAtk = false;		
					}
				}				
			}else{
				hsp = 0;
				if(!(image_xscale == 1 and key_right and place_meeting(x + 2, y + vsp, objMovingSolid))
				and !(image_xscale == -1 and key_left and place_meeting(x - 2, y + vsp, objMovingSolid))){	
					sideMovingPlatform = noone;
					state = PlayerState.Jump;
					normalAtk = false;	
				}	
			}
		}
	}
	
	if(key_jump){
		sideMovingPlatform = noone;
		image_index = 0;
		wallJumpDir = -image_xscale;
		if(key_dash_hold) hyperJump = true;
		state = PlayerState.WallKick;		
		normalAtk = false;
		if(specialShoot){
			specialShoot = false;
			chargeLv = 0;
		}
	}
	
	if(last_frame()){
		image_index = image_number - 1;	
	}
	
	if(character == Character.Z) scr_player_zero_single_attack(Action.wall_cling_attack, sprite_map_get(Action.wall_cling));
	if(scr_is_player_x()) scr_player_x_attack(sprite_map_get(Action.wall_cling_attack), sprite_map_get(Action.wall_cling)); 
}