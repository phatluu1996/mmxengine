switch (sprite_index) {
    case spr_z_fire_ball:
        var ex = instance_create_depth(x,y, depth, objPlayerWeaponImpact);
		ex.sprite_index = map_get(weapon_impact_sprite, spr_z_fire_ball);
        break;
}
instance_destroy();
