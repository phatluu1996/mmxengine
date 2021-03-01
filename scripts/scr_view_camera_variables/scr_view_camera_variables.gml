// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_view_camera_variables(){
	camera = view_camera[0];
	camera_x = camera_get_view_x(view_camera[0]);
	camera_y = camera_get_view_y(view_camera[0]);
	camera_w = camera_get_view_width(view_camera[0]);
	camera_h = camera_get_view_height(view_camera[0]);
	
	//Find end section
	//var dist = 0
	//while(collision_rectangle(x, y, x, y - 16*dist, objTopBorder, false, true) < 0){
	//	dist++;
	//	if(dist > 50000){
	//		show_message("Cannot find top border");
	//		break;
	//	}
	//}
	//section_top = collision_rectangle(x, y, x, y - 16*dist, objTopBorder, false, true).y;
	
	//dist = 0
	//while(collision_rectangle(x, y, x, y + 16*dist, objBottomBorder, false, true) < 0){
	//	dist++;
	//	if(dist > 50000){
	//		show_message("Cannot find bottom border");
	//		break;
	//	}
	//}
	//section_bottom = collision_rectangle(x - 1, y, x + 1, y + 16*dist, objBottomBorder, false, true).y;
	
	//dist = 0
	//while(!place_meeting(x + 8*dist, y, objRightBorder)){
	//	dist++;
	//	if(dist > 50000){
	//		show_message("Cannot find right border");
	//		break;
	//	}
	//}
	//section_right = instance_place(x + 8*dist, y, objRightBorder).x;
	
	//dist = 0
	//while(!place_meeting(x - 8*dist, y, objLeftBorder)){
	//	dist++;
	//	if(dist > 50000){
	//		show_message("Cannot find left border");
	//		break;
	//	}
	//}
	//section_left = instance_place(x - 8*dist, y, objLeftBorder).x;
}