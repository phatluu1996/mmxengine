// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_grab_vertical_rope(){
	var h = character == Character.Z ? 12 : 0;
	busterYOffset = y - 11;
	hsp = 0;
	scr_player_horizone_turn();
	scr_player_grab_rope_move();	
	
	if(collision_rectangle(x, bbox_top - 8 - h + vsp, x, bbox_top - 10 - h + vsp, objEndRope, false, true) >= 0){
		while(collision_rectangle(x, bbox_top - 8 - h + sign(vsp), x, bbox_top - 10 - h + sign(vsp), objEndRope, false, true) < 0){
			y+=sign(vsp);	
		}
		vsp = 0;		
	}	
	
	if(vsp == 0 and !normalAtk and !specialShoot){
		image_index = 0;	
	}
	
	scr_player_grab_rope_jump();
	
	if(character == Character.Z) scr_player_zero_single_attack(Action.grab_rope_attack, sprite_map_get(Action.grab_rope));
	if(scr_is_player_x()) scr_player_x_attack(sprite_map_get(Action.grab_rope_attack), sprite_map_get(Action.grab_rope)); 
}

function scr_player_state_grab_horizone_rope(){
	var h = character == Character.Z ? 12 : 0;
	busterYOffset = y - 11;
	vsp = 0;
	scr_player_horizone_turn();	
	scr_player_grab_rope_move();
	
	if(collision_rectangle(x + hsp, bbox_top - 8 - h, x + hsp, bbox_top - 10 - h, objEndRope, false, true) >= 0){
		while(collision_rectangle(x + sign(hsp), bbox_top - 8 - h, x + sign(hsp), bbox_top - 10 - h, objEndRope, false, true) < 0){
			x+=sign(hsp);	
		}
		hsp = 0;		
	}
	
	if(hsp == 0 and !normalAtk and !specialShoot){
		image_index = 0;	
	}
	
	scr_player_grab_rope_jump();
	
	if(character == Character.Z) scr_player_zero_single_attack(Action.grab_rope_attack, sprite_map_get(Action.grab_rope));
	if(scr_is_player_x()) scr_player_x_attack(sprite_map_get(Action.grab_rope_attack), sprite_map_get(Action.grab_rope)); 
}

function scr_player_state_grab_decline_rope(){
	var h = character == Character.Z ? 12 : 0;
	busterYOffset = y - 11;
	scr_player_horizone_turn();	
	scr_player_grab_rope_move();
	
	if(collision_rectangle(x + hsp, bbox_top - 8 - h + vsp, x + hsp, bbox_top - 10 - h + vsp, objEndRope, false, true) >= 0){
		while(collision_rectangle(x, bbox_top - 8 - h, x, bbox_top - 10 - h, objEndRope, false, true) < 0){
			x+=sign(hsp);	
		}
		hsp = 0;		
		vsp = 0;
	}
	
	if(hsp == 0 and !normalAtk and !specialShoot){
		image_index = 0;	
	}
	
	scr_player_grab_rope_jump();
	
	if(character == Character.Z) scr_player_zero_single_attack(Action.grab_rope_attack, sprite_map_get(Action.grab_rope));
	if(scr_is_player_x()) scr_player_x_attack(sprite_map_get(Action.grab_rope_attack), sprite_map_get(Action.grab_rope)); 	
}

function scr_player_grab_rope_move(){
	if(key_dash_hold and dashCount < dashDuration){		
		scr_player_grab_rope_set_speed(image_xscale * dashSpd, (key_down - key_up) * dashSpd, image_xscale * dashSpd);
		dashCount++;	
	}else{
		if(!key_dash_hold){
			dashCount = 0;			
		}
		scr_player_grab_rope_set_speed((key_right - key_left) * runSpd, (key_down - key_up) * runSpd, (key_right - key_left) * runSpd);
	}
}

function scr_player_grab_rope_jump(){
	if(key_jump){
		dashCount = 0;
		image_speed = 1;
		image_index = 0;
		state = PlayerState.Jump;
		normalAtk = false;
		vsp = -jumpSpd;
		if(key_dash_hold){
			hyperJump = true;	
		}
	}	
}

function scr_player_grab_rope_set_speed(_hsp, _vsp, _h_v_spd){
	if(state == PlayerState.GrabVerticalRope){
		vsp = _vsp;
		hsp = 0;
	}else if(state == PlayerState.GrabHorizoneRope){
		hsp = _hsp;
		vsp = 0;
	}else if(state == PlayerState.GrabDeclineRope){
		hsp = _hsp;
		var rope = collision_rectangle(x-4, bbox_top - 4 - 12 * isZero, x + 4, bbox_top - 10 - 10 * isZero, objPrtRope, true, true);
		if(rope >= 0){
			var cornor = darctan(rope.image_yscale / rope.image_xscale);
			hsp = dcos(cornor) * _h_v_spd;
			vsp = -sign(rope.image_yscale) * dsin(cornor) * _h_v_spd;
		}else{
			vsp = 0;	
		}		
	}	
}