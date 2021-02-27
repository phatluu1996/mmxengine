function scr_enemy_collision_movement(){
	//Horizone	
	if (place_meeting(x+hsp,y,objSlope)){
	    //Up slope
	    var yplus=0;
	    while(place_meeting(x+hsp,y-yplus,objSlope) && yplus<=3*abs(hsp)) yplus+=1; //change the abs(hsp) to 3*abs(hsp) if you want to be able to go up a 3-1 slope, etc..
	    if(place_meeting(x+hsp,y-yplus,objSlope)){
	        while(!place_meeting(x+sign(hsp),y,objSlope)) x += sign(hsp);
	        hsp=0;
	    }else{
	        y-=yplus;
	    }
	}
	
	var sideSolid = instance_place(x + hsp, y, objPrtSolid);
	if sideSolid >= 0 and hsp != 0 {
		var maxDist = 1000;
		while(!place_meeting(x + sign(hsp),y, sideSolid) and maxDist > 0){
			x += sign(hsp);	
			maxDist--;
		}		
		hsp = 0;
	}
	x+=hsp;
	
	//Vertical
	//Down slope
	if(!place_meeting(x,y,objSlope) and vsp >= 0 and (place_meeting(x,y+2+abs(hsp),objSlope) or place_meeting(x,y+2+abs(hsp),objPrtSolid))){
	    while(!place_meeting(x,y+1,objSlope) and !place_meeting(x,y+1,objPrtSolid)) y += 1;
	}

	//Vertical Collisions Slope
	if (place_meeting(x,y+vsp,objSlope)){
		if vsp >= 0 {
			while(!place_meeting(x, y + sign(vsp), objSlope)) y += 1;
			vsp=0;						
		}else{
			while(!place_meeting(x, y + sign(vsp), objSlope)) y -= 1;	
			vsp = 0;
		}		
	}
	
	var bottomSolid = instance_place(x, y + vsp, objPrtSolid);
	if bottomSolid >= 0 {		
		if vsp >= 0 {
			while(!place_meeting(x , y + sign(vsp), bottomSolid)) y += 1;	
			vsp = 0;			
		}else{
			while(!place_meeting(x , y + sign(vsp), bottomSolid)){
				y -= 1;	
			}
			vsp = 0;	
		}
	}
	y+=vsp;
	
}