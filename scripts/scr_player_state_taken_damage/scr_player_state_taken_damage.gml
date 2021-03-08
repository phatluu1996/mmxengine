function scr_player_state_taken_damage(){
	var enemy = scr_player_hit_by_enemy();
	if(enemy >= 0 and state != PlayerState.Damaged and damagedCount < damagedDuration){
		scr_player_zero_delete_saber_mask();
		state = PlayerState.Damaged;	
		energy = energy >= 0 ? energy-enemy.damageToPlayer : 0;
		var delta = energy_prev - energy;
		period = round(invincibleDuration/delta);
		hsp = 0;
		vsp = 0;
		atkIndex = false;
		normalAtk = false;
		specialShoot = false;
		dashCount = 0;
		wallJumpCount = 0;
		image_index = 0;
		image_speed = 1;		
	}
	
	if(place_meeting(x, y, objSpike)){
		scr_player_zero_delete_saber_mask();
		state = PlayerState.Damaged;	
		energy = 0;
		var delta = energy_prev - energy;
		period = round(invincibleDuration/delta);
		hsp = 0;
		vsp = 0;
		atkIndex = false;
		normalAtk = false;
		specialShoot = false;
		dashCount = 0;
		wallJumpCount = 0;
		image_index = 0;
		image_speed = 1;		
	}
	
	if((energy <= 0 or scr_player_crushed_by_platform()) and state != PlayerState.Defeat){
		state = PlayerState.Defeat;	
		image_alpha = 0;
	}
	
	if(damagedCount != 0 and damagedCount mod period == 0){
		energy_prev--;	
	}
	
	if(damagedCount >= damagedDuration){
		if(damagedCount <= invincibleDuration){
			damagedCount++;				
			
			switch (damagedCount/2 mod 3) {
			    case 0:
			        image_alpha = 0;
			        break;
					
				case 1:
			        image_alpha = 1;
			        break;
					
				case 2:
			        image_alpha = 1;
			        break;
			}
		}else{
			image_alpha = 1;
			damagedCount = 0;	
			energy_prev = energy;
		}
	}
}