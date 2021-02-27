function scr_player_draw_hud(){
	//var scr_cornor_x = cam_x + 8;
	//var scr_cornor_y = cam_y + 8;
	var scr_cornor_x = camera_get_view_x(view_camera[0]) + 8;
	var scr_cornor_y = camera_get_view_y(view_camera[0]) + 8;
	
	draw_sprite(object_index == objPlayerX ? spr_x_energy_symbol : spr_z_energy_symbol, 0, scr_cornor_x, scr_cornor_y);
	var i = 1;
	repeat energyLimit {
		draw_sprite(spr_energy_hit_point_loss, 0, scr_cornor_x + 27 + (i-1)*2, scr_cornor_y);
		i++;
	}	
	draw_sprite(spr_energy_bar_top, 0, scr_cornor_x + 27 + (i-1)*2, scr_cornor_y);	
	
	i = 1;
	repeat energy_prev {
		draw_sprite(spr_energy_hit_point_loss_temp, 0, scr_cornor_x + 27 + (i-1)*2, scr_cornor_y);
		i++;
	}
	
	i = 1;
	repeat energy {
		draw_sprite(spr_energy_hit_point, 0, scr_cornor_x + 27 + (i-1)*2, scr_cornor_y);
		i++;
	}
	
	
	
}