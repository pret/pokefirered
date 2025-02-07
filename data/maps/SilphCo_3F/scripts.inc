# 1 "data/maps/SilphCo_3F/scripts.pory"

# 2 "data/maps/SilphCo_3F/scripts.pory"
SilphCo_3F_MapScripts::
# 3 "data/maps/SilphCo_3F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_3F_OnLoad
# 4 "data/maps/SilphCo_3F/scripts.pory"
	.byte 0
# 5 "data/maps/SilphCo_3F/scripts.pory"

# 6 "data/maps/SilphCo_3F/scripts.pory"
SilphCo_3F_OnLoad::
# 7 "data/maps/SilphCo_3F/scripts.pory"
	call_if_unset FLAG_SILPH_3F_DOOR_1, EventScript_Close3FDoor1
# 8 "data/maps/SilphCo_3F/scripts.pory"
	call_if_unset FLAG_SILPH_3F_DOOR_2, EventScript_Close3FDoor2
# 9 "data/maps/SilphCo_3F/scripts.pory"
	end
# 10 "data/maps/SilphCo_3F/scripts.pory"

# 11 "data/maps/SilphCo_3F/scripts.pory"
SilphCo_3F_EventScript_WorkerM::
# 12 "data/maps/SilphCo_3F/scripts.pory"
	lock
# 13 "data/maps/SilphCo_3F/scripts.pory"
	faceplayer
# 14 "data/maps/SilphCo_3F/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_SILPH_CO_11F, 1, SilphCo_3F_EventScript_WorkerMRocketsGone
# 15 "data/maps/SilphCo_3F/scripts.pory"
	msgbox SilphCo_3F_Text_WhatAmIToDo
# 16 "data/maps/SilphCo_3F/scripts.pory"
	release
# 17 "data/maps/SilphCo_3F/scripts.pory"
	end
# 18 "data/maps/SilphCo_3F/scripts.pory"

# 19 "data/maps/SilphCo_3F/scripts.pory"
SilphCo_3F_EventScript_WorkerMRocketsGone::
# 20 "data/maps/SilphCo_3F/scripts.pory"
	msgbox SilphCo_3F_Text_YouAndYourMonsSavedUs
# 21 "data/maps/SilphCo_3F/scripts.pory"
	release
# 22 "data/maps/SilphCo_3F/scripts.pory"
	end
# 23 "data/maps/SilphCo_3F/scripts.pory"

# 24 "data/maps/SilphCo_3F/scripts.pory"
SilphCo_3F_EventScript_FloorSign::
# 25 "data/maps/SilphCo_3F/scripts.pory"
	msgbox SilphCo_3F_Text_FloorSign, MSGBOX_SIGN
# 26 "data/maps/SilphCo_3F/scripts.pory"
	end
# 27 "data/maps/SilphCo_3F/scripts.pory"

# 28 "data/maps/SilphCo_3F/scripts.pory"
SilphCo_3F_EventScript_Jose::
# 29 "data/maps/SilphCo_3F/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_JOSE, SilphCo_3F_Text_JoseIntro, SilphCo_3F_Text_JoseDefeat
# 30 "data/maps/SilphCo_3F/scripts.pory"
	msgbox SilphCo_3F_Text_JosePostBattle, MSGBOX_AUTOCLOSE
# 31 "data/maps/SilphCo_3F/scripts.pory"
	end
# 32 "data/maps/SilphCo_3F/scripts.pory"

# 33 "data/maps/SilphCo_3F/scripts.pory"
SilphCo_3F_EventScript_Grunt::
# 34 "data/maps/SilphCo_3F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_25, SilphCo_3F_Text_GruntIntro, SilphCo_3F_Text_GruntDefeat
# 35 "data/maps/SilphCo_3F/scripts.pory"
	msgbox SilphCo_3F_Text_GruntPostBattle, MSGBOX_AUTOCLOSE
# 36 "data/maps/SilphCo_3F/scripts.pory"
	end
