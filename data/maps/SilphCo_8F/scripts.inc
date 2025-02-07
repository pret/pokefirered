# 1 "data/maps/SilphCo_8F/scripts.pory"

# 2 "data/maps/SilphCo_8F/scripts.pory"
SilphCo_8F_MapScripts::
# 3 "data/maps/SilphCo_8F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_8F_OnLoad
# 4 "data/maps/SilphCo_8F/scripts.pory"
	.byte 0
# 5 "data/maps/SilphCo_8F/scripts.pory"

# 6 "data/maps/SilphCo_8F/scripts.pory"
SilphCo_8F_OnLoad::
# 7 "data/maps/SilphCo_8F/scripts.pory"
	call_if_unset FLAG_SILPH_8F_DOOR, EventScript_Close8FDoor
# 8 "data/maps/SilphCo_8F/scripts.pory"
	end
# 9 "data/maps/SilphCo_8F/scripts.pory"

# 10 "data/maps/SilphCo_8F/scripts.pory"
SilphCo_8F_EventScript_WorkerM::
# 11 "data/maps/SilphCo_8F/scripts.pory"
	lock
# 12 "data/maps/SilphCo_8F/scripts.pory"
	faceplayer
# 13 "data/maps/SilphCo_8F/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_SILPH_CO_11F, 1, SilphCo_8F_EventScript_WorkerMRocketsGone
# 14 "data/maps/SilphCo_8F/scripts.pory"
	msgbox SilphCo_8F_Text_WonderIfSilphIsFinished
# 15 "data/maps/SilphCo_8F/scripts.pory"
	release
# 16 "data/maps/SilphCo_8F/scripts.pory"
	end
# 17 "data/maps/SilphCo_8F/scripts.pory"

# 18 "data/maps/SilphCo_8F/scripts.pory"
SilphCo_8F_EventScript_WorkerMRocketsGone::
# 19 "data/maps/SilphCo_8F/scripts.pory"
	msgbox SilphCo_8F_Text_ThanksForSavingUs
# 20 "data/maps/SilphCo_8F/scripts.pory"
	release
# 21 "data/maps/SilphCo_8F/scripts.pory"
	end
# 22 "data/maps/SilphCo_8F/scripts.pory"

# 23 "data/maps/SilphCo_8F/scripts.pory"
SilphCo_8F_EventScript_FloorSign::
# 24 "data/maps/SilphCo_8F/scripts.pory"
	msgbox SilphCo_8F_Text_FloorSign, MSGBOX_SIGN
# 25 "data/maps/SilphCo_8F/scripts.pory"
	end
# 26 "data/maps/SilphCo_8F/scripts.pory"

# 27 "data/maps/SilphCo_8F/scripts.pory"
SilphCo_8F_EventScript_Parker::
# 28 "data/maps/SilphCo_8F/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_PARKER, SilphCo_8F_Text_ParkerIntro, SilphCo_8F_Text_ParkerDefeat
# 29 "data/maps/SilphCo_8F/scripts.pory"
	msgbox SilphCo_8F_Text_ParkerPostBattle, MSGBOX_AUTOCLOSE
# 30 "data/maps/SilphCo_8F/scripts.pory"
	end
# 31 "data/maps/SilphCo_8F/scripts.pory"

# 32 "data/maps/SilphCo_8F/scripts.pory"
SilphCo_8F_EventScript_Grunt1::
# 33 "data/maps/SilphCo_8F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_32, SilphCo_8F_Text_Grunt1Intro, SilphCo_8F_Text_Grunt1Defeat
# 34 "data/maps/SilphCo_8F/scripts.pory"
	msgbox SilphCo_8F_Text_Grunt1PostBattle, MSGBOX_AUTOCLOSE
# 35 "data/maps/SilphCo_8F/scripts.pory"
	end
# 36 "data/maps/SilphCo_8F/scripts.pory"

# 37 "data/maps/SilphCo_8F/scripts.pory"
SilphCo_8F_EventScript_Grunt2::
# 38 "data/maps/SilphCo_8F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_36, SilphCo_8F_Text_Grunt2Intro, SilphCo_8F_Text_Grunt2Defeat
# 39 "data/maps/SilphCo_8F/scripts.pory"
	msgbox SilphCo_8F_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
# 40 "data/maps/SilphCo_8F/scripts.pory"
	end
