function scr_player_x_attack_buster_shot(spd, xscale,sprite, limit){
	var clingOnSolid = state == PlayerState.WallSlide or state == PlayerState.MovingSolidSlide;
	busterXOffset = x + 18*(clingOnSolid ? -image_xscale : image_xscale);
	if(instance_number(objPlayerWeapon) < limit){
		var shot = instance_create_depth(busterXOffset, busterYOffset, depth, objXBuster);
		shot.hsp = spd * xscale;
		shot.image_xscale = xscale;
		shot.sprite_index = sprite;
	}
}