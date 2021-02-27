function scr_player_zero_technique_perform(){
	if(key_technique and (state == PlayerState.Normal or state == PlayerState.Movement)){
		state = PlayerState.Technique;
		if(key_up){
			switch (element) {
			    case ZElement.Fire:
			        technique = ZTechnique.FlameUppercut;
			        break;
					
				case ZElement.Ice:
			        technique = ZTechnique.IceUppercut;
			        break;
					
				case ZElement.Thunder:
			        technique = ZTechnique.ThunderUppercut;
			        break;
					
				case ZElement.Normal:
					technique = ZTechnique.Uppercut;
					break;
			}
		}else{
			technique = ZTechnique.FireFist;
		}
		image_index = 0;
		if(normalAtk){
			normalAtk = false;	
			atkIndex = 0;
		}
		scr_player_zero_new_saber_mask();
	}
	
	if(key_technique and state == PlayerState.Dash){
		state = PlayerState.Technique;
		technique = ZTechnique.DashSlash;
		dashCount = 0;
		hsp = dashSpd * image_xscale / 4;
		image_index = 0;
		scr_player_zero_new_saber_mask();		
	}
	
	if(state == PlayerState.Jump and key_down and key_technique and !normalAtk){
		state = PlayerState.Technique;		
		switch (element) {
			case ZElement.Fire:
			    technique = ZTechnique.FlameStab;
			    break;
					
			case ZElement.Ice:
			    technique = ZTechnique.IceStab;
			    break;
					
			case ZElement.Thunder:
			    technique = ZTechnique.ThunderStab;
			    break;
					
			case ZElement.Normal:
				technique = ZTechnique.AirStab;
				break;
		}
		image_index = 0;
		scr_player_zero_new_saber_mask();
	}
}