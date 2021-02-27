function scr_enemy_explosion(){
	if(explodeCount < explodeDuration){
		explodeCount++;
		switch (explodeCount/2 mod 3) {
			case 0:
			    image_alpha = 0.6;
			    break;
					
			case 1:
			    image_alpha = 0.4;
			    break;
					
			case 2:
			    image_alpha = 0.2;
			    break;
		}
		var X = random_range(bbox_left, bbox_right);
		var Y = random_range(bbox_top, bbox_bottom);
		if(explodeCount mod 4 == 0){
			var explosion = instance_create_depth(X, Y, depth - 1, objPlayerWeaponImpact);
			explosion.sprite_index = irandom(1) ? spr_enemy_explosion_1 : spr_enemy_explosion_2;
		}
	}else{			
		image_alpha = 0;
		x = xstart;
		y = ystart;
		state = EnemyState.Dead;	
	}
}