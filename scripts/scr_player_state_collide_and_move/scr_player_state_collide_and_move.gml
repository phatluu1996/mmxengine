function scr_player_state_collide_and_move(){	
	//HitTheDoor
	var gate = instance_place(x + hsp + image_xscale, y, objGate);
	if(gate >= 0 and gate.canOpen == true){
		gate.open = true;
		transitionCount = ceil(sprite_get_number(gate.sprite_index) * room_speed / sprite_get_speed(gate.sprite_index));
		state = PlayerState.ViewTransition;	
		show_debug_message(transitionCount);
	}
	
	//Horizone		
	#region Horizone Moving Platform
		var horizoneMovingSolid = collision_rectangle(bbox_left + hsp*2, bbox_top, bbox_right + hsp*2, bbox_bottom + vsp, objMovingSolid, false, true);
		if(horizoneMovingSolid >= 0 and hsp != 0){				
			while(collision_rectangle(bbox_left + sign(hsp)*2, bbox_top, bbox_right + sign(hsp)*2, bbox_bottom + vsp, horizoneMovingSolid, false, true) < 0 ){
				x += sign(hsp);	show_debug_message("1");
			}			
			if(scr_player_is_grab_rope()) state = PlayerState.Jump;
			hsp = 0;	
		}		

		var underMovingSolid = instance_place(x + hsp, y + vsp + 1, objMovingSolid);
		if(underMovingSolid >= 0){
			if(scr_player_is_grab_rope()) state = PlayerState.Jump;
			hsp = underMovingSolid.hsp + hsp;
		}
		
	#endregion	
	
	
	#region Horizone Slope
		//Up slope
		if (place_meeting(x+hsp,y,objSlope)){	    
		    var yplus=0;
		    while(place_meeting(x+hsp,y-yplus,objSlope) && yplus<=3*abs(hsp)) yplus+=1; //change the abs(hsp) to 3*abs(hsp) if you want to be able to go up a 3-1 slope, etc..
		    if(place_meeting(x+hsp,y-yplus,objSlope)){
		        while(!place_meeting(x+sign(hsp),y,objSlope)) x += sign(hsp);
		        hsp=0;
		    }else{
		        y-=yplus;
		    }
		}
	#endregion	
	
	
	#region Horizone Static Solid
		var sideSolid = instance_place(x + hsp, y, objPrtSolid);
		if(sideSolid >= 0 and hsp != 0){
			while(!place_meeting(x + sign(hsp),y, sideSolid)){
				x += sign(hsp);	
			}		
			hsp = 0;
		}
	#endregion	
	
	x+=hsp;
	
	
	//Vertical		
	#region Vertical Moving Platform
		var verticalMovingSolid = instance_place(x, y + vsp, objMovingSolid);
		if(verticalMovingSolid >= 0){
			if(vsp < 0){
				vsp = 1;
			}else{
				var maxDist = 1000;
				while(!place_meeting(x , y + sign(vsp), verticalMovingSolid) and maxDist > 0){
					y += sign(vsp);
					maxDist--;
					show_debug_message("2");						
				}
				if(maxDist <= 0 or place_meeting(x, y, objMovingSolid)){
					if(y > verticalMovingSolid.y){
						//move_outside_solid(270, 12);
						y = verticalMovingSolid.bbox_bottom + 1 + abs(verticalMovingSolid.vsp) + (y - bbox_top);					
					}else{
						y = verticalMovingSolid.bbox_top - 1 - (bbox_bottom - y);
					}
				}			
				vsp = 0;
				//if(place_meeting(x, y + 1, objMovingSolid)){
				//	var gap = 0;
				//	while(!place_meeting(x, y + gap, objMovingSolid)){
				//		gap+=0.1;
				//	}
				//	show_debug_message("Gap: " + string(gap));
				//	y+=gap
				//}
				if(y < verticalMovingSolid.y){
					if(state != PlayerState.Crouch and state != PlayerState.Damaged and state != PlayerState.Technique){						
						state = PlayerState.Normal;
					}
					normalAtk = false;
					if(airDash) airDash = false;
					if(airJump) airJump = false;
				}
			}
		}
	#endregion
	
	
	#region Vertical Slope
		//Down slope
		if(!place_meeting(x,y,objSlope) and vsp >= 0 and (place_meeting(x,y+2+abs(hsp),objSlope) or place_meeting(x,y+2+abs(hsp),objPrtSolid))){
		    while(!place_meeting(x,y+1,objSlope) and !place_meeting(x,y+1,objPrtSolid)) y += 1;
		}

		//Vertical Collisions Slope
		if (place_meeting(x,y+vsp,objSlope)){
			if vsp >= 0 {
				while(!place_meeting(x, y + sign(vsp), objSlope)) y += 1;
				vsp=0;
				if(state != PlayerState.Crouch and state != PlayerState.Damaged and state != PlayerState.Technique){					
					state = PlayerState.Normal;
				}
				sideMovingPlatform = noone;
				normalAtk = false;
				if(airDash) airDash = false;
				if(airJump) airJump = false;	
			}else{
				while(!place_meeting(x, y + sign(vsp), objSlope)) y -= 1;	
				vsp = 0;
			}		
		}
	#endregion
	
	
	#region Vertical Static Solid
		var bottomSolid = instance_place(x, y + vsp, objPrtSolid);
		if bottomSolid >= 0 {		
			if(vsp >= 0) {
				while(!place_meeting(x , y + sign(vsp), bottomSolid)) y += 1;	
				vsp = 0;
				if(state != PlayerState.Crouch and state != PlayerState.Damaged and state != PlayerState.Technique and state != PlayerState.BossEncounter){					
					state = PlayerState.Normal;
				}
				sideMovingPlatform = noone;
				normalAtk = false;
				if(airDash and !key_jump_hold) airDash = false;
				if(airJump) airJump = false;	
			}else{
				while(!place_meeting(x , y + sign(vsp), bottomSolid)){
					y -= 1;	
				}
				vsp = 0;	
			}
		}
	#endregion
	
	
	#region Ladder
		var bottomLadder = instance_place(x, y + vsp, objTopLadder);
		if bottomLadder >= 0 and state != PlayerState.Ladder and state != PlayerState.GrabLadder and bottomLadder.canStand and vsp >= 0 and y < bottomLadder.y{
			while(!place_meeting(x , y + sign(vsp), bottomLadder)){
				y += 1;	
			}	
			vsp = 0;
			if(state != PlayerState.Crouch and state != PlayerState.Damaged){	
				sprite_index = sprite_map_get(Action.idle);
				state = PlayerState.Normal;
			}
			sideMovingPlatform = noone;
			normalAtk = false;
			if(airDash) airDash = false;
			if(airJump) airJump = false;	
		}
	#endregion	
	
	
	y+=vsp;	
}