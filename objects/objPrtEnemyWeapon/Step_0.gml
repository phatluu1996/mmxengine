if(global.paused){  
	image_speed = 0;	
	exit;
}else{
	image_speed = 1;		
}	
switch (sprite_index) {
    case spr_ras_rocket:
		if(place_meeting(x, y, objPrtPlayer) 
		or place_meeting(x, y, objPrtSolid) 
		or place_meeting(x, y, objSlope)){
			impact = instance_create_depth(x, y, depth - 100, objEnemyWeaponImpact);
			impact.sprite_index = spr_enemy_explosion_1;
			instance_destroy();
		}
        break;
		
	 case spr_hoganmer_mace:		
		if(count > 0){
			count--;	
		}else{
			count--;	
			if(count > -60){
				hsp = 0;
				vsp = 0;
			}else{
				hsp = prev_hsp;
				vsp = prev_vsp;
				if(place_meeting(x, y, user)){
					instance_destroy();	
				}
			}
		}
		
		scr_enemy_weapon_block_player_attack()
		
		if(user.state != EnemyState.Active){
			hsp = 0;
			vsp = 0;
			var explosion = instance_create_depth(x, y, depth - 1, objPlayerWeaponImpact);
			explosion.sprite_index = irandom(1) ? spr_enemy_explosion_1 : spr_enemy_explosion_2;
			instance_destroy();		
		}	
		break;
		
	case spr_ball_axe_mace:
		scr_enemy_weapon_block_player_attack();
		break;
		
	case spr_fire_guy_flame:
		if(last_frame()){
			instance_destroy();
		}
		if(user.count >= 100){
			if(user.count == 100){
				image_index = 7;	
			}
		}else{
			if(image_index >= 7){
				image_index = 3;	
			}
		}
		exit;
		break;
    default:
        // code here
        break;
}
x += hsp;
y += vsp;