if(global.paused){  
	image_speed = 0;	
	exit;
}else{
	image_speed = 1;		
}	

hsp = hspd * hdir;
vsp = vspd * vdir;
count++;
if(count >= maxCount){
	count = 0;
	hdir = -hdir;
	image_xscale = -image_xscale;
	vdir = -vdir;
}
var player_v = instance_place(x, y - abs(vsp), objPrtPlayer);
if(player_v >= 0 and player_v.sideMovingPlatform == noone and player_v.state != PlayerState.Defeat){
	player_v.vsp = vsp;	
}

//var player_v2 = instance_place(x, y, objPrtPlayer);
//if(player_v2 >= 0 and player_v2.sideMovingPlatform == noone and vsp >= 0){
//	with player_v2 {
//		//move_outside_solid(270, 12);	
//		if(place_meeting(x, y, objPrtSolid)){
//			state = PlayerState.Defeat;				
//		}
//	}
//}

x+=hsp;
y+=vsp;