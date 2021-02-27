function scr_player_state_move_on_slope(){
	var bbox_side = (hsp > 0) ? bbox_right : bbox_left;
	var side_top = [bbox_side, bbox_top];
	var side_bottom = [bbox_side, bbox_bottom];
	var side_middle = [bbox_side, y];

	onSlope = collision_point(x, bbox_bottom + 1, objSlope, true, true) != noone;

	for (var i = 0; i < abs(hsp); i++) {
	  x += sign(hsp);
  
	  if (collision_point(x, bbox_bottom, objSlope, true, true) != noone) {
	    y -= 1;
	    onSlope = true;
	  } 
  
	  if (onSlope) {
	    var points = [side_top, side_middle];
    
	    for (var j = 0; j < array_length_1d(points); j++) {
	      var point = points[j];
	      var col_x = point[0];
	      var col_y = point[1];
      
	      if (collision_point(col_x, col_y, objPrtSolid, true, true) != noone) {
	        x -= sign(hsp);
	        break;
	      }
	    }
	  } else if (place_meeting(x, y, objPrtSolid)) {
	    x -= sign(hsp);
	    break;
	  }
	}

	for (var i = 0; i < abs(vsp); i++) {
	  y += sign(vsp);
  
	  if (collision_point(x, bbox_bottom, objSlope, true, true) != noone) {
	    y -= 1;
	    onSlope = true;
	    break;
	  } 
  
	  if (onSlope && vsp > 0) {
	    if (collision_point(x, bbox_bottom, objPrtSolid, true, true) != noone) {
	      y -= sign(vsp);
	      break;
	    }
	  } else if (onSlope && vsp < 0) {
	    var points = [[bbox_left, bbox_top], [bbox_right, bbox_top], [x, bbox_top]];
    
	    for (var j = 0; j < array_length_1d(points); j++) {
	      var point = points[j];
	      var col_x = point[0];
	      var col_y = point[1];
      
	      if (collision_point(col_x, col_y, objPrtSolid, true, true) != noone) {
	        y -= sign(hsp);
	        break;
	      }
	    }
	  } else if (place_meeting(x, y, objPrtSolid)) {
	    y -= sign(vsp);
	    break;
	  }
	}


	onSlope = collision_point(x, bbox_bottom + 1, objSlope, true, true) != noone;

	if (!onSlope) {
	  while (place_meeting(x, y, objPrtSolid)) {
	    y -= 1;
	  }
	}
}