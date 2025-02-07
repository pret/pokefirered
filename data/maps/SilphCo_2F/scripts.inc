# 1 "data/maps/SilphCo_2F/scripts.pory"

# 2 "data/maps/SilphCo_2F/scripts.pory"
SilphCo_2F_MapScripts::
# 3 "data/maps/SilphCo_2F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_2F_OnLoad
# 4 "data/maps/SilphCo_2F/scripts.pory"
	.byte 0
# 5 "data/maps/SilphCo_2F/scripts.pory"

# 6 "data/maps/SilphCo_2F/scripts.pory"
SilphCo_2F_OnLoad::
# 7 "data/maps/SilphCo_2F/scripts.pory"
	call_if_unset FLAG_SILPH_2F_DOOR_1, EventScript_Close2FDoor1
# 8 "data/maps/SilphCo_2F/scripts.pory"
	call_if_unset FLAG_SILPH_2F_DOOR_2, EventScript_Close2FDoor2
# 9 "data/maps/SilphCo_2F/scripts.pory"
	end
# 10 "data/maps/SilphCo_2F/scripts.pory"

# 11 "data/maps/SilphCo_2F/scripts.pory"
SilphCo_2F_EventScript_ThunderWaveTutor::
# 12 "data/maps/SilphCo_2F/scripts.pory"
	goto EventScript_ThunderWaveTutor
# 13 "data/maps/SilphCo_2F/scripts.pory"
	end
# 14 "data/maps/SilphCo_2F/scripts.pory"

# 15 "data/maps/SilphCo_2F/scripts.pory"
SilphCo_2F_EventScript_FloorSign::
# 16 "data/maps/SilphCo_2F/scripts.pory"
	msgbox SilphCo_2F_Text_FloorSign, MSGBOX_SIGN
# 17 "data/maps/SilphCo_2F/scripts.pory"
	end
# 18 "data/maps/SilphCo_2F/scripts.pory"

# 19 "data/maps/SilphCo_2F/scripts.pory"
SilphCo_2F_EventScript_Connor::
# 20 "data/maps/SilphCo_2F/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_CONNOR, SilphCo_2F_Text_ConnorIntro, SilphCo_2F_Text_ConnorDefeat
# 21 "data/maps/SilphCo_2F/scripts.pory"
	msgbox SilphCo_2F_Text_ConnorPostBattle, MSGBOX_AUTOCLOSE
# 22 "data/maps/SilphCo_2F/scripts.pory"
	end
# 23 "data/maps/SilphCo_2F/scripts.pory"

# 24 "data/maps/SilphCo_2F/scripts.pory"
SilphCo_2F_EventScript_Jerry::
# 25 "data/maps/SilphCo_2F/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_JERRY, SilphCo_2F_Text_JerryIntro, SilphCo_2F_Text_JerryDefeat
# 26 "data/maps/SilphCo_2F/scripts.pory"
	msgbox SilphCo_2F_Text_JerryPostBattle, MSGBOX_AUTOCLOSE
# 27 "data/maps/SilphCo_2F/scripts.pory"
	end
# 28 "data/maps/SilphCo_2F/scripts.pory"

# 29 "data/maps/SilphCo_2F/scripts.pory"
SilphCo_2F_EventScript_Grunt1::
# 30 "data/maps/SilphCo_2F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_23, SilphCo_2F_Text_Grunt1Intro, SilphCo_2F_Text_Grunt1Defeat
# 31 "data/maps/SilphCo_2F/scripts.pory"
	msgbox SilphCo_2F_Text_Grunt1PostBattle, MSGBOX_AUTOCLOSE
# 32 "data/maps/SilphCo_2F/scripts.pory"
	end
# 33 "data/maps/SilphCo_2F/scripts.pory"

# 34 "data/maps/SilphCo_2F/scripts.pory"
SilphCo_2F_EventScript_Grunt2::
# 35 "data/maps/SilphCo_2F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_24, SilphCo_2F_Text_Grunt2Intro, SilphCo_2F_Text_Grunt2Defeat
# 36 "data/maps/SilphCo_2F/scripts.pory"
	msgbox SilphCo_2F_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
# 37 "data/maps/SilphCo_2F/scripts.pory"
	end
