event_inherited();
if(layer_exists("Bg")){	
	layer_x("Bg", lerp(0,camera_get_view_x(view_camera[0]), 0.2));
}

