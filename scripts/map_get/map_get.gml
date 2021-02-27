// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map_get(map_id, key){
	return ds_map_find_value(map_id, key);
}