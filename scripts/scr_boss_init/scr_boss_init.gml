function scr_boss_init(){
	maxHp = 48;
	hp = 0;
	prev_hp = 0;
	
	enum BossState{
		Deactive,
		Intro,
		Active,
		Explode
	}

	state = BossState.Deactive;
	action = "";

	hsp = 0;
	vsp = 0;
	gravSpd = 0.25;

	buster_list = ds_list_create();
	saber_list = ds_list_create();

	damageToPlayer = 3;

	explodeDuration = 240;
	explodeCount = 0;
	
	count = 0;
	
	damage = false;
}

