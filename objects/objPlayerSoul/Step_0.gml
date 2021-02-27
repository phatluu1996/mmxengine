if(global.paused){  
	image_speed = 0;	
	exit;
}else{
	image_speed = 1;		
}
x=orbit_target.x + lengthdir_x(orbit_length, orbit_place); // these 3 instructions make sure that in each step the orbiting object adjusts to the proper position
y=orbit_target.y + lengthdir_y(orbit_length, orbit_place); // these 3 instructions make sure that in each step the orbiting object adjusts to the proper position
orbit_length+=3.5;
orbit_place+=orbit_speed; // these 3 instructions make sure that in each step the orbiting object adjusts to the proper position