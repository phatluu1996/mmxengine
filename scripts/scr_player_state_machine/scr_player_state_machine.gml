function scr_player_state_machine(){	
	scr_player_view_camera();	
	switch (state) {
		case PlayerState.Begin:
			readyCount--;	
			if(readyCount <= 0){
				state = PlayerState.Spawn;		
			}
			exit;
			break;
		
		case PlayerState.Technique:
			scr_player_state_technique();
			break;
		
		case PlayerState.Spawn:
			scr_player_state_spawn();
			exit;
			break;
		
	    case PlayerState.Normal:
			scr_player_state_normal();
	        break;
			
		case PlayerState.Movement:
			scr_player_state_move();
			break;
			
		case PlayerState.Dash:
			scr_player_state_dash();
			break;	
			
		case PlayerState.Jump:
			scr_player_state_jump();
			break;
			
		case PlayerState.WallSlide:
			scr_player_state_wall_slide();
			break;
			
		case PlayerState.WallKick:
			scr_player_state_wall_kick();
			break;
			
		case PlayerState.WallJump:
			scr_player_state_wall_jump();
			break;
			
		case PlayerState.Ladder:
			scr_player_state_ladder();
			break;
			
		case PlayerState.GrabLadder:
			scr_player_state_grab_ladder();
			break;
			
		case PlayerState.Crouch:
			scr_player_state_crouch();
			break;
			
		case PlayerState.Damaged:
			scr_player_state_damaged();
			break;
			
		case PlayerState.Defeat:
			scr_player_state_defeat();
			exit;
			break;
			
		case PlayerState.Swap:
			scr_player_state_recall_swap();
			exit;
			break;
			
		case PlayerState.EquipArmor:
			scr_player_state_equip_armor();
			exit;
			break;
			
		case PlayerState.DashUp:
			scr_player_state_dash_up();
			exit;
			break;
			
		case PlayerState.GrabVerticalRope:
			scr_player_state_grab_vertical_rope();
			break;
			
		case PlayerState.GrabHorizoneRope:
			scr_player_state_grab_horizone_rope();
			break;
			
		case PlayerState.GrabDeclineRope:
			scr_player_state_grab_decline_rope();
			break;
			
		case PlayerState.MovingSolidSlide:
			scr_player_state_moving_solid_slide();
			break;
			
		case PlayerState.ViewTransition:
			scr_player_state_gate_transition();
			exit;
			break;
			
	    default:
	        sprite_index = sprite_map_get(Action.idle);
	        break;
	}
	scr_player_x_change_weapon();
	scr_player_swap_armor();
	scr_player_state_swap();
	scr_player_state_taken_damage();
	scr_player_state_collide_and_move();	
}