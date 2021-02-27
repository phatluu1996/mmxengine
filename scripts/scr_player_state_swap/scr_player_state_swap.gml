function scr_player_state_swap(){
	scr_player_get_input();	
	if(key_swap and state != PlayerState.Swap){
		image_speed = 1;
		state = PlayerState.Swap;
		var swapToPlayer = noone;
		if(object_index == objPlayerZero) {
			instance_destroy(objZSaber);
			swapToPlayer = objPlayerX;
		}
		if(object_index == objPlayerX) swapToPlayer = objPlayerZero;			
		instance_create_depth(x, y, depth, swapToPlayer);
	}
}