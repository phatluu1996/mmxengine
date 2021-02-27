function scr_global_control(){
	scr_player_get_input();
	if(key_enter){
		global.paused = !global.paused;
	}
}