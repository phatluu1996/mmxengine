function scr_player_x_init(){	
	character = Character.X;
	saber = SaberType.X4;	
	
	helm = armor_prefix(Armor.Normal);
	body = armor_prefix(Armor.Normal);
	arm  = armor_prefix(Armor.Normal);
	foot = armor_prefix(Armor.Max);	
}

function armor_prefix(armor){
	switch (armor) {
	    case Armor.Light:
			canAirDash = true;
			canAirJump = false;
	        return "_la_";
	        break;
			
		case Armor.Max:			
			canAirDash = true;
			canAirJump = false;
			return "_ma_";
	        break;
		
		default:
	        return "";
	        break;
	}	
}