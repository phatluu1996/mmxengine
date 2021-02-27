function scr_player_x_special_attack_condition(){
	switch (character) {
	    case Character.X:
	    case Character.MaxArmor:
			return round(image_index) + image_speed == 5 + (state == PlayerState.Dash)
	        break;
			
		case Character.LightArmor:		
			if(state == PlayerState.Jump or state == PlayerState.WallSlide){
				vsp = 0;
				hsp = 0;
			}
			if(state == PlayerState.Dash){
				state = airDash ? PlayerState.Jump : PlayerState.Normal;
				dashCount = 0;
			}
			if(state == PlayerState.MovingSolidSlide){
				vsp = 0;
			}
			
			return round(image_index) + image_speed == 7;
		
	    default:
	        // code here
	        break;
	}
}