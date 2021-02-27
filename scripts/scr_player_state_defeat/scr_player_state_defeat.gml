function scr_player_state_defeat(){	
	defeatCount++;		
	image_alpha = 1;
	if(defeatCount >= defeatDuration / 2 and defeatCount mod 30 == 0){
		var i = 0;
		repeat 8 {
			var explosion = instance_create_depth(x, y, depth-1, objPlayerSoul);
			explosion.sprite_index = sprite_map_get(Action.soul_explode);	
			explosion.orbit_place = i;
			i+=45;
		}	
		
	}
	
	if(defeatCount > defeatDuration*1.5){
		game_restart();	
	}
	
	sprite_index = sprite_map_get(Action.defeat);
}