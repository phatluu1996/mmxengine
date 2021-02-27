function scr_player_zero_combo_attack(nonAttackSprite){
	scr_player_zero_technique_perform();
	slash = [Action.attack_1, Action.attack_2, Action.attack_3, Action.attack_4];	
	if(key_attack_press and !normalAtk){		
		normalAtk = true;
		image_index = 0;	
		scr_player_zero_new_saber_mask();
	}
	
	if(normalAtk){	
		if(key_attack_press and image_index + image_speed >= ceil(image_number/2) and atkIndex < atkMaxCombo){
			atkIndex = atkIndex > atkMaxCombo ? 0 : atkIndex + 1;
			image_index = 0;
			scr_player_zero_new_saber_mask();
		}
		
		if(last_frame()){			
			normalAtk = false;
			atkIndex = 0;
			scr_player_zero_delete_saber_mask();
		}
		saber_mask = saber_map_get(slash[atkIndex]);
		sprite_index = sprite_map_get(slash[atkIndex]);
	}else{
		sprite_index = nonAttackSprite;
	}	
	
}