if(sprite_index == spr_hoganmer_mace){
	dir = point_direction(x, y, user.x + user.image_xscale * 12, user.y - 8 * image_yscale);
	for (var i = 0; i < point_distance(x, y, user.x + user.image_xscale * 12, user.y - 8 * image_yscale); ++i) {
	    if(i mod 10 == 0){
			draw_sprite(spr_hoganmer_chain, 0, x + i * dcos(dir), y + i * -dsin(dir));	
		}
	}
}
draw_self();

