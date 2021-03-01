function scr_player_view_camera(){			
	if(state == PlayerState.Spawn) exit;
	var view_count = instance_place_list(x,y, objSection, list_view, true);	
	scr_view_camera_variables();
		
	if(view_count == 1){		
		var new_view = instance_place(x, y, objSection);
		if(new_view != current_view){
			current_view = instance_place(x, y, objSection);
			camera_lock = false;	
			if(place_meeting(x,y, objLeftArrow)){
				camera_action = CameraAction.Right;	
				next_view_x = current_view.x;
				show_debug_message("Right");
				next_view_y = view_y;
			}else if(place_meeting(x,y, objRightArrow)){
				camera_action = CameraAction.Left;
				next_view_x = current_view.x - camera_w;
				show_debug_message("Left");
				next_view_y = view_y;
			}
			
			if(place_meeting(x,y, objDownArrow)){
				camera_action = CameraAction.Down;	
				next_view_y = current_view.y;
				show_debug_message("Down");
				next_view_x = view_x;
			}else if(place_meeting(x,y, objUpArrow)){
				camera_action = CameraAction.Up;
				next_view_y = current_view.y - camera_h;
				show_debug_message("Up");
				next_view_x = view_x;
			}				
		}else{
			if(camera_lock){
				current_view = instance_place(x, y, objSection);
				view_x = x - camera_w/2;
				view_y = y - camera_h/2;
				camera_lock = true;
				if(view_y < current_view.bbox_top){
					view_y = current_view.bbox_top;	
				}
				if(view_y + camera_h > current_view.bbox_bottom){
					view_y = current_view.bbox_bottom - camera_h;	
				}
		
				if(view_x < current_view.bbox_left){
					view_x = current_view.bbox_left;	
				}
				if(view_x + camera_w > current_view.bbox_right){
					view_x = current_view.bbox_right - camera_w;	
				}
			}else{
				switch (camera_action) {
					case CameraAction.Up:
						if(view_y != next_view_y){
							view_y -= 8;	
						}else{
							if(view_count == 1){
								camera_lock = true;	
							}
						}
				
						view_x = next_view_x;
					    break;
				
					case CameraAction.Down:
					    if(view_y != next_view_y){
							view_y += 8;	
						}else{
							if(view_count == 1){
								camera_lock = true;	
							}
						}
				
						view_x = next_view_x;
					    break;
				
					case CameraAction.Left:
					    if(view_x != next_view_x){
							view_x -= 5;	
						}else{
							if(view_count == 1){
								camera_lock = true;	
							}
						}
				
						view_y = next_view_y;
					    break;
				
					case CameraAction.Right:
					    if(view_x != next_view_x){
							view_x += 5;	
						}else{
							if(view_count == 1){
								camera_lock = true;	
							}	
						}
						view_y = next_view_y;
					    break;
				}	
		
				camera_set_view_pos(camera, view_x, view_y);	
			}
		}
		//camera_lock = false;		
		camera_set_view_pos(camera, ceil(view_x), ceil(view_y));
	}else if(view_count == 2){
		current_view = noone;
		if(camera_lock){
			camera_lock = false;				
			if(place_meeting(x,y, objRightArrow) and place_meeting(x,y, objLeftArrow)){				
				if(hsp > 0){
					camera_action = CameraAction.Right;	
					next_view_x = view_x + camera_w/2;
					show_debug_message("Right");
				}else if(hsp < 0){
					camera_action = CameraAction.Left;
					next_view_x = view_x - camera_w/2;
					show_debug_message("Left");
				}
				next_view_y = view_y;
			}
			
			if(place_meeting(x,y, objUpArrow) and place_meeting(x,y, objDownArrow)){
				if(vsp > 0){
					camera_action = CameraAction.Down;	
					next_view_y = view_y + camera_h/2;
					show_debug_message("Down");
				}else if(vsp < 0){
					camera_action = CameraAction.Up;
					next_view_y = view_y - camera_h/2;
					show_debug_message("Up");
				}
				next_view_x = view_x;
			}
		}
		
		if(!camera_lock){
			switch (camera_action) {
				case CameraAction.Up:
					if(view_y != next_view_y){
						view_y -= 8;	
					}else{
						if(view_count == 1){
							camera_lock = true;	
						}
					}
				
					view_x = next_view_x;
				    break;
				
				case CameraAction.Down:
				    if(view_y != next_view_y){
						view_y += 8;	
					}else{
						if(view_count == 1){
							camera_lock = true;	
						}
					}
				
					view_x = next_view_x;
				    break;
				
				case CameraAction.Left:
				    if(view_x != next_view_x){
						view_x -= 5;	
					}else{
						if(view_count == 1){
							camera_lock = true;	
						}
					}
				
					view_y = next_view_y;
				    break;
				
				case CameraAction.Right:
				    if(view_x != next_view_x){
						view_x += 5;	
					}else{
						if(view_count == 1){
							camera_lock = true;	
						}	
					}
					view_y = next_view_y;
				    break;
			}	
		
			camera_set_view_pos(camera, view_x, view_y);
		}
	}
	
	
	
	
	
	ds_list_clear(list_view);
	
	//if(state != PlayerState.Swap){
	//	camera_set_view_target(view_camera[0], id);
	//}
}