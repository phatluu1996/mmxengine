function scr_player_state_gate_transition(){
	if(transitionCount > 0){
		transitionCount--;	
		if(place_meeting(x + hsp + image_xscale, y, objLeftArrow)){
			next_x = instance_place(x + hsp + image_xscale, y, objLeftArrow).x - camera_w;
			show_debug_message(next_x);
		}else if(place_meeting(x + hsp + image_xscale, y, objRightArrow)){
			next_x = instance_place(x + hsp + image_xscale, y, objRightArrow).x;
			show_debug_message(next_x);
		}	
		image_speed = 0;
	}else{
		if(sprite_index == sprite_map_get(Action.dash_attack)
		or sprite_index == sprite_map_get(Action.dash)
		or sprite_index == sprite_map_get(Action.jump)
		or sprite_index == sprite_map_get(Action.jump_attack)
		or sprite_index == sprite_map_get(Action.fall)){
			image_speed = 0;
		}else{
			image_speed = 1;	
		}
		viewx = lerp(viewx, next_x, 0.05);
		//show_debug_message(viewx);
		x += image_xscale * 0.6;
		if(round(viewx) == next_x){
			var door = instance_nearest(x, y, objGate);
			door.open = false;
			door.canOpen = false;
			door.alarm[0] = 180;
			door.image_index = 0;			
			state = PlayerState.Normal;	
		}
		camera_set_view_pos(camera, viewx, viewy);
	}
}