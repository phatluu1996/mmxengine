function scr_boss_init(){
	hp = 48;
	enum BossState{
		Deactive,
		Intro,
		Active,
		Explode
	}

	state = BossState.Deactive;

	hsp = 0;
	vsp = 0;
	gravSpd = 0.25;

	buster_list = ds_list_create();
	saber_list = ds_list_create();

	damageToPlayer = 3;

	explodeDuration = 240;
	explodeCount = 0;
}