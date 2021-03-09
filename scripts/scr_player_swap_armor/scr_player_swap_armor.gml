function scr_player_swap_armor(){
	if(character != Character.Z and false){
		if(keyboard_check_pressed(ord("1"))){
			scr_get_armor(Character.LightArmor);			
		}else if(keyboard_check_pressed(ord("2"))){
			scr_get_armor(Character.MaxArmor);				
		}else if(keyboard_check_pressed(ord("3"))){
			scr_get_armor(Character.X);				
		}
	}
}

function scr_get_armor(armor){
	if(character != armor){
		chargeCount = 0;
		chargeLv = 0;
		character = armor;
		sprite_index = sprite_map_get(Action.spawn)
		image_index = 6;
		state = PlayerState.EquipArmor;
	}	
}