function scr_player_zero_delete_saber_mask(){
	if(instance_number(objZSaber) > 0){
		instance_destroy(objZSaber);	
	}
}