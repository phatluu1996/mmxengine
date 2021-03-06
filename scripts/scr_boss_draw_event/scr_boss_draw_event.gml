function scr_boss_draw_event(){
	if(state != BossState.Deactive){
		scr_view_camera_variables();
		var _x_corner = camera_x + camera_w-37;
		var _y_corner = camera_y + 2;
		var _x_start_lid = _x_corner + 2;
		var _y_start = _y_corner + 6;
		var _x_start = _x_start_lid - 3;
		var _hud_icon = spr_boss_hud_header;
		draw_sprite_ext(_hud_icon, 0, _x_corner, _y_corner, 1,1, 0, c_white, 1);
		draw_sprite_ext(spr_boss_hud_lid, 0, _x_start_lid, _y_start, -1,1, 0, c_white, 1);
		for (var i = 1; i <= maxHp; ++i) {	
			draw_sprite_ext(spr_boss_hud_part, 0, _x_start - i*2, _y_start, 1, 1, 0, c_white, 1);	
			if damage and i <= prev_hp and i > hp{
				draw_sprite_ext(spr_boss_hud_hp_loss, 0, _x_start - i*2, _y_start, 1, 1, 0, c_white, 1);
			}else{
				draw_sprite_ext(spr_boss_hud_empty_hp, -1, _x_start - i*2, _y_start,1,1, 0, c_white, 1);
			}
		}
	
		draw_sprite_ext(spr_boss_hud_lid, 0, _x_start_lid-maxHp*2-6, _y_start, 1,1,0, c_white, 1);
	
		for (var i = 1; i <= hp; ++i) {	
			if i <= hp {
				draw_sprite_ext(spr_boss_hud_hp, 0, _x_start - i*2, _y_start, 1,1, 0, c_white, 1);
			}else{
				draw_sprite_ext(spr_boss_hud_hp, 0, _x_start - i*2, _y_start, 1,1, 0, c_white, 1);	
			}
		}	
	}
	
	draw_sprite_ext(sprite_index, image_index,x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}