function scr_player_draw_event(){
	if(state != PlayerState.Swap) scr_player_draw_hud();	
	draw_text(x, y - 70, "Paused:" + string(global.paused));
	
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
		if(chargeLv >= 1){			
			if(global.weaponIndex == 0){
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);		
			}else{
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.2);		
			}				
		}		
	}	
	//draw_sprite_ext(mask_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);	
	if(object_index == objPlayerX){
		draw_rectangle_color(x-1, bbox_top-8, x+1, bbox_top - 10, c_white, c_white, c_white, c_white, true);
		draw_rectangle_color(x-4, bbox_top - 4, x+4, bbox_top - 10, c_red,  c_red,  c_red,  c_red, true);
	}else{
		draw_rectangle_color(x-1, bbox_top-20, x+1, bbox_top - 22, c_white, c_white, c_white, c_white, true);	
		draw_rectangle_color(x-4, bbox_top - 4 - 12, x+4, bbox_top - 10 - 10, c_red,  c_red,  c_red,  c_red, true);
	}
	shader_reset();
}