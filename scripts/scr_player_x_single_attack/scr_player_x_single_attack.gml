function scr_player_x_single_attack(){
	switch (state) {
		case PlayerState.Normal:			
		case PlayerState.Movement:		
		case PlayerState.Crouch:			
			state = PlayerState.Normal;
			return sprite_map_get(Action.stand_special_attack);
			
		case PlayerState.MovingSolidSlide:	
		case PlayerState.WallSlide:			
			return sprite_map_get(Action.wall_cling_special_attack);
			
		case PlayerState.GrabDeclineRope:			
		case PlayerState.GrabHorizoneRope:			
		case PlayerState.GrabVerticalRope:			
			return sprite_map_get(Action.grab_rope_special_attack);
		
		case PlayerState.Jump:
		case PlayerState.WallJump:
			return sprite_map_get(Action.jump_special_attack);
			
		case PlayerState.Ladder:
			return sprite_map_get(Action.climb_special_attack);
			
		case PlayerState.Dash:
			return sprite_map_get(Action.dash_special_attack);
	}
}