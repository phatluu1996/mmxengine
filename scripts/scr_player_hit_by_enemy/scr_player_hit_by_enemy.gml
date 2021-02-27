function scr_player_hit_by_enemy(){
	if(place_meeting(x,y,objPrtEnemy)){
		enemyObj = instance_place(x,y,objPrtEnemy);	
		if(enemyObj.state == EnemyState.Active)	return enemyObj;
	}
	if(place_meeting(x,y,objPrtEnemyWeapon)){
		return instance_place(x,y,objPrtEnemyWeapon);	
	}
	return -4;	
}