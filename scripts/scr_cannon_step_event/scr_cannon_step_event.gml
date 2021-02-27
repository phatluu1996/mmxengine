function scr_cannon_step_event(){
	switch (action) {
	    case "idle":
		sprite_index = spr_cannon_idle;
			if(count < 90){
				count++;	
			}else{
				count = 0;
				action = "shoot";
			}
			break;
			
		case "shoot":
			sprite_index = spr_cannon_shoot;
			if(last_frame()){
				scr_cannon_shoot();
				action = "idle";
			}
			break;
		
	    default:
	        action = "idle";
	        break;
	}
}