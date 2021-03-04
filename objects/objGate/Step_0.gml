if(!open){
	if(canOpen){
		image_index = 0;	
	}else{		
		mask_index = spr_door_mask;
		sprite_index = spr_door_close;
		if(last_frame()){
			image_index = image_number - 1;						
		}	
	}
}else{
	mask_index = spr_door_empty_mask;
	if(last_frame()){
		image_index = image_number - 1;	
	}
}