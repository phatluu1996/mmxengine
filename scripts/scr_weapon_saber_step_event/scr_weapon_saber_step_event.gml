function scr_weapon_saber_step_event(){
	var count = instance_place_list(x, y, objPrtEnemy, enemy_list, true);
	if(count > 0){
		for (var i = 0; i < count; ++i) {
			var enemy = enemy_list[|i];			
			var damage = map_get(weapon_damage, sprite_index);
			if(enemy.state == EnemyState.Active){			
				enemy.damage = true;				
				if(!enemy.resist){
					if(ds_list_find_index(hit_enemy, enemy.id) == -1){
						enemy.hp -= damage;
						ds_list_add(hit_enemy, enemy.id);						
					}
				}else{
					if(ds_list_find_index(hit_enemy, enemy.id) == -1){
						ds_list_add(hit_enemy, enemy.id);						
					}
				}
				if(instance_number(objPlayerWeaponImpact) < 1){					
					var impact = instance_create_depth(enemy.x > x ? enemy.bbox_left : enemy.bbox_right, random_range((enemy.bbox_top + enemy.y)/2 ,(enemy.bbox_bottom + enemy.y)/2), depth, objPlayerWeaponImpact);
					impact.sprite_index = map_get(!enemy.resist ? weapon_impact_sprite : weapon_block_sprite, sprite_index);
					impact.target = enemy;
					impact.image_angle = random(180);
				}
			}
		}
	}
	
}