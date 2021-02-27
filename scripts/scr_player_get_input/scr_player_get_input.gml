function scr_player_get_input(){
	key_up = keyboard_check(ord("W"));
	key_down = keyboard_check(ord("S"));
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(ord("K"));
	key_jump_hold = keyboard_check(ord("K"));
	key_dash_press = keyboard_check_pressed(ord("L"));
	key_dash_hold = keyboard_check(ord("L"));
	
	key_attack_press = keyboard_check_pressed(ord("J"));
	key_attack_release = keyboard_check_released(ord("J"));
	key_attack_hold = keyboard_check(ord("J"));
	
	key_swap = keyboard_check_pressed(ord("R"));
	key_prev_weapon = keyboard_check_pressed(ord("U"));
	key_next_weapon = keyboard_check_pressed(ord("I"));
	key_technique = keyboard_check_pressed(ord("N"));
	key_technique_hold = keyboard_check(ord("N"));
	key_technique_release = keyboard_check_released(ord("N"));
	key_enter = keyboard_check_pressed(ord("P"));
	
}