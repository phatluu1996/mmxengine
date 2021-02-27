function scr_player_horizone_turn(){
	image_xscale = (key_right - key_left) != 0 ? (key_right - key_left) : image_xscale;	
}