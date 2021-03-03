function scr_player_x_attack(attackSprite, nonAttackSprite){		
	scr_player_x_buster_charge();
	var clingOnSolid = state == PlayerState.WallSlide or state == PlayerState.MovingSolidSlide;
	var xscale = clingOnSolid ? -image_xscale : image_xscale;
	
	
	switch (character) {		
	    case Character.X:			
	    case Character.LightArmor:
		case Character.MaxArmor:
			if(key_attack_release){				
				image_index = 0;						
				if(chargeLv <= 2 + (character == Character.MaxArmor)){		
					normalShoot = true;		
					var limit = 3;
					var spd = 4;
					switch (chargeLv) {
						case 0:
							limit = 3;	
							spd = 5;
							break;
				
					    case 1:
					        limit = 1;	
							spd = 5;
					        break;
				
						case 2:
					        limit = 1;		
							spd = 5;
					        break;
							
						case 3:
					        limit = 1;		
							spd = 6;
					        break;
					}
					
					var busterSpr = buster_map_get(chargeLv);					
					scr_player_x_attack_buster_shot(spd, xscale, busterSpr, limit);
					chargeLv = 0;
					chargeCount = 0;
				}else{
					specialShoot = true;		
				}
			}
		
			if(normalShoot){				
				shootCount++;		
				if(key_attack_press) shootCount = 0;
				if(shootCount >= shootDuration){						
					shootCount = 0;		
					chargeLv = 0;
					normalShoot = false;
				}		
				sprite_index = attackSprite;
			}else if(specialShoot){
				sprite_index = scr_player_x_single_attack();	
					
				if(scr_player_x_special_attack_condition()){
					var busterSpr = buster_map_get(chargeLv);
					var spd = 5;
					scr_player_x_attack_buster_shot(spd, xscale, busterSpr, 1);		
					chargeLv = 0;		
				}
					
				if(last_frame()){						
					specialShoot = false;
				}
			}else{
				sprite_index = nonAttackSprite;	
			}
	        break;
		
	    default:
	        // code here
	        break;
	}
}