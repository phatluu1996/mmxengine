function scr_player_state_wall_slide(){
	scr_player_get_input();
	busterYOffset = y - 11;
	if(airJump) airJump = false;	
	if(airDash) airDash = false;
	if(hyperJump) hyperJump = false;
	
	if(last_frame()){
		image_index = image_number - 1;	
	}
	
	if((image_xscale == 1 and key_right and place_meeting(x + 1, y, objPrtSolid))
	or (image_xscale == -1 and key_left and place_meeting(x - 1, y, objPrtSolid))){		
		if(round(y) mod 4 == 0){
			var i = 0;
			repeat 5{
				var dust = instance_create_depth(x + image_xscale * 14, bbox_top + 5 - i*8, depth - 100, objPlayerEffect);	
				dust.sprite_index = spr_effect_dash_dust;
				dust.image_index = i;
				dust.image_xscale = image_xscale;	
			}
		}
		vsp = wallSpd;	
	}else{
		state = PlayerState.Jump;	
		normalAtk = false;	
	}
	
	
	
	if(key_jump){
		image_index = 0;
		wallJumpDir = -image_xscale;
		if(key_dash_hold) hyperJump = true;
		state = PlayerState.WallKick;		
		normalAtk = false;
		if(specialShoot){
			specialShoot = false;
			chargeLv = 0;
		}
	}
	
	if(character == Character.Z) scr_player_zero_single_attack(Action.wall_cling_attack, sprite_map_get(Action.wall_cling));
	if(scr_is_player_x()) scr_player_x_attack(sprite_map_get(Action.wall_cling_attack), sprite_map_get(Action.wall_cling)); 
}