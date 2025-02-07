# 1 "data/maps/SilphCo_10F/scripts.pory"

# 2 "data/maps/SilphCo_10F/scripts.pory"
SilphCo_10F_MapScripts::
# 3 "data/maps/SilphCo_10F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_10F_OnLoad
# 4 "data/maps/SilphCo_10F/scripts.pory"
	.byte 0
# 5 "data/maps/SilphCo_10F/scripts.pory"

# 6 "data/maps/SilphCo_10F/scripts.pory"
SilphCo_10F_OnLoad::
# 7 "data/maps/SilphCo_10F/scripts.pory"
	call_if_unset FLAG_SILPH_10F_DOOR, EventScript_Close10FDoor
# 8 "data/maps/SilphCo_10F/scripts.pory"
	end
# 9 "data/maps/SilphCo_10F/scripts.pory"

# 10 "data/maps/SilphCo_10F/scripts.pory"
SilphCo_10F_EventScript_WorkerF::
# 11 "data/maps/SilphCo_10F/scripts.pory"
	lock
# 12 "data/maps/SilphCo_10F/scripts.pory"
	faceplayer
# 13 "data/maps/SilphCo_10F/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_SILPH_CO_11F, 1, SilphCo_10F_EventScript_WorkerFRocketsGone
# 14 "data/maps/SilphCo_10F/scripts.pory"
	msgbox SilphCo_10F_Text_WaaaImScared
# 15 "data/maps/SilphCo_10F/scripts.pory"
	release
# 16 "data/maps/SilphCo_10F/scripts.pory"
	end
# 17 "data/maps/SilphCo_10F/scripts.pory"

# 18 "data/maps/SilphCo_10F/scripts.pory"
SilphCo_10F_EventScript_WorkerFRocketsGone::
# 19 "data/maps/SilphCo_10F/scripts.pory"
	msgbox SilphCo_10F_Text_KeepMeCryingASecret
# 20 "data/maps/SilphCo_10F/scripts.pory"
	release
# 21 "data/maps/SilphCo_10F/scripts.pory"
	end
# 22 "data/maps/SilphCo_10F/scripts.pory"

# 23 "data/maps/SilphCo_10F/scripts.pory"
SilphCo_10F_EventScript_FloorSign::
# 24 "data/maps/SilphCo_10F/scripts.pory"
	msgbox SilphCo_10F_Text_FloorSign, MSGBOX_SIGN
# 25 "data/maps/SilphCo_10F/scripts.pory"
	end
# 26 "data/maps/SilphCo_10F/scripts.pory"

# 27 "data/maps/SilphCo_10F/scripts.pory"
SilphCo_10F_EventScript_Travis::
# 28 "data/maps/SilphCo_10F/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_TRAVIS, SilphCo_10F_Text_TravisIntro, SilphCo_10F_Text_TravisDefeat
# 29 "data/maps/SilphCo_10F/scripts.pory"
	msgbox SilphCo_10F_Text_TravisPostBattle, MSGBOX_AUTOCLOSE
# 30 "data/maps/SilphCo_10F/scripts.pory"
	end
# 31 "data/maps/SilphCo_10F/scripts.pory"

# 32 "data/maps/SilphCo_10F/scripts.pory"
SilphCo_10F_EventScript_Grunt::
# 33 "data/maps/SilphCo_10F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_39, SilphCo_10F_Text_GruntIntro, SilphCo_10F_Text_GruntDefeat
# 34 "data/maps/SilphCo_10F/scripts.pory"
	msgbox SilphCo_10F_Text_GruntPostBattle, MSGBOX_AUTOCLOSE
# 35 "data/maps/SilphCo_10F/scripts.pory"
	end
