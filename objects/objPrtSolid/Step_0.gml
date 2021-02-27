if(!place_meeting(x + 1, y, objPrtSolid) and !place_meeting(x + 1, y, objSlope)){
	right = true;
}

if(!place_meeting(x - 1, y, objPrtSolid) and !place_meeting(x - 1, y, objSlope)){
	left = true;
}

if(!place_meeting(x, y + 1, objPrtSolid) and !place_meeting(x, y + 1, objSlope)){
	bot = true;
}

if(!place_meeting(x, y - 1, objPrtSolid) and !place_meeting(x, y - 1, objSlope)){
	top = true;
}