// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_is_grab_rope(){
	return state == PlayerState.GrabDeclineRope or state == PlayerState.GrabHorizoneRope or state == PlayerState.GrabVerticalRope;
}