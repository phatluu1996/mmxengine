var player = instance_find(objPrtPlayer, 0);
depth = player.depth-1;
if(player >= 0 and (player.normalAtk or player.specialShoot or player.technique != ZTechnique.None)){
	image_index = player.image_index;
	image_xscale = player.image_xscale;
	sprite_index = player.saber_mask;
}else{
	sprite_index = noone;
}
x = player.x;
y = player.y;

if(global.paused){  
	image_speed = 0;	
	exit;
}else{
	image_speed = 1;		
}	
