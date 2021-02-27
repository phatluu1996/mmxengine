event_inherited();
if(state == EnemyState.Dead){
	sprite_index = spr_cannon_dead;
	//visible = true;
	image_alpha = 1;
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
}
