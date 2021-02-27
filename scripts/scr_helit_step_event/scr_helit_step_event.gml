function scr_helit_step_event(){
	y = wave(ystart, ystart + 30, 5, 0);
	switch (action) {
	    case "hover":
			sprite_index = spr_helit_hover;	        
			shootTime = 0;
			if(count < 60){
				count++;
			}else{
				count = 0;		
				action = "attack";
			}
	        break;
			
		case "attack":
			sprite_index = spr_helit_shoot;
			if(count < 30){
				if(count == 0){
					shootTime++;
					scr_helit_attack(x, y + 5);	
					scr_helit_attack(x, y + 10);	
				}
				count++;
			}else{
				count = 0;
				action = "reload";
				image_index = 0;
			}
			break;
			
		case "reload":			
			sprite_index = spr_helit_reload;
			if(last_frame()){
				count = 0;
				if(shootTime >= 2){
					action = "wait";
				}else{
					action = "attack";
				}				
			}
			break;
			
		case "wait":
			sprite_index = spr_helit_hover;
	        y = wave(ystart, ystart + 30, 5, 0);
			if(count < 120){
				count++;
			}else{
				count = 0;		
				shootTime = 0;
				action = "attack";
			}
	        break;
			
		
	    default:
	        action = "hover";
	        break;
	}
}