draw_self();
if(!place_meeting(x + 1, y, objPrtSolid) and !place_meeting(x + 1, y, objSlope)){
	draw_sprite_ext(spr_solid_outline, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);	
}

if(!place_meeting(x - 1, y, objPrtSolid) and !place_meeting(x - 1, y, objSlope)){
	draw_sprite_ext(spr_solid_outline, 3, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);	
}

if(!place_meeting(x, y + 1, objPrtSolid) and !place_meeting(x, y + 1, objSlope)){
	draw_sprite_ext(spr_solid_outline, 2, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

if(!place_meeting(x, y - 1, objPrtSolid) and !place_meeting(x, y - 1, objSlope)){
	draw_sprite_ext(spr_solid_outline, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

if(instance_position(x - sprite_width/2 - 2, y - sprite_height/2 - 2, objPrtSolid) == noone and instance_position(x - sprite_width/2 - 2, y - sprite_height/2 - 2, objSlope) == noone and !top and !left){
	draw_sprite_ext(spr_solid_outline, 4, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);	
}

if(instance_position(x + sprite_width/2 + 2, y - sprite_height/2 - 2, objPrtSolid) == noone and instance_position(x + sprite_width/2 + 2, y - sprite_height/2 - 2, objSlope) == noone and !top and !right){
	draw_sprite_ext(spr_solid_outline, 5, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);	
}

if(instance_position(x - sprite_width/2 - 2, y + sprite_height/2 + 2, objPrtSolid) == noone and instance_position(x - sprite_width/2 - 2, y + sprite_height/2 + 2, objSlope) == noone and !bot and !left){
	draw_sprite_ext(spr_solid_outline, 7, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);	
}

if(instance_position(x + sprite_width/2 + 2, y + sprite_height/2 + 2, objPrtSolid) == noone and instance_position(x + sprite_width/2 + 2, y + sprite_height/2 + 2, objSlope) == noone and !bot and !right){
	draw_sprite_ext(spr_solid_outline, 6, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);	
}
