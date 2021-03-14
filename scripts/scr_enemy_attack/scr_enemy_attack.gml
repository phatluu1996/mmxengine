function scr_catter_killer_blaster_shoot(vdir){
	var shot = instance_create_depth(x + image_xscale * 23, y + vdir * 10, depth, objPrtEnemyWeapon);
	shot.sprite_index = spr_ck_blaster_shot;
	shot.image_xscale = image_xscale;
	shot.hsp = image_xscale * 3;
	shot.vsp = vdir * 2;
	shot.damageToPlayer = 1;
}

function scr_dodge_blaster_shoot(){
	var shot = instance_create_depth(x + image_xscale * 23, y, depth, objPrtEnemyWeapon);
	shot.sprite_index = spr_db_blaster_shot;
	shot.image_xscale = image_xscale;
	shot.hsp = image_xscale * 3;
	shot.damageToPlayer = 1;
}

function scr_ride_armor_solider_shoot_rocket(X, Y){
	var shot = instance_create_depth(X, Y, depth-100, objPrtEnemyWeapon);
	shot.sprite_index = spr_ras_rocket;				
	shot.damageToPlayer = 1;
	var spd = 3;
	var dir = point_direction(shot.x, shot.y, objPrtPlayer.x, objPrtPlayer.y);
	//var distance = point_distance(shot.x, shot.y, objPrtPlayer.x, objPrtPlayer.y);
	shot.hsp = dcos(dir) * spd;
	shot.vsp = sqrt(spd * spd - shot.hsp * shot.hsp)*(shot.y > objPrtPlayer.y ? -1 : 1);
	shot.image_xscale = image_xscale;
}

function scr_gun_volt_shoot(X, Y, type){
	if(type){
		var shot = instance_create_depth(X, Y, depth, objPrtEnemyWeapon);
		shot.sprite_index = spr_gv_missile;
		shot.image_xscale = image_xscale;
		shot.hsp = image_xscale * 4;
		shot.damageToPlayer = 1;
	}else{
		var shot = instance_create_depth(X, Y, depth, objPrtEnemyWeapon);
		shot.sprite_index = spr_gv_elec_orb;
		shot.image_xscale = image_xscale;
		shot.hsp = image_xscale * 6;
		shot.damageToPlayer = 1;	
	}
}

function scr_hoganmer_attack(){
	var shot = instance_create_depth(x + image_xscale * 10, y - 8, depth-100, objPrtEnemyWeapon);
	shot.sprite_index = spr_hoganmer_mace;				
	shot.damageToPlayer = 2;
	var spd = 3;
	var dist = point_distance(shot.x, shot.y, objPrtPlayer.x, objPrtPlayer.y);	
	dist = dist > 160 ? 160 : dist;
	var dir = point_direction(shot.x, shot.y, objPrtPlayer.x, objPrtPlayer.y);	
	shot.hsp = dcos(dir) * spd;
	shot.vsp = sqrt(spd * spd - shot.hsp * shot.hsp)*(shot.y > objPrtPlayer.y ? -1 : 1);
	shot.count = abs(dist / spd);
	shot.prev_hsp = -shot.hsp;
	shot.prev_vsp = -shot.vsp;
	shot.image_xscale = 1.4;
	shot.image_yscale = 1.4;
	count = shot.count * 2 + 61;
	shot.user = id;
}

function scr_ice_guy_shoot(){
	var shot = instance_create_depth(x + image_xscale * 27, y - 13, depth-1, objPrtEnemyWeapon);
	shot.sprite_index = spr_ice_guy_ice_shot;				
	shot.damageToPlayer = 2;
	shot.hsp = image_xscale * 6;
}

function scr_fire_guy_shoot(){
	var shot = instance_create_depth(x + image_xscale * 27, y - 13, depth-1, objPrtEnemyWeapon);
	shot.sprite_index = spr_fire_guy_flame;
	shot.image_xscale = image_xscale;
	shot.damageToPlayer = 2;
	shot.user = id;
}

function scr_ball_axe_attack(){
	var shot = instance_create_depth(x + image_xscale * 26, y + 33, depth-1, objPrtEnemyWeapon);
	shot.sprite_index = spr_ball_axe_mace;				
	shot.damageToPlayer = 2;
	shot.vsp = 3.5;
	
}

function scr_helit_attack(X, Y){
	var shot = instance_create_depth(X, Y, depth-1, objPrtEnemyWeapon);
	shot.sprite_index = spr_helit_rocket;				
	shot.damageToPlayer = 1;
	var spd = 3;
	var dir = point_direction(shot.x, shot.y, objPrtPlayer.x, objPrtPlayer.y);
	shot.image_angle = dir; 
	//var distance = point_distance(shot.x, shot.y, objPrtPlayer.x, objPrtPlayer.y);
	shot.hsp = dcos(dir) * spd;
	shot.vsp = sqrt(spd * spd - shot.hsp * shot.hsp)*(shot.y > objPrtPlayer.y ? -1 : 1);
	//shot.image_xscale = image_xscale;	
}

function scr_cannon_shoot(){
	var shot = instance_create_depth(x + image_xscale * 30, y - 8, depth-100, objPrtEnemyWeapon);
	shot.sprite_index = spr_cannon_bullet;				
	shot.damageToPlayer = 2;
	shot.hsp = image_xscale * 3.5;	
	shot.image_xscale = image_xscale;
}