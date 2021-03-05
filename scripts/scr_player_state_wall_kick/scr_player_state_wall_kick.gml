function scr_player_state_wall_kick(){	
	scr_player_get_input();
	scr_player_x_buster_charge();
	
	specialShoot = false;	
	var delay = 5;	
	if(airDash){
		airDash = false;
	}
	
	if(wallJumpCount < delay){ 
		if(wallJumpCount == 0){
			scr_player_wall_effect(spr_wall_jump_eff);
		}
		wallJumpCount++;
	}else{
		state = PlayerState.WallJump;
		vsp = -jumpSpd;
		wallJumpDir = -image_xscale;
		wallJumpCount = 0;
	}
	
	if(image_index + image_speed >= 4){
		image_index = image_number - 1;
	} 
	
	if(character == Character.Z) scr_player_zero_single_attack(Action.jump_attack, sprite_map_get(Action.wall_kick));
	if(scr_is_player_x()) scr_player_x_attack(sprite_map_get(Action.jump_attack), sprite_map_get(Action.wall_kick));
}

function scr_player_wall_effect(sprite){
	var eff = instance_create_depth(x + image_xscale*9, bbox_bottom, depth - 1, objPlayerEffect);	
	eff.sprite_index = sprite;
	eff.image_xscale = image_xscale;	
	eff.image_index = 0;	
}