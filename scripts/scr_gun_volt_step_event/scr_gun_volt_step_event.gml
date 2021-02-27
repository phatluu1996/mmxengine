function scr_gun_volt_step_event(){
	switch (action) {
		case "idle":
			sprite_index = spr_gv_idle;
			if(count < 120){
				count++;	
			}else{
				count = 0;
				if(irandom(1)){
					action = "missile";
				}else{
					action = "elec_orb";	
				}
			}
			break;
			
		case "missile":
			sprite_index = spr_gv_shoot_missile;
			if(last_frame()){
				image_index = image_number - 1;
				if(count <= 90){
					count++;	
					if(count == 45){
						scr_gun_volt_shoot(x, y - 15, 1);	
					}else if(count == 90){
						scr_gun_volt_shoot(x + image_xscale * 18, y - 30, 1);	
					}
				}else{
					count = 0;
					action = "idle";
				}
			}
			break;
			
		case "elec_orb":
			sprite_index = spr_gv_shoot_elec_orb;
			if(last_frame()){
				image_index = image_number - 1;
				scr_gun_volt_shoot(x + image_xscale * 21, y + 2, 0);
				scr_gun_volt_shoot(x + image_xscale * 38, y + 2, 0);
				count = 0;
				action = "idle";
			}
			break;
		
		
		default:
			action = "idle";
			break;
	}
	scr_enemy_gravity();
	scr_enemy_collision_movement();
}