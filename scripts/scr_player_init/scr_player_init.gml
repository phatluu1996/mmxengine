function scr_player_init(){	
	Color = function(r,g,b) constructor {
		red = r;
		blue = b;
		green = g;
		
		static toShaderValue = function(value){
			return value/255;	
		}
	};
	
	//Global Variable
	global.paused = false;
	global.bossStart = false;
	
	depth = layer_get_depth(layer);
	y = ystart - camera_get_view_height(view_camera[0]) * 2;	
	current_section = instance_place(xstart, ystart, objSection);	
	camera_lock_y = true;
	camera_lock_x = true;
	viewx = current_section.x;
	viewy = current_section.y;
	next_x = 0;
	next_y = 0;
	camera_set_view_pos(view_camera[0], viewx, viewy);
	
	state = PlayerState.Begin;	
	hsp = 0;
	vsp = 0;	
	hyperJump = false;	
	runSpd = 1.35;
	jumpSpd = 5.25;
	gravSpd = 0.25;
	dashSpd = 3.5;
	wallSpd = 0.7;
	climbSpd = 1.35;
	teleSpd = 8;
	sideMovingPlatform = noone;
	
	readyCount = 180;
	transitionCount = 0;
	
	dashCount = 0;
	dashDuration = room_speed/2;
	
	wallJumpCount = 0;
	wallJumpDir = image_xscale;
	wallJumpDuration = room_speed/6;
	
	damagedCount = 0;
	invincibleDuration = room_speed * 5 / 4; //75
	damagedDuration = invincibleDuration * 2 / 5;
	
	defeatCount = 0;
	defeatDuration = room_speed * 5;
	
	chargeLv = 0;
	chargeCount = 0;
	chargeCountLimit = room_speed / 6;//room_speed * 3 / 4;
	chargeSprite = spr_x_charge_aura_lv1;
	shootCount = 0;
	shootDuration = room_speed / 4;
	busterXOffset = 0;
	busterYOffset = 0;
	
	climbDir = 0;	
	atkIndex = 0;	
	normalAtk = false;
	specialShoot = false;	
	normalShoot = false;
	
	saber_mask = noone;
	technique = ZTechnique.None;
	element = ZElement.Normal;
	
	airDash = false;
	airJump = false;	
	
	energyLimit = 16;
	energy_prev = energyLimit;
	energy = energyLimit;
	period = 0;	
		
	saber_sprite = ds_map_create(); //Zero melee atk
	technique_saber_sprite = ds_map_create();//Zero technique atk
	technique_projectile_sprite = ds_map_create();//Zero projectile atk map
	player_sprite = ds_map_create(); // Player sprite
	buster_sprite = ds_list_create(); //X buster sprite
	scr_player_sprites_mapping(character);		
	scr_player_color_palette_init();	
	scr_player_weapon_init();	
	
	particle_sys = part_system_create();
	particle_fade = part_type_create();
	part_type_size(particle_fade, 1, 1, 0, 0);
	part_type_life(particle_fade, 20, 20);
	part_type_alpha3(particle_fade, 0.5, 0.3, 0.1);
	main_color = colorReplace[0];
	part_type_color_rgb(particle_fade,main_color.red, main_color.red, main_color.green,main_color.green, main_color.blue,main_color.blue);
	
	
	isZero = character == Character.Z;
}