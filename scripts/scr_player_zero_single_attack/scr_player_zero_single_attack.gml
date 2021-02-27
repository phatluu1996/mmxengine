function scr_player_zero_single_attack(attackAction, nonAttackSprite){
	scr_player_zero_technique_perform();
	if(key_attack_press and !normalAtk){
		normalAtk = true;
		image_index = 0;
		sprite_index = sprite_map_get(attackAction);		
		saber_mask = saber_map_get(attackAction);
		scr_player_zero_new_saber_mask();
	}
	
	if(normalAtk){
		if(state == PlayerState.Jump and key_attack_press and image_index + image_speed >= ceil(image_number/2) + 1){
			image_index = 0;		
			scr_player_zero_new_saber_mask();
		}
		
		if(last_frame()){
			normalAtk = false;
			scr_player_zero_delete_saber_mask();
		}
	}else{	
		if(state == PlayerState.Jump){
			sprite_index = nonAttackSprite;
			if last_frame() {
				if vsp >= 0 {
					image_index = 2;
				}else{
					image_index = image_number - 1;		
				}
			}
		}else{
			sprite_index = nonAttackSprite;	
		}
	}
}