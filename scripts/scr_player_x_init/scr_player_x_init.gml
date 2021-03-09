function scr_player_x_init(){	
	character = Character.X;
	saber = SaberType.X4;	
	
	helm = armor_prefix(Armor.Normal);
	body = armor_prefix(Armor.Normal);
	arm  = armor_prefix(Armor.Normal);
	foot = armor_prefix(Armor.Light);	
}

function armor_prefix(armor){
	switch (armor) {
	    case Armor.Light:
	        return "_la_";
	        break;
		
		default:
	        return "";
	        break;
	}	
}