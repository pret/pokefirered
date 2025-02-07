# 1 "data/maps/SilphCo_6F/scripts.pory"

# 2 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_MapScripts::
# 3 "data/maps/SilphCo_6F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_6F_OnLoad
# 4 "data/maps/SilphCo_6F/scripts.pory"
	.byte 0
# 5 "data/maps/SilphCo_6F/scripts.pory"

# 6 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_OnLoad::
# 7 "data/maps/SilphCo_6F/scripts.pory"
	call_if_unset FLAG_SILPH_6F_DOOR, EventScript_Close6FDoor
# 8 "data/maps/SilphCo_6F/scripts.pory"
	end
# 9 "data/maps/SilphCo_6F/scripts.pory"

# 10 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_WorkerM2::
# 11 "data/maps/SilphCo_6F/scripts.pory"
	lock
# 12 "data/maps/SilphCo_6F/scripts.pory"
	faceplayer
# 13 "data/maps/SilphCo_6F/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_SILPH_CO_11F, 1, SilphCo_6F_EventScript_WorkerM2RocketsGone
# 14 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_TargetedSilphForOurMonProducts
# 15 "data/maps/SilphCo_6F/scripts.pory"
	release
# 16 "data/maps/SilphCo_6F/scripts.pory"
	end
# 17 "data/maps/SilphCo_6F/scripts.pory"

# 18 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_WorkerM2RocketsGone::
# 19 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_ComeWorkForSilphWhenYoureOlder
# 20 "data/maps/SilphCo_6F/scripts.pory"
	release
# 21 "data/maps/SilphCo_6F/scripts.pory"
	end
# 22 "data/maps/SilphCo_6F/scripts.pory"

# 23 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_WorkerM3::
# 24 "data/maps/SilphCo_6F/scripts.pory"
	lock
# 25 "data/maps/SilphCo_6F/scripts.pory"
	faceplayer
# 26 "data/maps/SilphCo_6F/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_SILPH_CO_11F, 1, SilphCo_6F_EventScript_WorkerM3RocketsGone
# 27 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_RocketsTookOverBuilding
# 28 "data/maps/SilphCo_6F/scripts.pory"
	release
# 29 "data/maps/SilphCo_6F/scripts.pory"
	end
# 30 "data/maps/SilphCo_6F/scripts.pory"

# 31 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_WorkerM3RocketsGone::
# 32 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_BetterGetBackToWork
# 33 "data/maps/SilphCo_6F/scripts.pory"
	release
# 34 "data/maps/SilphCo_6F/scripts.pory"
	end
# 35 "data/maps/SilphCo_6F/scripts.pory"

# 36 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_WorkerM1::
# 37 "data/maps/SilphCo_6F/scripts.pory"
	lock
# 38 "data/maps/SilphCo_6F/scripts.pory"
	faceplayer
# 39 "data/maps/SilphCo_6F/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_SILPH_CO_11F, 1, SilphCo_6F_EventScript_WorkerM1RocketsGone
# 40 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_HelpMePlease
# 41 "data/maps/SilphCo_6F/scripts.pory"
	release
# 42 "data/maps/SilphCo_6F/scripts.pory"
	end
# 43 "data/maps/SilphCo_6F/scripts.pory"

# 44 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_WorkerM1RocketsGone::
# 45 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_WeGotEngaged
# 46 "data/maps/SilphCo_6F/scripts.pory"
	release
# 47 "data/maps/SilphCo_6F/scripts.pory"
	end
# 48 "data/maps/SilphCo_6F/scripts.pory"

# 49 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_WorkerF1::
# 50 "data/maps/SilphCo_6F/scripts.pory"
	lock
# 51 "data/maps/SilphCo_6F/scripts.pory"
	faceplayer
# 52 "data/maps/SilphCo_6F/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_SILPH_CO_11F, 1, SilphCo_6F_EventScript_WorkerF1RocketsGone
# 53 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_ThatManIsSuchACoward
# 54 "data/maps/SilphCo_6F/scripts.pory"
	release
# 55 "data/maps/SilphCo_6F/scripts.pory"
	end
# 56 "data/maps/SilphCo_6F/scripts.pory"

# 57 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_WorkerF1RocketsGone::
# 58 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_NeedsMeToLookAfterHim
# 59 "data/maps/SilphCo_6F/scripts.pory"
	release
# 60 "data/maps/SilphCo_6F/scripts.pory"
	end
# 61 "data/maps/SilphCo_6F/scripts.pory"

# 62 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_WorkerF2::
# 63 "data/maps/SilphCo_6F/scripts.pory"
	lock
# 64 "data/maps/SilphCo_6F/scripts.pory"
	faceplayer
# 65 "data/maps/SilphCo_6F/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_SILPH_CO_11F, 1, SilphCo_6F_EventScript_WorkerF2RocketsGone
# 66 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_RocketsTryingToConquerWorld
# 67 "data/maps/SilphCo_6F/scripts.pory"
	release
# 68 "data/maps/SilphCo_6F/scripts.pory"
	end
# 69 "data/maps/SilphCo_6F/scripts.pory"

# 70 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_WorkerF2RocketsGone::
# 71 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_RocketsRanAwayBecauseOfYou
# 72 "data/maps/SilphCo_6F/scripts.pory"
	release
# 73 "data/maps/SilphCo_6F/scripts.pory"
	end
# 74 "data/maps/SilphCo_6F/scripts.pory"

# 75 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_FloorSign::
# 76 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_FloorSign, MSGBOX_SIGN
# 77 "data/maps/SilphCo_6F/scripts.pory"
	end
# 78 "data/maps/SilphCo_6F/scripts.pory"

# 79 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_Taylor::
# 80 "data/maps/SilphCo_6F/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_TAYLOR, SilphCo_6F_Text_TaylorIntro, SilphCo_6F_Text_TaylorDefeat
# 81 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_TaylorPostBattle, MSGBOX_AUTOCLOSE
# 82 "data/maps/SilphCo_6F/scripts.pory"
	end
# 83 "data/maps/SilphCo_6F/scripts.pory"

# 84 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_Grunt1::
# 85 "data/maps/SilphCo_6F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_30, SilphCo_6F_Text_Grunt1Intro, SilphCo_6F_Text_Grunt1Defeat
# 86 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_Grunt1PostBattle, MSGBOX_AUTOCLOSE
# 87 "data/maps/SilphCo_6F/scripts.pory"
	end
# 88 "data/maps/SilphCo_6F/scripts.pory"

# 89 "data/maps/SilphCo_6F/scripts.pory"
SilphCo_6F_EventScript_Grunt2::
# 90 "data/maps/SilphCo_6F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_31, SilphCo_6F_Text_Grunt2Intro, SilphCo_6F_Text_Grunt2Defeat
# 91 "data/maps/SilphCo_6F/scripts.pory"
	msgbox SilphCo_6F_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
# 92 "data/maps/SilphCo_6F/scripts.pory"
	end
