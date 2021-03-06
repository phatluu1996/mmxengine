function scr_boss_step_event(){
	switch (object_index) {
	    case objDouble:
	        scr_double_step_event();
	        break;
		
		case objLightningGazelle:
	        scr_lightning_gazelle_step_event();
	        break;
	
	    default:
	        // code here
	        break;
	}
	

}