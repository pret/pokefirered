# 1 "data/maps/Route16/scripts.pory"

# 2 "data/maps/Route16/scripts.pory"
Route16_MapScripts::
# 3 "data/maps/Route16/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, Route16_OnResume
# 4 "data/maps/Route16/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, Route16_OnTransition
# 5 "data/maps/Route16/scripts.pory"
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, Route16_OnWarp
# 6 "data/maps/Route16/scripts.pory"
	.byte 0
# 7 "data/maps/Route16/scripts.pory"

# 8 "data/maps/Route16/scripts.pory"
Route16_OnResume::
# 9 "data/maps/Route16/scripts.pory"
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, Route16_EventScript_RemoveSnorlax
# 10 "data/maps/Route16/scripts.pory"
	end
# 11 "data/maps/Route16/scripts.pory"

# 12 "data/maps/Route16/scripts.pory"
Route16_EventScript_RemoveSnorlax::
# 13 "data/maps/Route16/scripts.pory"
	removeobject VAR_LAST_TALKED
# 14 "data/maps/Route16/scripts.pory"
	return
# 15 "data/maps/Route16/scripts.pory"

# 16 "data/maps/Route16/scripts.pory"
Route16_OnTransition::
# 17 "data/maps/Route16/scripts.pory"
	call_if_eq VAR_MAP_SCENE_ROUTE16, 1, Route16_OnTransitionCyclingRoad
# 18 "data/maps/Route16/scripts.pory"
	end
# 19 "data/maps/Route16/scripts.pory"

# 20 "data/maps/Route16/scripts.pory"
Route16_OnTransitionCyclingRoad::
# 21 "data/maps/Route16/scripts.pory"
	setflag FLAG_SYS_ON_CYCLING_ROAD
# 22 "data/maps/Route16/scripts.pory"
	return
# 23 "data/maps/Route16/scripts.pory"

# 24 "data/maps/Route16/scripts.pory"
Route16_OnWarp::
# 25 "data/maps/Route16/scripts.pory"
	map_script_2 VAR_MAP_SCENE_ROUTE16, 1, Route16_OnWarpCyclingRoad
# 26 "data/maps/Route16/scripts.pory"
	.2byte 0
# 27 "data/maps/Route16/scripts.pory"

# 28 "data/maps/Route16/scripts.pory"
Route16_OnWarpCyclingRoad::
# 29 "data/maps/Route16/scripts.pory"
	special ForcePlayerOntoBike
# 30 "data/maps/Route16/scripts.pory"
	end
# 31 "data/maps/Route16/scripts.pory"

# 32 "data/maps/Route16/scripts.pory"
Route16_EventScript_Snorlax::
# 33 "data/maps/Route16/scripts.pory"
	lock
# 34 "data/maps/Route16/scripts.pory"
	faceplayer
# 35 "data/maps/Route16/scripts.pory"
	goto_if_unset FLAG_GOT_POKE_FLUTE, Route16_EventScript_SnorlaxNoPokeFlute
# 36 "data/maps/Route16/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 37 "data/maps/Route16/scripts.pory"
	special QuestLog_CutRecording
# 38 "data/maps/Route16/scripts.pory"
	msgbox Text_WantToUsePokeFlute, MSGBOX_YESNO
# 39 "data/maps/Route16/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Route16_EventScript_DontUsePokeFlute
# 40 "data/maps/Route16/scripts.pory"
	call EventScript_AwakenSnorlax
# 41 "data/maps/Route16/scripts.pory"
	setwildbattle SPECIES_SNORLAX, 30
# 42 "data/maps/Route16/scripts.pory"
	waitse
# 43 "data/maps/Route16/scripts.pory"
	playmoncry SPECIES_SNORLAX, CRY_MODE_ENCOUNTER
# 44 "data/maps/Route16/scripts.pory"
	delay 40
# 45 "data/maps/Route16/scripts.pory"
	waitmoncry
# 46 "data/maps/Route16/scripts.pory"
	setflag FLAG_HIDE_ROUTE_16_SNORLAX
# 47 "data/maps/Route16/scripts.pory"
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 48 "data/maps/Route16/scripts.pory"
	dowildbattle
# 49 "data/maps/Route16/scripts.pory"
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 50 "data/maps/Route16/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 51 "data/maps/Route16/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, Route16_EventScript_FoughtSnorlax
# 52 "data/maps/Route16/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, Route16_EventScript_FoughtSnorlax
# 53 "data/maps/Route16/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, Route16_EventScript_FoughtSnorlax
# 54 "data/maps/Route16/scripts.pory"
	release
# 55 "data/maps/Route16/scripts.pory"
	end
# 56 "data/maps/Route16/scripts.pory"

# 57 "data/maps/Route16/scripts.pory"
Route16_EventScript_DontUsePokeFlute::
# 58 "data/maps/Route16/scripts.pory"
	release
# 59 "data/maps/Route16/scripts.pory"
	end
# 60 "data/maps/Route16/scripts.pory"

# 61 "data/maps/Route16/scripts.pory"
Route16_EventScript_FoughtSnorlax::
# 62 "data/maps/Route16/scripts.pory"
	msgbox Text_SnorlaxReturnedToMountains
# 63 "data/maps/Route16/scripts.pory"
	release
# 64 "data/maps/Route16/scripts.pory"
	end
# 65 "data/maps/Route16/scripts.pory"

# 66 "data/maps/Route16/scripts.pory"
Route16_EventScript_SnorlaxNoPokeFlute::
# 67 "data/maps/Route16/scripts.pory"
	msgbox Route16_Text_MonSprawledOutInSlumber
# 68 "data/maps/Route16/scripts.pory"
	release
# 69 "data/maps/Route16/scripts.pory"
	end
# 70 "data/maps/Route16/scripts.pory"

# 71 "data/maps/Route16/scripts.pory"
Route16_EventScript_CyclingRoadSign::
# 72 "data/maps/Route16/scripts.pory"
	msgbox Route16_Text_CyclingRoadSign, MSGBOX_SIGN
# 73 "data/maps/Route16/scripts.pory"
	end
# 74 "data/maps/Route16/scripts.pory"

# 75 "data/maps/Route16/scripts.pory"
Route16_EventScript_RouteSign::
# 76 "data/maps/Route16/scripts.pory"
	msgbox Route16_Text_RouteSign, MSGBOX_SIGN
# 77 "data/maps/Route16/scripts.pory"
	end
