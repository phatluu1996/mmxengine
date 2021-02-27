if(!instance_position(bbox_right + 1, y, objPrtRope) and !place_meeting(x, y, objPrtRope)){	
	var stop = instance_create_depth(bbox_right, y, depth - 1, objEndRope);
	
}
if(!instance_position(bbox_left - 1, y, objPrtRope) and !place_meeting(x, y, objPrtRope)){
	var stop = instance_create_depth(bbox_left, y, depth - 1, objEndRope);			
}
