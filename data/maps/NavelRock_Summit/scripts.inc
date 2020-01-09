NavelRock_Summit_MapScripts:: @ 8164F9F
	map_script MAP_SCRIPT_ON_TRANSITION, NavelRock_Summit_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, NavelRock_Summit_OnResume
	.byte 0

NavelRock_Summit_OnTransition:: @ 8164FAA
	checkflag FLAG_FOUGHT_HO_OH
	call_if TRUE, EventScript_164FBD
	checkflag FLAG_FOUGHT_HO_OH
	call_if FALSE, EventScript_164FC6
	end

EventScript_164FBD:: @ 8164FBD
	setvar VAR_TEMP_1, 1
	setflag FLAG_HIDE_HO_OH
	return

EventScript_164FC6:: @ 8164FC6
	setvar VAR_TEMP_1, 1
	checkflag FLAG_HO_OH_FLEW_AWAY
	goto_if TRUE, EventScript_1A77A9
	setvar VAR_TEMP_1, 0
	clearflag FLAG_HIDE_HO_OH
	return

NavelRock_Summit_OnResume:: @ 8164FDD
	checkflag FLAG_SYS_SPECIAL_WILD_BATTLE
	call_if TRUE, EventScript_164FE7
	end

EventScript_164FE7:: @ 8164FE7
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if ne, EventScript_1A77A9
	removeobject 1
	return

NavelRock_Summit_EventScript_164FFB:: @ 8164FFB
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	lockall
	setvar VAR_TEMP_1, 1
	special SpawnCameraObject
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 35
	special Special_LoopWingFlapSound
	applymovement 1, Movement_1650E0
	applymovement OBJ_EVENT_ID_CAMERA, Movement_1650CD
	waitmovement 0
	delay 50
	setweather 0
	doweather
	waitse
	playmoncry SPECIES_HO_OH, 2
	delay 30
	waitmoncry
	delay 60
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 35
	special Special_LoopWingFlapSound
	applymovement OBJ_EVENT_ID_CAMERA, Movement_1650D1
	applymovement 1, Movement_1650D7
	waitmovement 0
	special RemoveCameraObject
	setvar VAR_0x8004, SPECIES_HO_OH
	setvar VAR_0x8005, 70
	setvar VAR_0x8006, 0
	special CreateObedientEnemyMon
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	special Special_StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	setvar VAR_LAST_TALKED, 1
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if eq, EventScript_1650B4
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if eq, EventScript_1650C2
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if eq, EventScript_1650C2
	setflag FLAG_FOUGHT_HO_OH
	releaseall
	end

EventScript_1650B4:: @ 81650B4
	setflag FLAG_HO_OH_FLEW_AWAY
	setvar VAR_0x8004, SPECIES_HO_OH
	goto EventScript_1A9236
	end

EventScript_1650C2:: @ 81650C2
	setvar VAR_0x8004, SPECIES_HO_OH
	goto EventScript_1A9236
	end

Movement_1650CD:: @ 81650CD
	walk_up
	walk_up
	walk_up
	step_end

Movement_1650D1:: @ 81650D1
	delay_16
	delay_16
	walk_down
	walk_down
	walk_down
	step_end

Movement_1650D7:: @ 81650D7
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_in_place_down
	delay_16
	delay_16
	step_end

Movement_1650E0:: @ 81650E0
	delay_16
	delay_16
	walk_in_place_down
	walk_in_place_down
	walk_in_place_down
	walk_in_place_down
	step_end
