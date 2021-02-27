function scr_player_zero_new_saber_mask(){	
	//show_debug_message(instance_number(objZSaber))
	if(instance_number(objZSaber) > 0){
		instance_destroy(objZSaber);	
	}
	instance_create_depth(x, y, depth-100,objZSaber);
}