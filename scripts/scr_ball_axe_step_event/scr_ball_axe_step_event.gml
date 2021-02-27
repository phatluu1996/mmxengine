function scr_ball_axe_step_event(){
	switch (action) {
	    case "approach":	 
			sprite_index = spr_ball_axe_move;
			scr_enemy_turn_to_player();
			hsp = image_xscale * 2;
			if(collision_rectangle(x+20, camera_get_view_y(view_camera[0]), x-20, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), objPrtPlayer, false, true) >= 0){				action = "attack";		
				image_index = 0;
				count = 0;
				action = "attack";
			}
			x+=hsp;
	        break;
			
		case "attack":
			sprite_index = spr_ball_axe_attack;
			if(last_frame()){
				scr_ball_axe_attack();
				action = "run";
				image_index = 0;
			}
			break;
			
		case "run":
			mask_index = spr_ball_axe_second_mask;
			sprite_index = spr_ball_axe_run_away;
			hsp = image_xscale * 4;
			if(last_frame()){
				image_index = 5;	
			}
			x+=hsp;
			break;
		
	    default:
	        action = "approach";
	        break;
	}	

}