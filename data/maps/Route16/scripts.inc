Route16_MapScripts:: @ 81680E5
	map_script MAP_SCRIPT_ON_RESUME, Route16_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, Route16_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, Route16_OnWarp
	.byte 0

Route16_OnResume:: @ 81680F5
	checkflag FLAG_SYS_SPECIAL_WILD_BATTLE
	call_if TRUE, EventScript_1680FF
	end

EventScript_1680FF:: @ 81680FF
	removeobject VAR_LAST_TALKED
	return

Route16_OnTransition:: @ 8168103
	compare VAR_MAP_SCENE_ROUTE16, 1
	call_if eq, EventScript_16810F
	end

EventScript_16810F:: @ 816810F
	setflag FLAG_SYS_ON_CYCLING_ROAD
	return

Route16_OnWarp:: @ 8168113
	map_script_2 VAR_MAP_SCENE_ROUTE16, 1, EventScript_16811D
	.2byte 0

EventScript_16811D:: @ 816811D
	special Special_ForcePlayerOntoBike
	end

Route16_EventScript_168121:: @ 8168121
	lock
	faceplayer
	checkflag FLAG_GOT_POKE_FLUTE
	goto_if FALSE, EventScript_1681A3
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	msgbox gUnknown_81853CC, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_168197
	call EventScript_1A924B
	setwildbattle SPECIES_SNORLAX, 30, ITEM_NONE
	waitse
	playmoncry SPECIES_SNORLAX, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_ROUTE_16_SNORLAX
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	dowildbattle
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if eq, EventScript_168199
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if eq, EventScript_168199
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if eq, EventScript_168199
	release
	end

EventScript_168197:: @ 8168197
	release
	end

EventScript_168199:: @ 8168199
	msgbox gUnknown_8185383
	release
	end

EventScript_1681A3:: @ 81681A3
	msgbox gUnknown_8186F3D
	release
	end

Route16_EventScript_1681AD:: @ 81681AD
	msgbox gUnknown_8186F7A, 3
	end

Route16_EventScript_1681B6:: @ 81681B6
	msgbox gUnknown_8186F98, 3
	end
