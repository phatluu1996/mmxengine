// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_x_change_weapon(){
	if(character != Character.Z){
		global.weaponIndex += key_next_weapon - key_prev_weapon;
		if global.weaponIndex > 8 {
			global.weaponIndex = 0;	
		}
		if global.weaponIndex < 0 {
			global.weaponIndex = 8;			
		}	
		while(!global.weaponUnlocked[global.weaponIndex]){
			global.weaponIndex+=(key_next_weapon - key_prev_weapon);	
		}
	
		switch (global.weaponIndex) {
			case 0:
				//Classic Color			
			
				colorReplace[0] = new Color(0,128,248);
				colorReplace[1] = new Color(0,64,240);
				colorReplace[2] = new Color(32,48,128);				
				//colorReplace[3] = new Color(120,216,240);
				//colorReplace[4] = new Color(80,160,240);
				//colorReplace[5] = new Color(24,88,176);
				colorReplace[3] = colorReplace[0]
				colorReplace[4] = colorReplace[1]
				colorReplace[5] = colorReplace[2]
			

				////Black Color
				//colorReplace[0] = new Color(72,72,72);
				//colorReplace[1] = new Color(52,52,52);
				//colorReplace[2] = new Color(32,32,32);	
				//colorReplace[3] = new Color(248,240,216);
				//colorReplace[4] = new Color(160,160,160);
				//colorReplace[5] = new Color(96,96,96);
				break;
		
		    case 1:	        
				colorReplace[0] = new Color(184,248,128);
				colorReplace[1] = new Color(96,232,48);
				colorReplace[2] = new Color(72,160,40);	
				//colorReplace[3] = new Color(240,192,56);
				//colorReplace[4] = new Color(192,120,32);
				//colorReplace[5] = new Color(144,72,0);
				colorReplace[3] = colorReplace[0]
				colorReplace[4] = colorReplace[1]
				colorReplace[5] = colorReplace[2]
		        break;
			
			case 2:
				colorReplace[0] = new Color(248,248,0);
				colorReplace[1] = new Color(184,176,0);
				colorReplace[2] = new Color(104,96,0);		        
				//colorReplace[3] = new Color(176,216,200);
				//colorReplace[4] = new Color(112,144,128);
				//colorReplace[5] = new Color(56,80,72);
				colorReplace[3] = colorReplace[0]
				colorReplace[4] = colorReplace[1]
				colorReplace[5] = colorReplace[2]
		        break;
			
			case 3:
				colorReplace[0] = new Color(160,128,248);
				colorReplace[1] = new Color(112,64,184);
				colorReplace[2] = new Color(96,32,120);	
	        
				//colorReplace[3] = new Color(202,224,152);
				//colorReplace[4] = new Color(120,208,72);
				//colorReplace[5] = new Color(96,136,64);
				colorReplace[3] = colorReplace[0]
				colorReplace[4] = colorReplace[1]
				colorReplace[5] = colorReplace[2]
		        break;
			
			case 4:
		        colorReplace[0] = new Color(248,80,48);
				colorReplace[1] = new Color(192,32,0);
				colorReplace[2] = new Color(128,0,0);
			
				//colorReplace[3] = new Color(192,192,192);
				//colorReplace[4] = new Color(128,128,128);
				//colorReplace[5] = new Color(64,64,64);
				colorReplace[3] = colorReplace[0]
				colorReplace[4] = colorReplace[1]
				colorReplace[5] = colorReplace[2]
		        break;
			
			case 5:
				colorReplace[0] = new Color(240,176,56);
				colorReplace[1] = new Color(192,104,32);
				colorReplace[2] = new Color(144,56,0);
			
				//colorReplace[3] = new Color(248,248,0);
				//colorReplace[4] = new Color(184,176,0);
				//colorReplace[5] = new Color(104,96,0);	    
				colorReplace[3] = colorReplace[0]
				colorReplace[4] = colorReplace[1]
				colorReplace[5] = colorReplace[2]
		        break;
			
			case 6:
		        colorReplace[0] = new Color(240,120,248);
				colorReplace[1] = new Color(192,64,200);
				colorReplace[2] = new Color(152,32,160);	
			
				//colorReplace[3] = new Color(224,192,160);
				//colorReplace[4] = new Color(160,128,96);
				//colorReplace[5] = new Color(96,64,32);
				colorReplace[3] = colorReplace[0]
				colorReplace[4] = colorReplace[1]
				colorReplace[5] = colorReplace[2]
		        break;
			
			case 7:
		        colorReplace[0] = new Color(120,232,240);
				colorReplace[1] = new Color(72,200,208);
				colorReplace[2] = new Color(32,152,160);	
			
				//colorReplace[3] = new Color(208,136,248);
				//colorReplace[4] = new Color(160,88,224);
				//colorReplace[5] = new Color(120,56,176);		
				colorReplace[3] = colorReplace[0]
				colorReplace[4] = colorReplace[1]
				colorReplace[5] = colorReplace[2]
		        break;
			
			case 8:
		        colorReplace[0] = new Color(128,240,224);
				colorReplace[1] = new Color(64,192,176);
				colorReplace[2] = new Color(0,128,112);	
			
				//colorReplace[3] = new Color(240,176,56);
				//colorReplace[4] = new Color(176,88,16);
				//colorReplace[5] = new Color(128,16,0);		
				colorReplace[3] = colorReplace[0]
				colorReplace[4] = colorReplace[1]
				colorReplace[5] = colorReplace[2]
		        break;

			default:
		        global.weaponIndex = 0;
		        break;
		}
	}
}