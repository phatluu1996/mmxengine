function scr_enemy_state_damage(){
	var buster = instance_place(x, y, objXBuster);
	if(buster >= 0){
		var wp_damage = map_get(buster.weapon_damage, buster.sprite_index);
		var isDetroyed = map_get(buster.weapon_destroyable, buster.sprite_index);
		if(!resist){			
			damage = true;
			if(ds_list_find_index(buster_list, buster) == -1){
				ds_list_add(buster_list, buster);
				hp -= wp_damage;
				var impact = instance_create_depth(x, buster.y, depth - 1, objPlayerWeaponImpact);
				impact.sprite_index = map_get(buster.weapon_impact_sprite, buster.sprite_index);
				impact.target = id;
			}
			
			if(isDetroyed){	
				if(hp > 0){
					instance_destroy(buster);	
				}
			}
		}else{
			var impact = instance_create_depth(buster.image_xscale > 0 ? buster.bbox_right : buster.bbox_left, buster.y, depth - 1, objPlayerWeaponImpact);
			impact.sprite_index = map_get(buster.weapon_block_sprite, buster.sprite_index);
			instance_destroy(buster);
		}		
	}
	
	var saber = instance_place(x, y, objZSaber);
	if(saber >= 0){
		var wp_damage = map_get(saber.weapon_damage, saber.sprite_index);				
		if(ds_list_find_index(saber_list, saber) == -1){
			ds_list_add(saber_list, saber);	
			if(!resist){	
				damage = true;
				hp -= wp_damage;	
			}
		}
		
		if(instance_number(objPlayerWeaponImpact) < 1){					
			var impact = instance_create_depth(x > saber.x ? bbox_left : bbox_right, random_range((bbox_top + y)/2 ,(bbox_bottom + y)/2), depth - 100, objPlayerWeaponImpact);
			impact.sprite_index = map_get(!resist ? saber.weapon_impact_sprite : saber.weapon_block_sprite, saber.sprite_index);
			impact.target = id;
			impact.image_angle = random(180);
		}		
	}
	
	
	if(damage){
		if(damageCount <= damageDuration){
			damageCount++;
			switch (damageCount/2 mod 3) {
			    case 0:
			        image_alpha = 1;
			        break;
					
				case 1:
			        image_alpha = 0.5;
			        break;
					
				case 2:
			        image_alpha = 0.5;
			        break;
			}
		}else{
			damageCount = 0;	
			damage = false;
			image_alpha = 1;
		}
	}	
	
	if(hp <= 0){
		state = EnemyState.Explode;	
	}
}