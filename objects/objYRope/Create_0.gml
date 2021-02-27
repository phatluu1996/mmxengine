if(!instance_position(x, bbox_top - 1, objPrtRope) and !place_meeting(x, y, objPrtRope)){	
	instance_create_depth(x, y - 8, depth - 1, objEndRope);		
}
if(!instance_position(x, bbox_bottom + 1, objPrtRope) and !place_meeting(x, y, objPrtRope)){
	instance_create_depth(x, y + 8, depth - 1, objEndRope);			
}
