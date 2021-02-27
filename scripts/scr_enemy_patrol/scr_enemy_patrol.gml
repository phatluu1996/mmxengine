function scr_enemy_patrol(from, to, duration, horizone, vertical){
	var a4 = to-from;	
	if(patrolCount <= duration){
		patrolCount++;	
		if(horizone) hsp = dir * a4 / duration;
		if(vertical) vsp = dir * a4 / duration;
	}else{
		dir = - dir;
		patrolCount = 0;
	}
}