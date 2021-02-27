function scr_enemy_state_machine(){
	scr_view_camera_variables();
	if(global.paused){  
		image_speed = 0;	
		exit;
	}else{
		image_speed = 1;		
	}	
	switch (state) {
		case EnemyState.Explode:		
			scr_enemy_explosion();
			break;
	
		case EnemyState.Deactive:
		    if(scr_enemy_inside_view()){				
				state = EnemyState.Spawn;	
			}
			break;
			
		case EnemyState.OutsideView:
			if(!scr_enemy_inside_view()){
				state = EnemyState.Deactive;		
			}
			break;
	
		case EnemyState.Active:	
			if(scr_enemy_inside_view()){				
				scr_enemy_step_event();		
			}else{	
				x = xstart;
				y = ystart;
				visible = false;
				state = EnemyState.OutsideView;
			}
			break;
		
		case EnemyState.Dead:
			if(!scr_enemy_inside_view()){
				state = EnemyState.Deactive;	
			}
			break;
		
		case EnemyState.Spawn:
			instance_deactivate_object(id);
			inst = instance_create_depth(xstart, ystart, depth, object_index);
			inst.image_xscale = image_xscale;			
			break;
	}
}