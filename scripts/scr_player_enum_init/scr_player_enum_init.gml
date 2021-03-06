function scr_player_enum_init(){
	enum Character {
		X,
		Z,
		LightArmor,
		MaxArmor
	}
	
	enum Armor {
		Light,
		Max,
		Normal
	}
	
	enum PlayerState {
		Begin,
		Normal,
		Ladder,
		WallSlide,
		Movement,	
		Jump,
		Dash,
		DashUp,
		WallJump,
		WallKick,
		GrabLadder,
		Crouch,
		Damaged,
		Spawn,
		Recall,
		Defeat,
		Swap,
		EquipArmor,
		Technique,
		GrabVerticalRope,
		GrabHorizoneRope,
		GrabDeclineRope,
		MovingSolidSlide,
		ViewTransition,
		BossEncounter
	}
	
	enum ClimbType {
		GetUp,
		Up,
		Down
	}
	
	enum SaberType {
		X4,
		X6
	}
	
	enum ZTechnique {
		None,
		FireFist,
		DashSlash,
		ThunderUppercut,
		Uppercut,
		FlameUppercut,
		IceUppercut,
		AirStab,
		IceStab	,
		ThunderStab,
		FlameStab
	}
	
	enum ZeroForm {
		Normal,
		Black,
		Nightmare
	}
	
	enum ZElement {
		Fire,
		Ice,
		Thunder,
		Normal
	}
	
	enum CameraAction {
		Up,
		Down,
		Left,
		Right
	}
}