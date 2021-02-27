function scr_weapon_buster_step_event(){
	var count = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, objPrtEnemy, false, true, enemy_list, false); //instance_place_list(x, y, objPrtEnemy, enemy_list, false);
	if(count > 0){
		for (var i = 0; i < count; ++i) {
			var enemy = enemy_list[|i];
			if(enemy != noone and enemy.state == EnemyState.Active){		
				var damage = map_get(weapon_damage, sprite_index);
				var isDetroyed = map_get(weapon_destroyable, sprite_index);
				if(!enemy.resist){				
					if(damage <= enemy.hp){	
						if(isDetroyed){
							enemy.hp -= damage;
							var impact = instance_create_depth(enemy.x, y, depth, objPlayerWeaponImpact);
							impact.sprite_index = map_get(weapon_impact_sprite, sprite_index);
							impact.target = enemy;
							enemy.damage = true;
							instance_destroy();
						}else{
							var impact = instance_create_depth(enemy.x, y, depth, objPlayerWeaponImpact);
							impact.sprite_index = map_get(weapon_impact_sprite, sprite_index);
							impact.image_angle = irandom(90);
							if(ds_list_find_index(hit_enemy, enemy.id) == -1){
								enemy.hp -= damage;
								ds_list_add(hit_enemy, enemy.id);
								impact.target = enemy;
								enemy.damage = true;
							}
						}
					}else{
						enemy.hp -= damage;
					}
				}else{
					if(ds_list_find_index(hit_enemy, enemy.id) == -1){
						var impact = instance_create_depth(image_xscale > 0 ? bbox_right : bbox_left, y, depth, objPlayerWeaponImpact);
						impact.sprite_index = map_get(weapon_block_sprite, sprite_index);
						ds_list_add(hit_enemy, enemy.id);
						if(isDetroyed){
							instance_destroy();
						}
					}
				}
			}
		}
	}
	
}