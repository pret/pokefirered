# 1 "data/maps/MtMoon_1F/scripts.pory"

# 2 "data/maps/MtMoon_1F/scripts.pory"
MtMoon_1F_MapScripts::
# 3 "data/maps/MtMoon_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, MtMoon_1F_OnTransition
# 4 "data/maps/MtMoon_1F/scripts.pory"
	.byte 0
# 5 "data/maps/MtMoon_1F/scripts.pory"

# 6 "data/maps/MtMoon_1F/scripts.pory"
MtMoon_1F_OnTransition::
# 7 "data/maps/MtMoon_1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_MT_MOON_1F
# 8 "data/maps/MtMoon_1F/scripts.pory"
	end
# 9 "data/maps/MtMoon_1F/scripts.pory"

# 10 "data/maps/MtMoon_1F/scripts.pory"
MtMoon_1F_EventScript_ZubatSign::
# 11 "data/maps/MtMoon_1F/scripts.pory"
	msgbox MtMoon_1F_Text_ZubatIsABloodsucker, MSGBOX_SIGN
# 12 "data/maps/MtMoon_1F/scripts.pory"
	end
# 13 "data/maps/MtMoon_1F/scripts.pory"

# 14 "data/maps/MtMoon_1F/scripts.pory"
MtMoon_1F_EventScript_Marcos::
# 15 "data/maps/MtMoon_1F/scripts.pory"
	trainerbattle_single TRAINER_HIKER_MARCOS, MtMoon_1F_Text_MarcosIntro, MtMoon_1F_Text_MarcosDefeat
# 16 "data/maps/MtMoon_1F/scripts.pory"
	msgbox MtMoon_1F_Text_MarcosPostBattle, MSGBOX_AUTOCLOSE
# 17 "data/maps/MtMoon_1F/scripts.pory"
	end
# 18 "data/maps/MtMoon_1F/scripts.pory"

# 19 "data/maps/MtMoon_1F/scripts.pory"
MtMoon_1F_EventScript_Josh::
# 20 "data/maps/MtMoon_1F/scripts.pory"
	trainerbattle_single TRAINER_YOUNGSTER_JOSH, MtMoon_1F_Text_JoshIntro, MtMoon_1F_Text_JoshDefeat
# 21 "data/maps/MtMoon_1F/scripts.pory"
	msgbox MtMoon_1F_Text_JoshPostBattle, MSGBOX_AUTOCLOSE
# 22 "data/maps/MtMoon_1F/scripts.pory"
	end
# 23 "data/maps/MtMoon_1F/scripts.pory"

# 24 "data/maps/MtMoon_1F/scripts.pory"
MtMoon_1F_EventScript_Miriam::
# 25 "data/maps/MtMoon_1F/scripts.pory"
	trainerbattle_single TRAINER_LASS_MIRIAM, MtMoon_1F_Text_MiriamIntro, MtMoon_1F_Text_MiriamDefeat
# 26 "data/maps/MtMoon_1F/scripts.pory"
	msgbox MtMoon_1F_Text_MiriamPostBattle, MSGBOX_AUTOCLOSE
# 27 "data/maps/MtMoon_1F/scripts.pory"
	end
# 28 "data/maps/MtMoon_1F/scripts.pory"

# 29 "data/maps/MtMoon_1F/scripts.pory"
MtMoon_1F_EventScript_Iris::
# 30 "data/maps/MtMoon_1F/scripts.pory"
	trainerbattle_single TRAINER_LASS_IRIS, MtMoon_1F_Text_IrisIntro, MtMoon_1F_Text_IrisDefeat
# 31 "data/maps/MtMoon_1F/scripts.pory"
	msgbox MtMoon_1F_Text_IrisPostBattle, MSGBOX_AUTOCLOSE
# 32 "data/maps/MtMoon_1F/scripts.pory"
	end
# 33 "data/maps/MtMoon_1F/scripts.pory"

# 34 "data/maps/MtMoon_1F/scripts.pory"
MtMoon_1F_EventScript_Jovan::
# 35 "data/maps/MtMoon_1F/scripts.pory"
	trainerbattle_single TRAINER_SUPER_NERD_JOVAN, MtMoon_1F_Text_JovanIntro, MtMoon_1F_Text_JovanDefeat
# 36 "data/maps/MtMoon_1F/scripts.pory"
	msgbox MtMoon_1F_Text_JovanPostBattle, MSGBOX_AUTOCLOSE
# 37 "data/maps/MtMoon_1F/scripts.pory"
	end
# 38 "data/maps/MtMoon_1F/scripts.pory"

# 39 "data/maps/MtMoon_1F/scripts.pory"
MtMoon_1F_EventScript_Kent::
# 40 "data/maps/MtMoon_1F/scripts.pory"
	trainerbattle_single TRAINER_BUG_CATCHER_KENT, MtMoon_1F_Text_KentIntro, MtMoon_1F_Text_KentDefeat
# 41 "data/maps/MtMoon_1F/scripts.pory"
	msgbox MtMoon_1F_Text_KentPostBattle, MSGBOX_AUTOCLOSE
# 42 "data/maps/MtMoon_1F/scripts.pory"
	end
# 43 "data/maps/MtMoon_1F/scripts.pory"

# 44 "data/maps/MtMoon_1F/scripts.pory"
MtMoon_1F_EventScript_Robby::
# 45 "data/maps/MtMoon_1F/scripts.pory"
	trainerbattle_single TRAINER_BUG_CATCHER_ROBBY, MtMoon_1F_Text_RobbyIntro, MtMoon_1F_Text_RobbyDefeat
# 46 "data/maps/MtMoon_1F/scripts.pory"
	msgbox MtMoon_1F_Text_RobbyPostBattle, MSGBOX_AUTOCLOSE
# 47 "data/maps/MtMoon_1F/scripts.pory"
	end
