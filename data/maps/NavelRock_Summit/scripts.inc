NavelRock_Summit_MapScripts:: @ 8164F9F
	map_script 3, NavelRock_Summit_MapScript1_164FAA
	map_script 5, NavelRock_Summit_MapScript2_164FDD
	.byte 0

NavelRock_Summit_MapScript1_164FAA:: @ 8164FAA
	checkflag FLAG_0x2F3
	call_if 1, EventScript_164FBD
	checkflag FLAG_0x2F3
	call_if 0, EventScript_164FC6
	end

EventScript_164FBD:: @ 8164FBD
	setvar VAR_0x4001, 1
	setflag FLAG_HIDE_HO_OH
	return

EventScript_164FC6:: @ 8164FC6
	setvar VAR_0x4001, 1
	checkflag FLAG_0x2F6
	goto_if_eq EventScript_1A77A9
	setvar VAR_0x4001, 0
	clearflag FLAG_HIDE_HO_OH
	return

NavelRock_Summit_MapScript2_164FDD:: @ 8164FDD
	checkflag FLAG_0x807
	call_if 1, EventScript_164FE7
	end

EventScript_164FE7:: @ 8164FE7
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 7
	goto_if 5, EventScript_1A77A9
	removeobject 1
	return

NavelRock_Summit_EventScript_164FFB:: @ 8164FFB
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lockall
	setvar VAR_0x4001, 1
	special SpawnScriptFieldObject
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 35
	special sub_80CD1B4
	applymovement 1, Movement_1650E0
	applymovement 127, Movement_1650CD
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
	special sub_80CD1B4
	applymovement 127, Movement_1650D1
	applymovement 1, Movement_1650D7
	waitmovement 0
	special RemoveScriptFieldObject
	setvar VAR_0x8004, SPECIES_HO_OH
	setvar VAR_0x8005, 70
	setvar VAR_0x8006, 0
	special CreateObedientEnemyMon
	setflag FLAG_0x807
	special sub_807F9D8
	waitstate
	clearflag FLAG_0x807
	setvar VAR_LAST_TALKED, 1
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_1650B4
	compare_var_to_value VAR_RESULT, 4
	goto_if_eq EventScript_1650C2
	compare_var_to_value VAR_RESULT, 5
	goto_if_eq EventScript_1650C2
	setflag FLAG_0x2F3
	releaseall
	end

EventScript_1650B4:: @ 81650B4
	setflag FLAG_0x2F6
	setvar VAR_0x8004, SPECIES_HO_OH
	goto EventScript_1A9236
	end

EventScript_1650C2:: @ 81650C2
	setvar VAR_0x8004, SPECIES_HO_OH
	goto EventScript_1A9236
	end

Movement_1650CD:: @ 81650CD
	step_11
	step_11
	step_11
	step_end

Movement_1650D1:: @ 81650D1
	step_1c
	step_1c
	step_10
	step_10
	step_10
	step_end

Movement_1650D7:: @ 81650D7
	step_10
	step_10
	step_10
	step_10
	step_10
	step_25
	step_1c
	step_1c
	step_end

Movement_1650E0:: @ 81650E0
	step_1c
	step_1c
	step_25
	step_25
	step_25
	step_25
	step_end
