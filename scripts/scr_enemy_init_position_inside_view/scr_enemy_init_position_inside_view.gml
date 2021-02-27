// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_init_position_inside_view(){
	return xstart >= global.cam_x and xstart <= global.cam_x + global.cam_w
	and ystart >= global.cam_y and ystart <= global.cam_y + global.cam_h;
}