function scr_destroyable_solid_init(){
	hp = 6;
	resist = false;

	buster_list = ds_list_create();
	saber_list = ds_list_create();

	explodeCount = 0;
	explodeDuration = 60;
	
	state = EnemyState.Active;
}