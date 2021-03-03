function scr_player_state_swap(){
	scr_player_get_input();	
	if(key_swap and state != PlayerState.Swap){
		image_speed = 1;
		state = PlayerState.Swap;
		var swapPlayer = noone;
		if(object_index == objPlayerZero) {
			instance_destroy(objZSaber);
			swapPlayer = objPlayerX;
		}
		if(object_index == objPlayerX) swapPlayer = objPlayerZero;			
		var player = instance_create_depth(x, y, depth, swapPlayer);
		player.state = PlayerState.Spawn;
	}
}