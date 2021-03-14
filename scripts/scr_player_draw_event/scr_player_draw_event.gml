function scr_player_draw_event(){
	if(state != PlayerState.Swap) scr_player_draw_hud();	
		
	if(state == PlayerState.Begin and readyCount > 0){
		scr_view_camera_variables();
		draw_sprite_ext(spr_ready_txt, image_index, camera_x + camera_w/2, camera_y + camera_h/2, 1, image_yscale, image_angle, image_blend, readyCount mod 10 != 0);	
	}
	
	if(state == PlayerState.Dash or hyperJump){
		if(dashCount mod 2 == 0){
			part_type_sprite(particle_fade, sprite_index, 1, 0, 0);
			part_type_scale(particle_fade, image_xscale, image_yscale);
			part_particles_create(particle_sys, x, y, particle_fade, 1);
		}
	}
	
	scr_player_shader_draw();
	
	if(chargeLv >= 1 and !specialShoot and !normalShoot){
		draw_sprite_ext(chargeSprite, chargeCount/2, x, y, image_xscale, image_yscale, 0, c_white, 1);	
		if(chargeLv == chargeLvMax - 1){
			draw_sprite_ext(spr_x_charge_aura_lv1, chargeCount/2, x, y, image_xscale, image_yscale, 0, c_white, 1);	
			draw_sprite_ext(spr_x_charge_aura_lv2, chargeCount/3, x, y, image_xscale, image_yscale, 0, c_white, 1);
			draw_sprite_ext(spr_x_charge_aura_lv3, chargeCount/4, x, y, image_xscale, image_yscale, 0, c_white, 1);
		}
	}
	if(state == PlayerState.Defeat and defeatCount >= defeatDuration - 100){
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
	}else{
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);			
	}	
	scr_player_draw_armor();
	//draw_sprite_ext(mask_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);	
	//if(object_index == objPlayerX){
	//	draw_rectangle_color(x-1, bbox_top-8, x+1, bbox_top - 10, c_white, c_white, c_white, c_white, true);
	//	draw_rectangle_color(x-4, bbox_top - 4, x+4, bbox_top - 10, c_red,  c_red,  c_red,  c_red, true);
	//}else{
	//	draw_rectangle_color(x-1, bbox_top-20, x+1, bbox_top - 22, c_white, c_white, c_white, c_white, true);	
	//	draw_rectangle_color(x-4, bbox_top - 4 - 12, x+4, bbox_top - 10 - 10, c_red,  c_red,  c_red,  c_red, true);
	//}
	shader_reset();
}

function scr_player_draw_armor(){
	if(object_index != objPlayerZero){
		if(helm != ""){
			var helmSpr = asset_get_index(string_replace(sprite_get_name(sprite_index),"_x_", helm) + "_helm");
			//show_debug_message(string_replace(sprite_get_name(sprite_index),"_x_", "_la_") + "_helm");
			if(sprite_exists(helmSpr)){
				draw_sprite_ext( helmSpr, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);		
			}
		}
	
		if(arm != ""){ 
			var armSpr = asset_get_index(string_replace(sprite_get_name(sprite_index),"_x_", arm) + "_arm");
			//show_debug_message(string_replace(sprite_get_name(sprite_index),"_x_", "_la_") + "_arm");
			if(sprite_exists(armSpr)){
				draw_sprite_ext( armSpr, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);		
			}
		}
	
		if(body != ""){ 
			var bodySpr = asset_get_index(string_replace(sprite_get_name(sprite_index),"_x_", body) + "_body");
			//show_debug_message(string_replace(sprite_get_name(sprite_index),"_x_", "_la_") + "_body");
			if(sprite_exists(bodySpr)){
				draw_sprite_ext( bodySpr, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);		
			}
		}
	
	
	
		if(foot != ""){
			var footSpr = asset_get_index(string_replace(sprite_get_name(sprite_index),"_x_", foot) + "_foot");
			//show_debug_message(string_replace(sprite_get_name(sprite_index),"_x_", "_la_") + "_foot");
			if(sprite_exists(footSpr)){
				draw_sprite_ext( footSpr, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);		
			}
		}
	}
}