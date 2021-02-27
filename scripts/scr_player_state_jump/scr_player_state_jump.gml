function scr_player_state_jump(){
	scr_player_get_input();
	busterYOffset = y - 13;
	
	var spd = hyperJump ? runSpd * 3 : runSpd;
	
	hsp = (key_right - key_left) * spd * (sprite_index != sprite_map_get(Action.dash_up));	
	
	vsp = vsp >= jumpSpd ? jumpSpd : vsp + gravSpd;
	
	scr_player_horizone_turn();
	
	if(!keyboard_check(ord("K")) and vsp < 0 and sprite_index != sprite_map_get(Action.dash_up)){
		vsp = 0;	
	}	
	
	if(vsp >= 0){
		if((place_meeting(x + 1 + hsp, y, objPrtSolid) and key_right)
		or (place_meeting(x - 1 + hsp, y, objPrtSolid) and key_left)){
			state = PlayerState.WallSlide;
			specialShoot = false;
			normalAtk = false;
			image_index = 0;
			vsp = 0;
		}
		
		var movingSolid = instance_place(x + hsp*2, y, objMovingSolid);
		if((place_meeting(x + hsp*2, y, objMovingSolid) and key_right)
		or (place_meeting(x + hsp*2, y, objMovingSolid) and key_left)){	
			sideMovingPlatform = movingSolid;
			state = PlayerState.MovingSolidSlide;
			specialShoot = false;
			normalAtk = false;
			image_index = 0;
			vsp = 0;
		}
		
		if((place_meeting(x + 4, y, objPrtSolid) or place_meeting(x + 4, y, objMovingSolid)) and image_xscale == 1 and key_jump)
		or ((place_meeting(x - 4, y, objPrtSolid) or place_meeting(x - 4, y, objMovingSolid)) and image_xscale == -1 and key_jump){
			state = PlayerState.WallKick;
			hyperJump = key_dash_hold;
			wallJumpDir = image_xscale;
			specialShoot = false;
			normalAtk = false;
			image_index = 0;		
		}else{
			if(key_jump and !airDash and !hyperJump and !airJump and vsp >= 0 and canAirJump){
				vsp = -jumpSpd;	
				airJump = true;
			}		
		}
	}
	
	var ladder = instance_place(x, y, objLadder);
	if(ladder >= 0 and (key_up or key_down) and x < ladder.x + 10 and x > ladder.x - 10) {
		state = PlayerState.Ladder;	
		x = ladder.x;
		image_index = 0;
		hsp = 0;
		normalAtk = false;
		hyperJump = false;
		airDash = false;
		airJump = false;
	}
	
	isZero = character == Character.Z;
	var rope = collision_rectangle(x-1, bbox_top - 8 - 12 * isZero, x+1, bbox_top - 10 - 10 * isZero + vsp, objPrtRope, true, true);
	if(rope >= 0 and (key_up or key_down)  and vsp >= 0){
		if(rope.object_index == objYRope){
			state = PlayerState.GrabVerticalRope;	
			x = rope.x;
		}else if(rope.object_index == objXRope) {
			state = PlayerState.GrabHorizoneRope;	
			y = character == Character.Z ? rope.y + 50 : rope.y + 36;			
		}else if(rope.object_index == objXYRope){			
			while(collision_rectangle(x - 1, bbox_top-8 - 12 * isZero, x + 1, bbox_top - 10 - 10 * isZero, objPrtRope, true, true) < 0){
				y+=sign(vsp);
			}
			state = PlayerState.GrabDeclineRope;
			//y = character == Character.Z ? Y + 50 : Y + 36;
		}
		image_index = 0;
		hsp = 0;
		vsp = 0;
		normalAtk = false;
		hyperJump = false;
		specialShoot = false;
		airDash = false;
		airJump = false;	
		
		if(place_meeting(x,y, objPrtSolid) or place_meeting(x,y, objSlope) or place_meeting(x, y, objMovingSolid)){
			state = PlayerState.Normal;
			while(place_meeting(x,y, objPrtSolid) or place_meeting(x,y, objSlope) or place_meeting(x, y, objMovingSolid)) y-=1;
		}
	}
	
	if(key_dash_press and !airDash and !hyperJump and !wall_collide_1px() and !airJump and canAirDash){
		airDash = true;
		image_index = 0;
		vsp = 0;
		normalAtk = false;
		if(key_up and character == Character.MaxArmor){
			state = PlayerState.DashUp;		
			sprite_map_get(Action.dash_up);
		}else{			
			state = PlayerState.Dash;
		}
	}
	
	
	
	
	if(character == Character.Z) scr_player_zero_single_attack(airJump ? Action.roll_attack : Action.jump_attack, vsp < 0 ? (airJump ? sprite_map_get(Action.roll) : sprite_map_get(Action.jump)) : sprite_map_get(Action.fall));
	if(scr_is_player_x()){ 
		if(last_frame()){
			image_index = image_number-1;	
		}
		var sprite_jump = sprite_map_get(Action.jump);
		if(vsp < 0) {
			if(sprite_index == sprite_map_get(Action.dash_up)){
				sprite_jump = sprite_map_get(Action.dash_up);
			}else{
				sprite_jump = sprite_map_get(Action.jump);
			}
		}else{
			sprite_jump =  sprite_map_get(Action.fall);	
		}		
		scr_player_x_attack(sprite_map_get(Action.jump_attack), sprite_jump);
	} 
}