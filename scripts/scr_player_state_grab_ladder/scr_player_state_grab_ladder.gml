function scr_player_state_grab_ladder(){
	scr_player_get_input();
	
	switch (climbDir) {
	    case ClimbType.Up:
			sprite_index = sprite_map_get(Action.grab_ladder);
			if(last_frame()){
				image_index = 0;
				state = PlayerState.Ladder;
			}
	        break;
			
	    case ClimbType.Down:
	        sprite_index = sprite_map_get(Action.climb_down);
			vsp = climbSpd * 2;
			if(last_frame()){
				image_index = 0;
				state = PlayerState.Ladder;						
			}
	        break;
			
		case ClimbType.GetUp:
			sprite_index = sprite_map_get(Action.climb_up);
			vsp = -climbSpd * 2;
			if(last_frame()){
				image_index = image_number-2;
				state = PlayerState.Normal;		
				var ladder = instance_place(x, y, objTopLadder);
				if(ladder >= 0){
					y = ladder.y;
					while(place_meeting(x, y, ladder)){
						y-=1;	
					}
				}				
				vsp = 0;
			}			
			break;
	}
}