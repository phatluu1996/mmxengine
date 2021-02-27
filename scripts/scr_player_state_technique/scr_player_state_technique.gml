function scr_player_state_technique(){
	switch (technique) {
		case ZTechnique.FireFist:			
			sprite_index = technique_map_get(technique);
			hsp = 0;
			if(key_technique_hold and image_index + image_speed <= 4){
				chargeCount++;
				saber_mask = technique_saber_map_get(technique);
				if(image_index + image_speed >= 3){
					image_index = 0;	
				}
			}else{
				if(last_frame()){		
					var projectile = instance_create_depth(x + image_xscale * 40, y - 16, depth + 1, objXBuster);
					projectile.sprite_index = technique_projectile_map_get(technique);
					projectile.image_xscale = image_xscale;	
					projectile.alarm[0] = chargeCount;
					projectile.hsp = 4*image_xscale;
					state = PlayerState.Normal;	
					technique = ZTechnique.None;
					saber_mask = noone;
					scr_player_zero_delete_saber_mask();
					chargeCount = 0;
				}			
			}
			break;
			
		case ZTechnique.DashSlash:
			sprite_index = technique_map_get(technique);			
			saber_mask = technique_saber_map_get(ZTechnique.DashSlash);			
			if(last_frame()){
				state = PlayerState.Normal;	
				technique = ZTechnique.None;
				saber_mask = noone;
				scr_player_zero_delete_saber_mask();
			}			
			break;
			
		case ZTechnique.Uppercut:
		case ZTechnique.ThunderUppercut:
		case ZTechnique.FlameUppercut:
		case ZTechnique.IceUppercut:
			sprite_index = technique_map_get(technique);	
			saber_mask = technique_saber_map_get(technique);
			hsp = runSpd * image_xscale / 4;
			
			if(round(image_index) + image_speed == 5){
				vsp = -jumpSpd;
			}
			if(vsp >= 0){
				if(last_frame()){
					state = PlayerState.Jump;
					technique = ZTechnique.None;
					saber_mask = noone;
					scr_player_zero_delete_saber_mask();
				}		
			}else{
				vsp = vsp >= jumpSpd ? jumpSpd : vsp + gravSpd;
				if(last_frame()){
					vsp = 0;	
				}
				//if(round(image_index) + image_speed >= 8){
				//	image_index = 5;		
				//}
			}			
			
			if(key_dash_press and !airDash and !hyperJump and !wall_collide_1px() and !airJump and canAirDash){
				airDash = true;
				image_index = 0;
				vsp = 0;
				normalAtk = false;			
				state = PlayerState.Dash;
				technique = ZTechnique.None;
				saber_mask = noone;
				scr_player_zero_delete_saber_mask();
			}else if(key_jump and !airDash and !hyperJump and !airJump and canAirJump){
				vsp = -jumpSpd;	
				airJump = true;
				image_index = 0;
				normalAtk = false;			
				state = PlayerState.Jump;
				technique = ZTechnique.None;
				saber_mask = noone;
				scr_player_zero_delete_saber_mask();
			}
			break;
		
		case ZTechnique.AirStab:
		case ZTechnique.IceStab:
		case ZTechnique.ThunderStab:
		case ZTechnique.FlameStab:				
			sprite_index = technique_map_get(technique);	
			saber_mask = technique_saber_map_get(technique);
			hsp = (key_right - key_left) * runSpd;			
			if(place_meeting(x, y + 1, objSlope) or place_meeting(x, y + 1, objPrtSolid) or place_meeting(x, y + 1, objMovingSolid) or place_meeting(x, y + 1, objTopLadder)){
				vsp = 0;
				hsp = 0;
				if(image_index < 6){
					image_index = 6;	
				}else{
					if(last_frame()){
						state = PlayerState.Normal;
						technique = ZTechnique.None;
						saber_mask = noone;
						scr_player_zero_delete_saber_mask();	
					}
				}
			}else{				
				vsp = vsp >= jumpSpd ? jumpSpd : vsp + gravSpd;
				if(image_index + image_speed >= 5){
					image_index = 2;
				}
			}
			
			if(key_dash_press and !airDash and !hyperJump and !wall_collide_1px() and !airJump and canAirDash){
				airDash = true;
				image_index = 0;
				vsp = 0;
				normalAtk = false;			
				state = PlayerState.Dash;
				technique = ZTechnique.None;
				saber_mask = noone;
				scr_player_zero_delete_saber_mask();
			}else if(key_jump and !airDash and !hyperJump and !airJump and canAirJump){
				vsp = -jumpSpd;	
				airJump = true;
				image_index = 0;
				normalAtk = false;			
				state = PlayerState.Jump;
				technique = ZTechnique.None;
				saber_mask = noone;
				scr_player_zero_delete_saber_mask();
			}
			break;
	}
}