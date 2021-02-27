
function scr_enemy_step_event(){
	switch (object_index) {		
	    case objRideArmorSolider:			
			scr_enemy_state_damage();
	        scr_ride_armor_solider_step_event();			
	        break;
			
		case objDodgeBlaster:
			scr_enemy_state_damage();
			scr_dodge_blaster_step_event();
			break;
			
		case objCatterKiller:
			scr_enemy_state_damage();
			scr_catter_killer_step_event();
			break;
		
		case objGunVolt:
			scr_enemy_state_damage();
			scr_gun_volt_step_event();
			break;
			
		case objHoganmer:
			scr_enemy_state_damage();
			scr_hoganmer_step_event();			
			break;
			
		case objIceGuy:
			scr_enemy_state_damage();
			scr_ice_guy_step_event();
			break;
			
		case objFireGuy:
			scr_enemy_state_damage();
			scr_fire_guy_step_event();
			break;
		
		case objBallAxe:
			scr_enemy_state_damage();
			scr_ball_axe_step_event();
			break;
			
		case objHelit:
			scr_enemy_state_damage();
			scr_helit_step_event();
			break;
			
		case objCannon:
			scr_enemy_state_damage();
			scr_cannon_step_event();
			break;
		
	    default:
	        // code here
	        break;
	}
}