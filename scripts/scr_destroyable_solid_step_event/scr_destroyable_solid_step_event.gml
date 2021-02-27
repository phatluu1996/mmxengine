function scr_destroyable_solid_step_event(){
	switch (state) {
	    case EnemyState.Active:
	        var buster = instance_place(x, y, objXBuster);
			if(buster >= 0 and hp > 0){
				if((buster.x > x and buster.x >= bbox_left) or (buster.x < x and buster.x <= bbox_right)){
					var wp_damage = map_get(buster.weapon_damage, buster.sprite_index);
					var isDetroyed = map_get(buster.weapon_destroyable, buster.sprite_index);
					if(!resist){	
						if(ds_list_find_index(buster_list, buster) == -1){
							ds_list_add(buster_list, buster);
							hp -= wp_damage;
							var impact = instance_create_depth(x > buster.x ? bbox_left : bbox_right, buster.y, depth - 1, objPlayerWeaponImpact);
							impact.sprite_index = map_get(buster.weapon_impact_sprite, buster.sprite_index);
							impact.target = id;
							show_debug_message(hp);
						}
			
						if(isDetroyed){	
							if(hp > 0){
								instance_destroy(buster);	
							}
						}
					}else{
						var impact = instance_create_depth(x > buster.x ? bbox_left : bbox_right, buster.y, depth - 1, objPlayerWeaponImpact);
						impact.sprite_index = map_get(buster.weapon_block_sprite, buster.sprite_index);
						instance_destroy(buster);
					}		
				}
			}
			
			var saber = instance_place(x, y, objZSaber);
			if(saber >= 0){
				var wp_damage = map_get(saber.weapon_damage, saber.sprite_index);
				
				if(ds_list_find_index(saber_list, saber) == -1){
					if(!resist) hp -= wp_damage;
					ds_list_add(saber_list, saber);						
				}					
				
				var impact = instance_create_depth(x > saber.x ? bbox_left : bbox_right, random_range((bbox_top + y)/2 ,(bbox_bottom + y)/2), depth - 100, objPlayerWeaponImpact);
				impact.sprite_index = map_get(!resist ? saber.weapon_impact_sprite : saber.weapon_block_sprite, saber.sprite_index);
				impact.target = id;
				impact.image_angle = random(180);
			}
			
			if(hp <= 0){
				state = EnemyState.Explode;
			}
	        break;
			
		case EnemyState.Explode:
			scr_destroyable_solid_explode();	
			break;
		
	    default:
	        // code here
	        break;
	}
	
	
	
	
}