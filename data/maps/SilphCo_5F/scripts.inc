# 1 "data/maps/SilphCo_5F/scripts.pory"

# 2 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_MapScripts::
# 3 "data/maps/SilphCo_5F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_5F_OnLoad
# 4 "data/maps/SilphCo_5F/scripts.pory"
	.byte 0
# 5 "data/maps/SilphCo_5F/scripts.pory"

# 6 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_OnLoad::
# 7 "data/maps/SilphCo_5F/scripts.pory"
	call_if_unset FLAG_SILPH_5F_DOOR_1, EventScript_Close5FDoor1
# 8 "data/maps/SilphCo_5F/scripts.pory"
	call_if_unset FLAG_SILPH_5F_DOOR_2, EventScript_Close5FDoor2
# 9 "data/maps/SilphCo_5F/scripts.pory"
	call_if_unset FLAG_SILPH_5F_DOOR_3, EventScript_Close5FDoor3
# 10 "data/maps/SilphCo_5F/scripts.pory"
	end
# 11 "data/maps/SilphCo_5F/scripts.pory"

# 12 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_EventScript_WorkerM::
# 13 "data/maps/SilphCo_5F/scripts.pory"
	lock
# 14 "data/maps/SilphCo_5F/scripts.pory"
	faceplayer
# 15 "data/maps/SilphCo_5F/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_SILPH_CO_11F, 1, SilphCo_5F_EventScript_WorkerMRocketsGone
# 16 "data/maps/SilphCo_5F/scripts.pory"
	msgbox SilphCo_5F_Text_RocketsInUproarAboutIntruder
# 17 "data/maps/SilphCo_5F/scripts.pory"
	release
# 18 "data/maps/SilphCo_5F/scripts.pory"
	end
# 19 "data/maps/SilphCo_5F/scripts.pory"

# 20 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_EventScript_WorkerMRocketsGone::
# 21 "data/maps/SilphCo_5F/scripts.pory"
	msgbox SilphCo_5F_Text_YoureOurHeroThankYou
# 22 "data/maps/SilphCo_5F/scripts.pory"
	release
# 23 "data/maps/SilphCo_5F/scripts.pory"
	end
# 24 "data/maps/SilphCo_5F/scripts.pory"

# 25 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_EventScript_PokemonReport1::
# 26 "data/maps/SilphCo_5F/scripts.pory"
	msgbox SilphCo_5F_Text_PorygonFirstVRMon, MSGBOX_SIGN
# 27 "data/maps/SilphCo_5F/scripts.pory"
	end
# 28 "data/maps/SilphCo_5F/scripts.pory"

# 29 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_EventScript_PokemonReport2::
# 30 "data/maps/SilphCo_5F/scripts.pory"
	msgbox SilphCo_5F_Text_Over350TechniquesConfirmed, MSGBOX_SIGN
# 31 "data/maps/SilphCo_5F/scripts.pory"
	end
# 32 "data/maps/SilphCo_5F/scripts.pory"

# 33 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_EventScript_PokemonReport3::
# 34 "data/maps/SilphCo_5F/scripts.pory"
	msgbox SilphCo_5F_Text_SomeMonsEvolveWhenTraded, MSGBOX_SIGN
# 35 "data/maps/SilphCo_5F/scripts.pory"
	end
# 36 "data/maps/SilphCo_5F/scripts.pory"

# 37 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_EventScript_FloorSign::
# 38 "data/maps/SilphCo_5F/scripts.pory"
	msgbox SilphCo_5F_Text_FloorSign, MSGBOX_SIGN
# 39 "data/maps/SilphCo_5F/scripts.pory"
	end
# 40 "data/maps/SilphCo_5F/scripts.pory"

# 41 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_EventScript_Beau::
# 42 "data/maps/SilphCo_5F/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_BEAU, SilphCo_5F_Text_BeauIntro, SilphCo_5F_Text_BeauDefeat
# 43 "data/maps/SilphCo_5F/scripts.pory"
	msgbox SilphCo_5F_Text_BeauPostBattle, MSGBOX_AUTOCLOSE
# 44 "data/maps/SilphCo_5F/scripts.pory"
	end
# 45 "data/maps/SilphCo_5F/scripts.pory"

# 46 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_EventScript_Grunt1::
# 47 "data/maps/SilphCo_5F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_28, SilphCo_5F_Text_Grunt1Intro, SilphCo_5F_Text_Grunt1Defeat
# 48 "data/maps/SilphCo_5F/scripts.pory"
	msgbox SilphCo_5F_Text_Grunt1PostBattle, MSGBOX_AUTOCLOSE
# 49 "data/maps/SilphCo_5F/scripts.pory"
	end
# 50 "data/maps/SilphCo_5F/scripts.pory"

# 51 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_EventScript_Grunt2::
# 52 "data/maps/SilphCo_5F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_29, SilphCo_5F_Text_Grunt2Intro, SilphCo_5F_Text_Grunt2Defeat
# 53 "data/maps/SilphCo_5F/scripts.pory"
	msgbox SilphCo_5F_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
# 54 "data/maps/SilphCo_5F/scripts.pory"
	end
# 55 "data/maps/SilphCo_5F/scripts.pory"

# 56 "data/maps/SilphCo_5F/scripts.pory"
SilphCo_5F_EventScript_Dalton::
# 57 "data/maps/SilphCo_5F/scripts.pory"
	trainerbattle_single TRAINER_JUGGLER_DALTON, SilphCo_5F_Text_DaltonIntro, SilphCo_5F_Text_DaltonDefeat
# 58 "data/maps/SilphCo_5F/scripts.pory"
	msgbox SilphCo_5F_Text_DaltonPostBattle, MSGBOX_AUTOCLOSE
# 59 "data/maps/SilphCo_5F/scripts.pory"
	end
