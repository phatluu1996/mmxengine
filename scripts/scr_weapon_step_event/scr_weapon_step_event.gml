function scr_weapon_step_event(){
	switch (sprite_index) {
		case spr_z_fire_ball:
			x+=hsp;
			break;
		
	    case spr_x_buster_lv1:			
		case spr_x_buster_lv2:
		case spr_ma_buster_lv3:
		case spr_x_buster_lv3:
		case spr_ma_buster_saber_lv4:
		case spr_x_buster_saber_lv4:
		case spr_la_buster_lv4:
	        x+=hsp;		
			break;
	
	    default:
	        break;
	}
}