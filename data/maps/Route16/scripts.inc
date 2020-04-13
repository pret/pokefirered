Route16_MapScripts:: @ 81680E5
	map_script MAP_SCRIPT_ON_RESUME, Route16_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, Route16_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, Route16_OnWarp
	.byte 0

Route16_OnResume:: @ 81680F5
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, Route16_EventScript_RemoveSnorlax
	end

Route16_EventScript_RemoveSnorlax:: @ 81680FF
	removeobject VAR_LAST_TALKED
	return

Route16_OnTransition:: @ 8168103
	compare VAR_MAP_SCENE_ROUTE16, 1
	call_if_eq Route16_OnTransitionCyclingRoad
	end

Route16_OnTransitionCyclingRoad:: @ 816810F
	setflag FLAG_SYS_ON_CYCLING_ROAD
	return

Route16_OnWarp:: @ 8168113
	map_script_2 VAR_MAP_SCENE_ROUTE16, 1, Route16_OnWarpCyclingRoad
	.2byte 0

Route16_OnWarpCyclingRoad:: @ 816811D
	special ForcePlayerOntoBike
	end

Route16_EventScript_Snorlax:: @ 8168121
	lock
	faceplayer
	goto_if_unset FLAG_GOT_POKE_FLUTE, Route16_EventScript_SnorlaxNoPokeFlute
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	msgbox Text_WantToUsePokeFlute, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq Route16_EventScript_DontUsePokeFlute
	call EventScript_AwakenSnorlax
	setwildbattle SPECIES_SNORLAX, 30, ITEM_NONE
	waitse
	playmoncry SPECIES_SNORLAX, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_ROUTE_16_SNORLAX
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	dowildbattle
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if_eq Route16_EventScript_FoughtSnorlax
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if_eq Route16_EventScript_FoughtSnorlax
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if_eq Route16_EventScript_FoughtSnorlax
	release
	end

Route16_EventScript_DontUsePokeFlute:: @ 8168197
	release
	end

Route16_EventScript_FoughtSnorlax:: @ 8168199
	msgbox Text_SnorlaxReturnedToMountains
	release
	end

Route16_EventScript_SnorlaxNoPokeFlute:: @ 81681A3
	msgbox Route16_Text_MonSprawledOutInSlumber
	release
	end

Route16_EventScript_CyclingRoadSign:: @ 81681AD
	msgbox Route16_Text_CyclingRoadSign, MSGBOX_SIGN
	end

Route16_EventScript_RouteSign:: @ 81681B6
	msgbox Route16_Text_RouteSign, MSGBOX_SIGN
	end
