function scr_enemy_init(){
	scr_view_camera_variables();
	
	enum EnemyState {
		Dead,
		Spawn,
		Deactive,
		Active,
		Explode,
		OutsideView
	}
	hp = 10;
	hsp = 0;
	vsp = 0;
	gravSpd = 0.25;
	
	runSpd = 0; //Will be overrided
	jumpSpd = 0; //Will be overrided
	
	resist = false;
	state = scr_enemy_inside_view() ? EnemyState.Active : EnemyState.Deactive;
	
	explodeCount = 0;
	explodeDuration = 20;
	
	damageCount = 0;
	damageDuration = 4;
	patrolCount = 0;
	
	jumpCount = 0;
	
	shootCount = 30;
	
	count = 0;
	
	damage = false;
	
	damageToPlayer = 3;
	
	action = "";
	dir = 1;
	
	patrol_hdir = 1;
	patrol_vdir = 1;
	
	on = false;
	
	buster_list = ds_list_create();
	saber_list = ds_list_create();
}