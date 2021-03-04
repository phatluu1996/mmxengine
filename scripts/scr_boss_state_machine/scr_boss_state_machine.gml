function scr_boss_state_machine(){
	switch (state) {
	    case BossState.Deactive:
	        
	        break;
			
		case BossState.Intro:
	        
	        break;
		
		case BossState.Explode:
	        scr_boss_explode();
	        break;
			
		case BossState.Active:
	        scr_boss_step_event();
	        break;
			
	    default:
	        // code here
	        break;
	}
}