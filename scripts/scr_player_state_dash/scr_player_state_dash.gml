function scr_player_state_dash(){
	scr_player_get_input();
	mask_index = lower_mask;
	busterYOffset = y - 7;
	scr_player_horizone_turn();
	
	if(key_dash_hold or place_meeting(x , y - 1, objPrtSolid)){	
		if(!airDash and !place_meeting(x, y + vsp + 1, objSlope) and !place_meeting(x, y + vsp + 1, objPrtSolid) and !place_meeting(x, y + vsp + 1, objMovingSolid) and !place_meeting(x, y+1, objTopLadder)){
			state = PlayerState.Jump;
			mask_index = normal_mask;	
			
			dashCount = hsp = 0;
		}
		
		if(place_meeting(x , y - 1, objPrtSolid)){ 
			dashCount = 0;
			if(!specialShoot){
				if(image_index + image_speed >= 6){
					image_index = 2;	
				}
			}
		}
		
		if(dashCount < dashDuration){
			if(dashCount == 0){
				var spark = instance_create_depth(x - image_xscale*15, bbox_bottom, depth - 1, objPlayerEffect);	
				spark.sprite_index = spr_effect_dash_spark;
				spark.image_xscale = image_xscale;
			}
			
			if(dashCount mod 6 == 0){
				var spark = instance_create_depth(x - image_xscale*15, bbox_bottom, depth - 1, objPlayerEffect);	
				spark.sprite_index = spr_effect_dash_dust;
				spark.image_xscale = image_xscale;
			}
			
			hsp = image_xscale*dashSpd;
			dashCount++;	
		}else{			
			if(last_frame()){
				dashCount = hsp = 0;
				state = airDash ? PlayerState.Jump : PlayerState.Normal;					
				mask_index = normal_mask;	
				specialShoot = false;
			}else{
				hsp = image_xscale/4;
			}
		}
	}else{	
		if(!specialShoot){
			dashCount = hsp = 0;
			state = airDash ? PlayerState.Jump : PlayerState.Normal;	
			mask_index = normal_mask;
		}
	}
	
	if(airDash and (place_meeting(x + image_xscale, y, objPrtSolid) or place_meeting(x + image_xscale + hsp, y, objMovingSolid))){
		dashCount = hsp = 0;
		state = airDash ? PlayerState.Jump : PlayerState.Normal;	
		mask_index = normal_mask;
		specialShoot = false;
	}
	
	if(key_jump_hold and (place_meeting(x, y+1, objPrtSolid) or place_meeting(x, y+1, objMovingSolid) or place_meeting(x, y+1, objSlope) or place_meeting(x, y+1, objTopLadder) )){		
		hyperJump = true;
		sprite_index = sprite_map_get(Action.jump);
		vsp = -jumpSpd;	
		dashCount = 0;
		state = PlayerState.Jump;
		mask_index = normal_mask;
	}	
	
	if(scr_is_player_x()) 
		scr_player_x_attack(sprite_map_get(Action.dash_attack), sprite_map_get(Action.dash)); 
	else{
		if(key_attack_press and !normalAtk and !airDash){		
			normalAtk = true;
			image_index = 0;	
			dashCount = 0;
			state = PlayerState.Normal;
			scr_player_zero_new_saber_mask();
		}
		scr_player_zero_technique_perform();
		sprite_index = sprite_map_get(Action.dash);
	}
}