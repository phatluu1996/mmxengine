// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sprite_map_get(key){
	return ds_map_find_value(player_sprite, key);
}