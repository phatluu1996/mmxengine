/// @description Insert description here
// You can write your code in this editor
if(instance_place(x,y - 1, objLadder) == noone){
	instance_create_depth(x, y, depth - 1,objTopLadder);
}	