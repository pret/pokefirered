# 1 "data/maps/SilphCo_4F/scripts.pory"

# 2 "data/maps/SilphCo_4F/scripts.pory"
SilphCo_4F_MapScripts::
# 3 "data/maps/SilphCo_4F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_4F_OnLoad
# 4 "data/maps/SilphCo_4F/scripts.pory"
	.byte 0
# 5 "data/maps/SilphCo_4F/scripts.pory"

# 6 "data/maps/SilphCo_4F/scripts.pory"
SilphCo_4F_OnLoad::
# 7 "data/maps/SilphCo_4F/scripts.pory"
	call_if_unset FLAG_SILPH_4F_DOOR_1, EventScript_Close4FDoor1
# 8 "data/maps/SilphCo_4F/scripts.pory"
	call_if_unset FLAG_SILPH_4F_DOOR_2, EventScript_Close4FDoor2
# 9 "data/maps/SilphCo_4F/scripts.pory"
	end
# 10 "data/maps/SilphCo_4F/scripts.pory"

# 11 "data/maps/SilphCo_4F/scripts.pory"
SilphCo_4F_EventScript_WorkerM::
# 12 "data/maps/SilphCo_4F/scripts.pory"
	lock
# 13 "data/maps/SilphCo_4F/scripts.pory"
	faceplayer
# 14 "data/maps/SilphCo_4F/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_SILPH_CO_11F, 1, SilphCo_4F_EventScript_WorkerMRocketsGone
# 15 "data/maps/SilphCo_4F/scripts.pory"
	msgbox SilphCo_4F_Text_CantYouSeeImHiding
# 16 "data/maps/SilphCo_4F/scripts.pory"
	release
# 17 "data/maps/SilphCo_4F/scripts.pory"
	end
# 18 "data/maps/SilphCo_4F/scripts.pory"

# 19 "data/maps/SilphCo_4F/scripts.pory"
SilphCo_4F_EventScript_WorkerMRocketsGone::
# 20 "data/maps/SilphCo_4F/scripts.pory"
	msgbox SilphCo_4F_Text_TeamRocketIsGone
# 21 "data/maps/SilphCo_4F/scripts.pory"
	release
# 22 "data/maps/SilphCo_4F/scripts.pory"
	end
# 23 "data/maps/SilphCo_4F/scripts.pory"

# 24 "data/maps/SilphCo_4F/scripts.pory"
SilphCo_4F_EventScript_FloorSign::
# 25 "data/maps/SilphCo_4F/scripts.pory"
	msgbox SilphCo_4F_Text_FloorSign, MSGBOX_SIGN
# 26 "data/maps/SilphCo_4F/scripts.pory"
	end
# 27 "data/maps/SilphCo_4F/scripts.pory"

# 28 "data/maps/SilphCo_4F/scripts.pory"
SilphCo_4F_EventScript_Rodney::
# 29 "data/maps/SilphCo_4F/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_RODNEY, SilphCo_4F_Text_RodneyIntro, SilphCo_4F_Text_RodneyDefeat
# 30 "data/maps/SilphCo_4F/scripts.pory"
	msgbox SilphCo_4F_Text_RodneyPostBattle, MSGBOX_AUTOCLOSE
# 31 "data/maps/SilphCo_4F/scripts.pory"
	end
# 32 "data/maps/SilphCo_4F/scripts.pory"

# 33 "data/maps/SilphCo_4F/scripts.pory"
SilphCo_4F_EventScript_Grunt1::
# 34 "data/maps/SilphCo_4F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_26, SilphCo_4F_Text_Grunt1Intro, SilphCo_4F_Text_Grunt1Defeat
# 35 "data/maps/SilphCo_4F/scripts.pory"
	msgbox SilphCo_4F_Text_Grunt1PostBattle, MSGBOX_AUTOCLOSE
# 36 "data/maps/SilphCo_4F/scripts.pory"
	end
# 37 "data/maps/SilphCo_4F/scripts.pory"

# 38 "data/maps/SilphCo_4F/scripts.pory"
SilphCo_4F_EventScript_Grunt2::
# 39 "data/maps/SilphCo_4F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_27, SilphCo_4F_Text_Grunt2Intro, SilphCo_4F_Text_Grunt2Defeat
# 40 "data/maps/SilphCo_4F/scripts.pory"
	msgbox SilphCo_4F_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
# 41 "data/maps/SilphCo_4F/scripts.pory"
	end
