if(global.paused){  
	image_speed = 0;	
	exit;
}else{
	image_speed = 1;		
}
switch (sprite_index) {
    case spr_x_buster_impact_lv1:
	case spr_x_buster_impact_lv2:
	case spr_x_buster_impact_lv3:
        break;
		
	case spr_x_buster_saber_impact_lv4:
		var time = sprite_get_number(spr_x_buster_saber_impact_lv4)*room_speed/sprite_get_speed(spr_x_buster_saber_impact_lv4);
		if(target != noone and object_get_parent(target) != objDestroyableSolid and target.state == EnemyState.Active){			
			x = target.x;
			y = target.bbox_top + (target.bbox_bottom - target.bbox_top)/2;
			if(damageCount mod round(time/4) == 0 or damageCount == 0){
				//show_debug_message("!!");
				target.hp-=1;
			}
			damageCount++;
		}else{
			instance_destroy();	
		}
		break;
	
    default:
        // code here
        break;
}
if(last_frame()){
	instance_destroy();	
}
