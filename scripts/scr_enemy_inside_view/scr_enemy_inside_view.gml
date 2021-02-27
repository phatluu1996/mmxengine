// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_inside_view(){
	return ((bbox_right >= camera_x and bbox_right <= camera_x + camera_w)
	or (bbox_left >= camera_x and bbox_left <= camera_x + camera_w))
	and ((bbox_top >= camera_y and bbox_top <= camera_y + camera_h)
	or (bbox_bottom >= camera_y and bbox_bottom <= camera_y + camera_h));
}