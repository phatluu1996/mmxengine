function scr_player_x_buster_charge(){	
	if(key_attack_hold and character != Character.Z){
		if(chargeLv == 0){
			chargeCount++;
			if(chargeCount >= chargeCountLimit){
				chargeLv++;		
				chargeCount = 0 ;
				//show_debug_message(chargeLv);
			}			
		}else{
			chargeCount++;	
			var maxLv = chargeCountLimit;
			switch (chargeLv) {
			    case 1:
			        maxLv = chargeCountLimit + 60;
			        break;
					
				case 2:
					 maxLv = chargeCountLimit + 80;
					break;
					
				default:
					maxLv = chargeCountLimit + 100;
					break;
			}
			
			if(chargeCount >= maxLv){
				chargeLv = chargeLv >= chargeLvMax - 1 ? chargeLvMax - 1 : chargeLv + 1;
				chargeCount = 0;
				//show_debug_message(chargeLv);
			}
		}
		
		switch (chargeLv) {
		    case 1:
				chargeSprite = spr_x_charge_aura_lv1;	
				//image_blend = make_color_rgb(80, 216, 240);
		        break;
				
			case 2:
				chargeSprite = spr_x_charge_aura_lv2;		
				//image_blend = make_color_rgb(240, 104, 192);
		        break;
				
			case 3:
				chargeSprite = spr_x_charge_aura_lv3;				
				//image_blend = make_color_rgb(248, 208 ,152);
		        break;
				
			case 4:
				chargeSprite = spr_x_charge_aura_lv4;	
				//image_blend = make_color_rgb(72, 224 ,160);
		        break;
		}
	}
	else{
		image_blend = c_white;	
	}
}