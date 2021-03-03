function scr_player_view_camera(){			
	if(state == PlayerState.Spawn or state == PlayerState.Swap) exit;
	//var view_count = instance_place_list(x,y, objSection, list_view, false);
	scr_view_camera_variables();
	
	current_section = instance_place(x, y, objSection);
	if(current_section >= 0){
		if(camera_lock_x){			
			var camera_spd = hsp == dashSpd ? 0.16 : 0.08;
			viewx = lerp(viewx, round(x) - camera_w/2, camera_spd);	
			viewx = clamp(viewx, current_section.bbox_left, current_section.bbox_right - camera_w); 
			viewx = clamp(viewx, 0, room_width - camera_w);
		}else{			
			if(!place_meeting(x, y, objLeftArrow) and !place_meeting(x, y, objRightArrow)){
				if(x > prev_x){
					next_x = current_section.bbox_left;	
					if(viewx > next_x){
						camera_lock_x = true;	
					}
				}else {
					next_x = current_section.bbox_right-camera_w;	
					if(viewx < next_x){
						camera_lock_x = true;	
					}
				}							
				
				viewx = lerp(viewx, round(x) - camera_w/2, 0.06);	
				
			}else{
				viewx = lerp(viewx, round(x) - camera_w/2, 0.04);	
			}
		}
	
		if(camera_lock_y){
			viewy = y - camera_h/2;
			viewy = clamp(viewy, current_section.bbox_top, current_section.bbox_bottom - camera_h) 
			viewy = clamp(viewy, 0, room_height - camera_h);
		}else{			
			if(!place_meeting(x, y, objUpArrow) and !place_meeting(x, y, objDownArrow)){
				if(y > prev_y){
					next_y = current_section.bbox_top;					 
				}else {
					next_y = current_section.bbox_bottom-camera_h;		
				}				
				viewy = lerp(viewy, next_y, abs(vsp) > 4 ? 0.1 : 0.04);	
				if(next_y == round(viewy)){
					camera_lock_y = true;	
				}
			}else{
				viewy = lerp(viewy, round(y) - camera_h/2, 0.04);	
			}
		}
		
		if(place_meeting(x + hsp, y, objLeftArrow) and camera_lock_x){
			camera_lock_x = false;
			prev_x = instance_place(x + hsp, y, objLeftArrow).x;
		}else if(place_meeting(x + hsp, y, objRightArrow) and camera_lock_x){
			camera_lock_x = false;
			prev_x = instance_place(x + hsp, y, objRightArrow).x;
		}
		
		if(place_meeting(x, y + vsp, objUpArrow) and camera_lock_y){
			camera_lock_y = false;
			prev_y = instance_place(x, y + vsp, objUpArrow).y;
		}else if(place_meeting(x, y + vsp, objDownArrow) and camera_lock_y){
			camera_lock_y = false;
			prev_y = instance_place(x, y + vsp, objDownArrow).y;
		}
	}
	
	camera_set_view_pos(camera, viewx, viewy);	
}