function scr_lightning_gazelle_init(){
	atkStanceSpr = spr_lg_attack_stance;
	chargeStanceSpr = spr_lg_charge_stance;
	
	flashSpr = spr_lg_flash;
	poseSpr = spr_lg_pose;	
	fallSpr = spr_lg_fall;
	idleSpr = spr_lg_idle;
	jumpSpr = spr_lg_jump;
	airSlashSpr = spr_lg_jump_slash;
	slashSpr[0] = spr_lg_slash_0;
	slashSpr[1] = spr_lg_slash_1;
	upSlashSpr[0] = spr_lg_upper_slash_0;
	upSlashSpr[1] = spr_lg_upper_slash_1;
	thunderStrikeSpr = spr_lg_thunder_strike;
	thunderChargeSpr = spr_lg_thunder_charge;
}

function scr_lightning_gazelle_sonic_boom(X, Y, spd, angle, rotate, sprite){
	var shot = instance_create_depth(X, Y, depth-100, objPrtEnemyWeapon);
	shot.sprite_index = sprite;				
	shot.damageToPlayer = 2;	
	shot.hsp = image_xscale * dcos(angle) * spd;
	shot.vsp = dsin(angle) * spd;
	shot.image_xscale = image_xscale;	
	if(rotate) shot.image_angle = angle;
}

function scr_appear_near_player(){
	var player = collision_rectangle(camera_x, camera_y, camera_x + camera_w, camera_y + camera_h, objPrtPlayer, false, true);
	if(player >= 0){
		if(player.x <= camera_x + 64){
			x = player.x + 40; 	
		}else if(player.x >= camera_x + camera_w - 64){
			x = player.x - 40; 
		}else{
			x = player.x - 35 * player.image_xscale; 	
		}
	}
}

function scr_lightning_gazelle_step_event(){
	switch (action) {
	    case "idle":
			var _alarm = 30;
	        sprite_index = atkStanceSpr;			
			if(count <= _alarm){
				count++;	
			}else{
				count = 0;
				action = "slash_1";
				image_index = 0;
				scr_enemy_turn_to_player();
			}
	        break;
		
		case "slash_1":
			var _alarm = 10;
			sprite_index = slashSpr[0];				
			if(floor(image_index) == image_number - 3 and !toggle){
				scr_lightning_gazelle_sonic_boom(x + 20 * image_xscale, y, 7, 5, false,spr_lg_elec_boomerang);
				toggle = true;
			}
			if(last_frame()){
				image_index = image_number - 1;
				count++;
				if(count>=_alarm){
					count = 0;
					action = "slash_2";	
					image_index = 0;
					toggle = false;
					scr_enemy_turn_to_player();
				}
			}
			break;
			
		case "slash_2":
			var _alarm = 10;
			sprite_index = slashSpr[1];	
			if(floor(image_index) == image_number - 6 and !toggle){
				scr_lightning_gazelle_sonic_boom(x + 20 * image_xscale, y-15, 7, -5, false,spr_lg_elec_boomerang);
				toggle = true;
			}
			if(last_frame()){
				image_index = image_number - 1;
				count++;
				if(count>=_alarm){
					count = 0;
					action = "slash_3";	
					image_index = 0;
					toggle = false;
					scr_enemy_turn_to_player();
				}
			}
			break;
			
		case "slash_3":
			var _alarm = 5;
			sprite_index = upSlashSpr[0];
			if(floor(image_index) == image_number - 5 and !toggle){
				scr_lightning_gazelle_sonic_boom(x + 20 * image_xscale, y, 9, 0, false,spr_lg_sonic_boom);
				toggle = true;
			}
			if(last_frame()){
				image_index = image_number - 1;
				count++;
				if(count>=_alarm){
					count = 0;
					action = "charge_stance";	
					toggle = false;
					scr_enemy_turn_to_player();
				}
			}
			break;
			
		case "charge_stance":
			var _alarm = 90;			
			count++;
			if(count >= _alarm){
				sprite_index = flashSpr;
				if(last_frame()){
					count = 0;
					action = "flash";
					x = -100;
				}
			}else{
				sprite_index = chargeStanceSpr;	
			}
			break;
			
		case "flash":		
			var _alarm = 90;
			count++;
			if(count >= _alarm){
				count = 0;
				action = "sudden_strike";
				sprite_index = atkStanceSpr;
				image_index = 0;
				scr_appear_near_player();
				scr_enemy_turn_to_player();
			}
			break;
			
		case "sudden_strike":
			var _alarm = 10;
			count++;
			if(count>=_alarm){
				if(!toggle){
					var player = collision_rectangle(camera_x, camera_y, camera_x + camera_w, camera_y + camera_h, objPrtPlayer, false, true);
					if(player.state == PlayerState.Movement or player.state == PlayerState.Normal or (player.state == PlayerState.Dash and !player.airDash)){
						sprite_index = slashSpr[1];		
					}else{
						sprite_index = upSlashSpr[1];		
					}
					toggle = true;
					image_index = 0;
				}
				
				if(sprite_index == upSlashSpr[1]){
					if(vsp < 0){
						hsp = image_xscale * 0.5;
						if(last_frame()){
							vsp = 0;
							sprite_index = fallSpr;
						}
					}else{
						if(image_index >= 8 and vsp == 0){
							vsp = -11;	
						}
					}
					scr_enemy_gravity();
				}else if(sprite_index == fallSpr){	
					hsp = 0;
					if(last_frame()){
						image_index = image_number - 3;		
					}
					scr_enemy_gravity();
					if(place_meeting(x, y + 1, objPrtSolid) or place_meeting(x, y + 1, objSlope)){
						sprite_index = atkStanceSpr;	
					}
				}else if(sprite_index == slashSpr[1]){
					if(last_frame()){
						sprite_index = atkStanceSpr;	
					}
				}else{
					if(last_frame()){
						image_index = image_number - 1;				
						count = 0;
						action = "idle";
						toggle = false;
					}				
				}
			}
			break;
		
	    default:
	        action = "idle";
	        break;
	}
	scr_enemy_collision_movement();
}