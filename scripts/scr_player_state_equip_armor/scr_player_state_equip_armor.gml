// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_equip_armor(){
	if(last_frame()){
		ds_map_clear(player_sprite);
		ds_list_clear(buster_sprite)
		scr_player_sprites_mapping(character);
		state = PlayerState.Normal;
	}
}