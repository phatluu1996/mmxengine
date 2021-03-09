function scr_player_sprites_mapping(character){	
	enum Action {
		idle, 	
		climb,
		wall_cling,
		run,
		jump,
		air_jump,
		fall,
		roll,
		dash,
		dash_up,
		wall_kick,
		climb_up,
		climb_down,
		grab_ladder,
		crouch,
		damaged,
		spawn,
		recall,
		defeat,
		soul_explode,
		grab_rope,
		attack,
		attack_1,
		attack_2,
		attack_3,
		attack_4,
		jump_attack,
		roll_attack,
		climb_attack,
		wall_cling_attack,
		wall_kick_attack,
		crouch_attack,
		run_attack,
		fall_attack,
		dash_attack,
		jump_special_attack,
		stand_special_attack,
		wall_cling_special_attack,
		climb_special_attack,
		dash_special_attack,
		grab_rope_attack,
		grab_rope_special_attack
	}
	
	enum Buster {
		lv1, 
		lv2,
		lv3,
		lv4,
		lv5
	}
	
	if(object_index == objPlayerX){
		//Classic Color
		colorMatch[0] = new Color(0,128,248);
		colorMatch[1] = new Color(0,64,240);
		colorMatch[2] = new Color(32,48,128);
		
		colorMatch[3] = new Color(120,216,240);
		colorMatch[4] = new Color(80,160,240);
		colorMatch[5] = new Color(24,88,176);
		
		//Classic Color
		colorReplace[0] = new Color(0,128,248);
		colorReplace[1] = new Color(0,64,240);
		colorReplace[2] = new Color(32,48,128);	
		
		colorReplace[3] = new Color(120,216,240);
		colorReplace[4] = new Color(80,160,240);
		colorReplace[5] = new Color(24,88,176);
	}else if(object_index == objPlayerZero){		
		colorMatch[0] = new Color(224,32,0);
		colorMatch[1] = new Color(224,32,0);
		colorMatch[2] = new Color(160,32,0);
		colorMatch[3] = new Color(96,32,0);
		zero_technique = ds_map_create();		
	}
	
	switch (character) {	
		case Character.LightArmor:		
			canAirDash = true;
			chargeLvMax = 4;
			damagedDuration = room_speed / 4;			
			sprite_map_add(Action.idle, spr_la_idle);
			sprite_map_add(Action.climb, spr_la_climb);
			sprite_map_add(Action.wall_cling, spr_la_wall_slide);
			sprite_map_add(Action.run, spr_la_run);
			sprite_map_add(Action.jump, spr_la_jump_0);
			sprite_map_add(Action.fall, spr_la_jump_1);
			sprite_map_add(Action.dash, spr_la_dash);			
			sprite_map_add(Action.wall_kick, spr_la_wall_kick);
			sprite_map_add(Action.climb_up, spr_la_climb_up);
			sprite_map_add(Action.climb_down, spr_la_climb_down);
			sprite_map_add(Action.grab_ladder, spr_la_climb_grab);
			sprite_map_add(Action.crouch, spr_la_crouch);
			sprite_map_add(Action.damaged, spr_la_damaged);
			sprite_map_add(Action.spawn, spr_x_spawn);
			sprite_map_add(Action.recall, spr_x_recall);
			sprite_map_add(Action.defeat, spr_la_defeat);
			sprite_map_add(Action.soul_explode, spr_x_soul);	
			sprite_map_add(Action.grab_rope, spr_la_grab_rope);	
			
			sprite_map_add(Action.attack, spr_la_stand_shoot);
			sprite_map_add(Action.run_attack, spr_la_run_shoot);
			sprite_map_add(Action.jump_attack, spr_la_jump_shoot_0);
			sprite_map_add(Action.fall_attack, spr_la_jump_shoot_1);
			sprite_map_add(Action.climb_attack, spr_la_climb_shoot);
			sprite_map_add(Action.wall_cling_attack, spr_la_wall_slide_shoot);
			sprite_map_add(Action.wall_cling_attack, spr_la_wall_slide_shoot);
			sprite_map_add(Action.crouch_attack, spr_la_crouch_shoot);
			sprite_map_add(Action.dash_attack, spr_la_dash_shoot);	
			sprite_map_add(Action.grab_rope_attack, spr_la_grab_rope_shoot);	
			
			sprite_map_add(Action.stand_special_attack, spr_la_stand_hadoken);
			sprite_map_add(Action.jump_special_attack, spr_la_air_hadoken);
			sprite_map_add(Action.wall_cling_special_attack, spr_la_wall_slide_hadoken);
			sprite_map_add(Action.climb_special_attack, spr_la_air_hadoken);
			sprite_map_add(Action.dash_special_attack, spr_la_air_hadoken);	
			sprite_map_add(Action.grab_rope_special_attack, spr_la_grab_rope_hadoken);	
			
			//buster_map_add(spr_x_buster_lv1);
			buster_map_add(spr_x_buster_lv1);
			buster_map_add(spr_x_buster_lv2);
			buster_map_add(spr_x_buster_lv3);
			buster_map_add(spr_ma_buster_lv3);
			
			normal_mask = spr_x_collision_normal_mask;
			lower_mask = spr_x_collision_lower_mask;		
	        break;
		
		case Character.MaxArmor:	
			canAirDash = true;
			chargeLvMax = 5;
			damagedDuration = room_speed / 4;
			invincibleDuration = room_speed * 3 / 2; //90
			sprite_map_add(Action.idle, spr_ma_idle);
			sprite_map_add(Action.climb, spr_ma_climb);
			sprite_map_add(Action.wall_cling, spr_ma_wall_slide);
			sprite_map_add(Action.run, spr_ma_run);
			sprite_map_add(Action.jump, spr_ma_jump_0);
			sprite_map_add(Action.fall, spr_ma_jump_1);
			sprite_map_add(Action.dash, spr_ma_dash);
			sprite_map_add(Action.dash_up, spr_ma_jump_2);
			sprite_map_add(Action.wall_kick, spr_ma_wall_kick);
			sprite_map_add(Action.climb_up, spr_ma_climb_up);
			sprite_map_add(Action.climb_down, spr_ma_climb_down);
			sprite_map_add(Action.grab_ladder, spr_ma_climb_grab);
			sprite_map_add(Action.crouch, spr_ma_crouch);
			sprite_map_add(Action.damaged, spr_ma_damaged);
			sprite_map_add(Action.spawn, spr_x_spawn);
			sprite_map_add(Action.recall, spr_x_recall);
			sprite_map_add(Action.defeat, spr_ma_defeat);
			sprite_map_add(Action.soul_explode, spr_x_soul);	
			sprite_map_add(Action.grab_rope, spr_ma_grab_rope);	
			
			sprite_map_add(Action.attack, spr_ma_stand_shoot);
			sprite_map_add(Action.run_attack, spr_ma_run_shoot);
			sprite_map_add(Action.jump_attack, spr_ma_jump_shoot_0);
			sprite_map_add(Action.fall_attack, spr_ma_jump_shoot_1);
			sprite_map_add(Action.climb_attack, spr_ma_climb_shoot);
			sprite_map_add(Action.wall_cling_attack, spr_ma_wall_slide_shoot);
			sprite_map_add(Action.crouch_attack, spr_ma_crouch_shoot);
			sprite_map_add(Action.dash_attack, spr_ma_dash_shoot);	
			sprite_map_add(Action.grab_rope_attack, spr_ma_grab_rope_shoot);	
			
			sprite_map_add(Action.stand_special_attack, spr_ma_stand_slash);
			sprite_map_add(Action.jump_special_attack, spr_ma_jump_slash);
			sprite_map_add(Action.wall_cling_special_attack, spr_ma_wall_slide_slash);
			sprite_map_add(Action.climb_special_attack, spr_ma_climb_slash);
			sprite_map_add(Action.dash_special_attack, spr_ma_dash_slash);	
			sprite_map_add(Action.grab_rope_special_attack, spr_ma_grab_rope_slash);	
			
			//buster_map_add(spr_x_buster_lv1);
			buster_map_add(spr_x_buster_lv1);
			buster_map_add(spr_x_buster_lv2);
			buster_map_add(spr_x_buster_lv3);
			buster_map_add(spr_ma_buster_lv3);
			buster_map_add(spr_ma_buster_saber_lv4);
			
			//colorMatch[6] = new Color(224,224,224);
			//colorMatch[7] = new Color(152,152,152);	
			//colorMatch[8] = new Color(240,64,16);
			//colorMatch[9] = new Color(128,64,32);	
										
			//colorReplace[6] = new Color(232,224,64);
			//colorReplace[7] = new Color(248,176,128);					
			//colorReplace[8] = new Color(41,82,132);
			//colorReplace[9] = new Color(24,57,90);
			
			normal_mask = spr_x_collision_normal_mask;
			lower_mask = spr_x_collision_lower_mask;		
	        break;
		
		case Character.X:
			chargeLvMax = 3;
			sprite_map_add(Action.idle, spr_x_idle);
			sprite_map_add(Action.climb, spr_x_climb);
			sprite_map_add(Action.wall_cling, spr_x_wall_slide);
			sprite_map_add(Action.run, spr_x_run);
			sprite_map_add(Action.jump, spr_x_jump_0);
			sprite_map_add(Action.fall, spr_x_jump_1);
			sprite_map_add(Action.dash, spr_x_dash);
			sprite_map_add(Action.wall_kick, spr_x_wall_kick);
			sprite_map_add(Action.climb_up, spr_x_climb_up);
			sprite_map_add(Action.climb_down, spr_x_climb_down);
			sprite_map_add(Action.grab_ladder, spr_x_climb_grab);
			sprite_map_add(Action.crouch, spr_x_crouch);
			sprite_map_add(Action.damaged, spr_x_damaged);
			sprite_map_add(Action.spawn, spr_x_spawn);
			sprite_map_add(Action.recall, spr_x_recall);
			sprite_map_add(Action.defeat, spr_x_defeat);
			sprite_map_add(Action.soul_explode, spr_x_soul);	
			sprite_map_add(Action.grab_rope, spr_x_grab_rope);
			
			sprite_map_add(Action.attack, spr_x_stand_shoot);
			sprite_map_add(Action.run_attack, spr_x_run_shoot);
			sprite_map_add(Action.jump_attack, spr_x_jump_shoot_0);
			sprite_map_add(Action.fall_attack, spr_x_jump_shoot_1);
			sprite_map_add(Action.climb_attack, spr_x_climb_shoot);
			sprite_map_add(Action.wall_cling_attack, spr_x_wall_slide_shoot);
			sprite_map_add(Action.wall_kick_attack, spr_x_wall_kick_shoot);
			sprite_map_add(Action.crouch_attack, spr_x_crouch_shoot);
			sprite_map_add(Action.dash_attack, spr_x_dash_shoot);	
			sprite_map_add(Action.grab_rope_attack, spr_x_grab_rope_shoot);
			
			sprite_map_add(Action.stand_special_attack, spr_x_stand_slash);
			sprite_map_add(Action.jump_special_attack, spr_x_jump_slash);
			sprite_map_add(Action.wall_cling_special_attack, spr_x_wall_slide_slash);
			sprite_map_add(Action.climb_special_attack, spr_x_climb_slash);
			sprite_map_add(Action.dash_special_attack, spr_x_dash_slash);	
			sprite_map_add(Action.grab_rope_special_attack, spr_x_grab_rope_slash);
			
			//buster_map_add(spr_x_buster_lv1);
			buster_map_add(spr_x_buster_lv1);
			buster_map_add(spr_x_buster_lv2);
			buster_map_add(spr_x_buster_lv3);
			buster_map_add(spr_x_buster_saber_lv4);
			
			normal_mask = spr_x_collision_normal_mask;
			lower_mask = spr_x_collision_lower_mask;		
	        break;
						
		case Character.Z:			
			sprite_map_add(Action.idle, spr_z_idle);
			sprite_map_add(Action.climb, spr_z_climb);
			sprite_map_add(Action.wall_cling, spr_z_wall_slide);
			sprite_map_add(Action.run, spr_z_run);
			sprite_map_add(Action.jump, spr_z_jump_0);
			sprite_map_add(Action.fall, spr_z_jump_1);
			sprite_map_add(Action.roll, spr_z_jump_2);
			sprite_map_add(Action.dash, spr_z_dash);
			sprite_map_add(Action.wall_kick, spr_z_wall_kick);
			sprite_map_add(Action.climb_up, spr_z_climb_up);
			sprite_map_add(Action.climb_down, spr_z_climb_down);
			sprite_map_add(Action.grab_ladder, spr_z_climb_grab);
			sprite_map_add(Action.crouch, spr_z_crouch);
			sprite_map_add(Action.damaged, spr_z_damaged);
			sprite_map_add(Action.spawn, spr_z_spawn);
			sprite_map_add(Action.recall, spr_z_recall);
			sprite_map_add(Action.defeat, spr_z_defeat);
			sprite_map_add(Action.soul_explode, spr_z_soul);
			sprite_map_add(Action.grab_rope, spr_z_grab_rope);
			
			switch (form) {
				case ZeroForm.Normal:					
					colorReplace[0] = new Color(224,32,0);
					colorReplace[1] = new Color(224,32,0);
					colorReplace[2] = new Color(160,32,0);
					colorReplace[3] = new Color(96,32,0);
					break;
				
			    case ZeroForm.Black:
					damagedDuration = room_speed / 5;
					invincibleDuration = room_speed * 3 / 2; //90
					dashDuration = room_speed * 2 / 3;
			        colorReplace[0] = new Color(72,72,72);
					colorReplace[1] = new Color(72,72,72);
					colorReplace[2] = new Color(52,52,52);
					colorReplace[3] = new Color(32,32,32);	
			        break;
					
			    default:
			        colorReplace[0] = new Color(224,32,0);
					colorReplace[1] = new Color(224,32,0);
					colorReplace[2] = new Color(160,32,0);
					colorReplace[3] = new Color(96,32,0);
			        break;
			}
			
			
			normal_mask = spr_z_collision_normal_mask;
			lower_mask = spr_z_collision_lower_mask;		
			
			
			if(saber == SaberType.X6){
				//Saber Style x4,x5				
				atkMaxCombo = 2;
				sprite_map_add(Action.attack_1, spr_z_stand_slash_0);
				sprite_map_add(Action.attack_2, spr_z_stand_slash_1);
				sprite_map_add(Action.attack_3, spr_z_stand_slash_2);
				sprite_map_add(Action.attack_4, spr_z_stand_slash_3);
				sprite_map_add(Action.jump_attack, spr_z_jump_slash);
				sprite_map_add(Action.roll_attack, spr_z_roll_slash);
				sprite_map_add(Action.climb_attack, spr_z_climb_slash);
				sprite_map_add(Action.wall_cling_attack, spr_z_wall_slide_slash);
				sprite_map_add(Action.crouch_attack, spr_z_crouch_slash);
				sprite_map_add(Action.grab_rope_attack, spr_z_grab_rope_slash);				
			
				
				saber_map_add(Action.attack_1, spr_z_stand_slash_mask_0);
				saber_map_add(Action.attack_2, spr_z_stand_slash_mask_1);
				saber_map_add(Action.attack_3, spr_z_stand_slash_mask_2);
				saber_map_add(Action.attack_4, spr_z_stand_slash_mask_3);
				saber_map_add(Action.jump_attack, spr_z_jump_slash_mask);
				saber_map_add(Action.roll_attack, spr_z_roll_slash_mask);
				saber_map_add(Action.climb_attack, spr_z_climb_slash_mask);
				saber_map_add(Action.wall_cling_attack, spr_z_wall_slide_slash_mask);
				saber_map_add(Action.crouch_attack, spr_z_crouch_slash_mask);
				saber_map_add(Action.grab_rope_attack, spr_z_grab_rope_slash_mask);
			}
			if(saber == SaberType.X4){			
				//Saber Style x4
				atkMaxCombo = 2;
				sprite_map_add(Action.attack_1, spr_z_stand_slash_4);
				sprite_map_add(Action.attack_2, spr_z_stand_slash_5);
				sprite_map_add(Action.attack_3, spr_z_stand_slash_6);
				sprite_map_add(Action.attack_4, spr_z_stand_slash_7);
				sprite_map_add(Action.jump_attack, spr_z_jump_slash_0);
				sprite_map_add(Action.roll_attack, spr_z_roll_slash_0);
				sprite_map_add(Action.climb_attack, spr_z_climb_slash_0);
				sprite_map_add(Action.wall_cling_attack, spr_z_wall_slide_slash_0);
				sprite_map_add(Action.crouch_attack, spr_z_crouch_slash_0);
				sprite_map_add(Action.grab_rope_attack, spr_z_grab_rope_slash_0);				
				
				saber_map_add(Action.attack_1, spr_z_stand_slash_mask_4);
				saber_map_add(Action.attack_2, spr_z_stand_slash_mask_5);
				saber_map_add(Action.attack_3, spr_z_stand_slash_mask_6);
				saber_map_add(Action.attack_4, spr_z_stand_slash_mask_7);
				saber_map_add(Action.jump_attack, spr_z_jump_slash_mask_0);
				saber_map_add(Action.roll_attack, spr_z_roll_slash_mask_0);
				saber_map_add(Action.climb_attack, spr_z_climb_slash_mask_0);
				saber_map_add(Action.wall_cling_attack, spr_z_wall_slide_slash_mask_0);
				saber_map_add(Action.crouch_attack, spr_z_crouch_slash_mask_0);
				saber_map_add(Action.grab_rope_attack, spr_z_grab_rope_slash_mask_0);
			}	
			
			//Skill			
				
				technique_map_add(ZTechnique.FireFist, spr_z_skill_stand_fire_fist);					
				technique_map_add(ZTechnique.DashSlash, spr_z_skill_dash_slash);		
				
				technique_map_add(ZTechnique.ThunderUppercut, spr_z_skill_thunder_uppercut);		
				technique_map_add(ZTechnique.Uppercut, spr_z_skill_uppercut);		
				technique_map_add(ZTechnique.FlameUppercut, spr_z_skill_flame_uppercut);			
				technique_map_add(ZTechnique.IceUppercut, spr_z_skill_ice_uppercut);			
			
				technique_map_add(ZTechnique.AirStab, spr_z_skill_air_stab);		
				technique_map_add(ZTechnique.ThunderStab, spr_z_skill_thunder_stab);		
				technique_map_add(ZTechnique.IceStab, spr_z_skill_ice_stab);		
				technique_map_add(ZTechnique.FlameStab, spr_z_skill_flame_stab);		
			
			//Skill mask
				technique_saber_map_add(ZTechnique.FireFist, spr_z_skill_stand_fire_fist_mask);			
				technique_saber_map_add(ZTechnique.DashSlash, spr_z_skill_dash_slash_mask);
				
				technique_saber_map_add(ZTechnique.ThunderUppercut, spr_z_skill_thunder_uppercut_mask);
				technique_saber_map_add(ZTechnique.Uppercut, spr_z_skill_uppercut_mask);
				technique_saber_map_add(ZTechnique.FlameUppercut, spr_z_skill_flame_uppercut_mask);
				technique_saber_map_add(ZTechnique.IceUppercut, spr_z_skill_ice_uppercut_mask);
			
				technique_saber_map_add(ZTechnique.AirStab, spr_z_skill_air_stab_mask);
				technique_saber_map_add(ZTechnique.ThunderStab, spr_z_skill_thunder_stab_mask);
				technique_saber_map_add(ZTechnique.IceStab, spr_z_skill_ice_stab_mask);
				technique_saber_map_add(ZTechnique.FlameStab, spr_z_skill_flame_stab_mask);
			
			//Skill projectile
			technique_projectile_map_add(ZTechnique.FireFist, spr_z_fire_ball);
			
			
	        break;
	}
}