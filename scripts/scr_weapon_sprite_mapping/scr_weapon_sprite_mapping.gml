function scr_weapon_sprite_mapping(){
	weapon_impact_sprite = ds_map_create();
	weapon_block_sprite = ds_map_create();
	weapon_damage = ds_map_create();
	weapon_destroyable = ds_map_create();

	//Hit sprite
	ds_map_add(weapon_impact_sprite, spr_x_buster_lv1, spr_x_buster_impact_lv1);
	ds_map_add(weapon_impact_sprite, spr_x_buster_lv2, spr_x_buster_impact_lv2);
	ds_map_add(weapon_impact_sprite, spr_x_buster_lv3, spr_x_buster_impact_lv3);
	ds_map_add(weapon_impact_sprite, spr_ma_buster_lv3, spr_x_buster_impact_lv3);

	ds_map_add(weapon_impact_sprite, spr_la_buster_lv4, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite, spr_x_buster_saber_lv4, spr_x_buster_saber_impact_lv4);
	ds_map_add(weapon_impact_sprite, spr_ma_buster_saber_lv4, spr_x_buster_saber_impact_lv4);
	
	ds_map_add(weapon_impact_sprite,spr_z_climb_slash_mask_0, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_climb_slash_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_crouch_slash_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_crouch_slash_mask_0, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_jump_slash_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_jump_slash_mask_0, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_roll_slash_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_roll_slash_mask_0, spr_z_saber_impact);	
	ds_map_add(weapon_impact_sprite,spr_z_stand_slash_mask_0, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_stand_slash_mask_1, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_stand_slash_mask_2, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_stand_slash_mask_3, spr_z_saber_impact);	
	ds_map_add(weapon_impact_sprite,spr_z_stand_slash_mask_4, spr_z_saber_impact);	
	ds_map_add(weapon_impact_sprite,spr_z_stand_slash_mask_5, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_stand_slash_mask_6, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_stand_slash_mask_7, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_wall_slide_slash_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_wall_slide_slash_mask_0, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_grab_rope_slash_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_grab_rope_slash_mask_0, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_skill_stand_fire_fist_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_fire_ball, spr_enemy_explosion_1);
	ds_map_add(weapon_impact_sprite,spr_z_skill_dash_slash_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_skill_thunder_uppercut_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_skill_uppercut_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_skill_flame_uppercut_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_skill_ice_uppercut_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_skill_air_stab_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_skill_thunder_stab_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_skill_ice_stab_mask, spr_z_saber_impact);
	ds_map_add(weapon_impact_sprite,spr_z_skill_flame_stab_mask, spr_z_saber_impact);
	

	//Block sprite
	ds_map_add(weapon_block_sprite, spr_x_buster_lv1, spr_x_buster_block_lv1);
	ds_map_add(weapon_block_sprite, spr_x_buster_lv2, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite, spr_x_buster_lv3, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite, spr_ma_buster_lv3, spr_x_buster_block_lv3);

	ds_map_add(weapon_block_sprite, spr_x_buster_saber_lv4, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite, spr_la_buster_lv4, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite, spr_ma_buster_saber_lv4, spr_x_buster_saber_block_lv4);
	
	ds_map_add(weapon_block_sprite,spr_z_climb_slash_mask_0, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_climb_slash_mask, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_crouch_slash_mask, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_crouch_slash_mask_0, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_jump_slash_mask, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_jump_slash_mask_0, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_roll_slash_mask, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_roll_slash_mask_0, spr_x_buster_block_lv2);	
	ds_map_add(weapon_block_sprite,spr_z_stand_slash_mask_0, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_stand_slash_mask_1, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_stand_slash_mask_2, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_stand_slash_mask_3, spr_x_buster_block_lv2);	
	ds_map_add(weapon_block_sprite,spr_z_stand_slash_mask_4, spr_x_buster_block_lv2);	
	ds_map_add(weapon_block_sprite,spr_z_stand_slash_mask_5, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_stand_slash_mask_6, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_stand_slash_mask_7, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_wall_slide_slash_mask, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_wall_slide_slash_mask_0, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_grab_rope_slash_mask, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_grab_rope_slash_mask_0, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_skill_stand_fire_fist_mask, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_fire_ball, spr_x_buster_block_lv2);
	ds_map_add(weapon_block_sprite,spr_z_skill_dash_slash_mask, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite,spr_z_skill_thunder_uppercut_mask, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite,spr_z_skill_uppercut_mask, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite,spr_z_skill_flame_uppercut_mask, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite,spr_z_skill_ice_uppercut_mask, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite,spr_z_skill_air_stab_mask, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite,spr_z_skill_thunder_stab_mask, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite,spr_z_skill_ice_stab_mask, spr_x_buster_block_lv3);
	ds_map_add(weapon_block_sprite,spr_z_skill_flame_stab_mask, spr_x_buster_block_lv3);

	//Destroy when hit enemy
	ds_map_add(weapon_destroyable, spr_x_buster_lv1, true);
	ds_map_add(weapon_destroyable, spr_x_buster_lv2, true);
	ds_map_add(weapon_destroyable, spr_x_buster_lv3, true);
	ds_map_add(weapon_destroyable, spr_ma_buster_lv3, true);

	ds_map_add(weapon_destroyable, spr_x_buster_saber_lv4, true);
	ds_map_add(weapon_destroyable, spr_la_buster_lv4, false);
	ds_map_add(weapon_destroyable, spr_ma_buster_saber_lv4, false);
	
	ds_map_add(weapon_destroyable,spr_z_climb_slash_mask_0, false);
	ds_map_add(weapon_destroyable,spr_z_climb_slash_mask, false);
	ds_map_add(weapon_destroyable,spr_z_crouch_slash_mask, false);
	ds_map_add(weapon_destroyable,spr_z_crouch_slash_mask_0, false);
	ds_map_add(weapon_destroyable,spr_z_jump_slash_mask, false);
	ds_map_add(weapon_destroyable,spr_z_jump_slash_mask_0, false);
	ds_map_add(weapon_destroyable,spr_z_roll_slash_mask, false);
	ds_map_add(weapon_destroyable,spr_z_roll_slash_mask_0, false);	
	ds_map_add(weapon_destroyable,spr_z_stand_slash_mask_0, false);
	ds_map_add(weapon_destroyable,spr_z_stand_slash_mask_1, false);
	ds_map_add(weapon_destroyable,spr_z_stand_slash_mask_2, false);
	ds_map_add(weapon_destroyable,spr_z_stand_slash_mask_3, false);	
	ds_map_add(weapon_destroyable,spr_z_stand_slash_mask_4, false);	
	ds_map_add(weapon_destroyable,spr_z_stand_slash_mask_5, false);
	ds_map_add(weapon_destroyable,spr_z_stand_slash_mask_6, false);
	ds_map_add(weapon_destroyable,spr_z_stand_slash_mask_7, false);
	ds_map_add(weapon_destroyable,spr_z_wall_slide_slash_mask, false);
	ds_map_add(weapon_destroyable,spr_z_wall_slide_slash_mask_0, false);
	ds_map_add(weapon_destroyable,spr_z_grab_rope_slash_mask, false);
	ds_map_add(weapon_destroyable,spr_z_grab_rope_slash_mask_0, false);
	ds_map_add(weapon_destroyable,spr_z_skill_stand_fire_fist_mask, false);
	ds_map_add(weapon_destroyable,spr_z_fire_ball, true);
	ds_map_add(weapon_destroyable,spr_z_skill_dash_slash_mask, false);
	ds_map_add(weapon_destroyable,spr_z_skill_thunder_uppercut_mask, false);
	ds_map_add(weapon_destroyable,spr_z_skill_uppercut_mask, false);
	ds_map_add(weapon_destroyable,spr_z_skill_flame_uppercut_mask, false);
	ds_map_add(weapon_destroyable,spr_z_skill_ice_uppercut_mask, false);
	ds_map_add(weapon_destroyable,spr_z_skill_air_stab_mask, false);
	ds_map_add(weapon_destroyable,spr_z_skill_thunder_stab_mask, false);
	ds_map_add(weapon_destroyable,spr_z_skill_ice_stab_mask, false);
	ds_map_add(weapon_destroyable,spr_z_skill_flame_stab_mask, false);

	//Damage
	ds_map_add(weapon_damage, spr_x_buster_lv1, 1);
	ds_map_add(weapon_damage, spr_x_buster_lv2, 2);
	ds_map_add(weapon_damage, spr_x_buster_lv3, 3);
	ds_map_add(weapon_damage, spr_ma_buster_lv3, 3);

	ds_map_add(weapon_damage, spr_x_buster_saber_lv4, 3);
	ds_map_add(weapon_damage, spr_la_buster_lv4, 4);
	ds_map_add(weapon_damage, spr_ma_buster_saber_lv4, 4);
	
	ds_map_add(weapon_damage,spr_z_climb_slash_mask_0, 2);
	ds_map_add(weapon_damage,spr_z_climb_slash_mask, 2);
	ds_map_add(weapon_damage,spr_z_crouch_slash_mask, 1);
	ds_map_add(weapon_damage,spr_z_crouch_slash_mask_0, 1);	
	ds_map_add(weapon_damage,spr_z_jump_slash_mask, 2);
	ds_map_add(weapon_damage,spr_z_jump_slash_mask_0, 2);
	ds_map_add(weapon_damage,spr_z_roll_slash_mask, 2);
	ds_map_add(weapon_damage,spr_z_roll_slash_mask_0, 2);	
	ds_map_add(weapon_damage,spr_z_stand_slash_mask_0, 1);
	ds_map_add(weapon_damage,spr_z_stand_slash_mask_1, 1);
	ds_map_add(weapon_damage,spr_z_stand_slash_mask_2, 2);
	ds_map_add(weapon_damage,spr_z_stand_slash_mask_3, 3);	
	ds_map_add(weapon_damage,spr_z_stand_slash_mask_4, 1);	
	ds_map_add(weapon_damage,spr_z_stand_slash_mask_5, 1);
	ds_map_add(weapon_damage,spr_z_stand_slash_mask_6, 2);
	ds_map_add(weapon_damage,spr_z_stand_slash_mask_7, 3);
	ds_map_add(weapon_damage,spr_z_wall_slide_slash_mask, 2);
	ds_map_add(weapon_damage,spr_z_wall_slide_slash_mask_0, 2);
	ds_map_add(weapon_damage,spr_z_grab_rope_slash_mask, 2);
	ds_map_add(weapon_damage,spr_z_grab_rope_slash_mask_0, 2);
	
	ds_map_add(weapon_damage,spr_z_skill_stand_fire_fist_mask, 2);
	ds_map_add(weapon_damage,spr_z_fire_ball, 4);
	ds_map_add(weapon_damage,spr_z_skill_dash_slash_mask, 4);
	ds_map_add(weapon_damage,spr_z_skill_thunder_uppercut_mask, 4);
	ds_map_add(weapon_damage,spr_z_skill_uppercut_mask, 4);
	ds_map_add(weapon_damage,spr_z_skill_flame_uppercut_mask, 4);
	ds_map_add(weapon_damage,spr_z_skill_ice_uppercut_mask, 4);
	ds_map_add(weapon_damage,spr_z_skill_air_stab_mask, 4);
	ds_map_add(weapon_damage,spr_z_skill_thunder_stab_mask, 4);
	ds_map_add(weapon_damage,spr_z_skill_ice_stab_mask, 4);
	ds_map_add(weapon_damage,spr_z_skill_flame_stab_mask, 4);
}