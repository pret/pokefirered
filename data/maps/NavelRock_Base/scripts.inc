NavelRock_Base_MapScripts:: @ 81650E7
	map_script 3, NavelRock_Base_MapScript1_1650F2
	map_script 5, NavelRock_Base_MapScript2_165116
	.byte 0

NavelRock_Base_MapScript1_1650F2:: @ 81650F2
	checkflag FLAG_0x2F2
	call_if eq, EventScript_165105
	checkflag FLAG_0x2F2
	call_if lt, EventScript_165109
	end

EventScript_165105:: @ 8165105
	setflag FLAG_HIDE_LUGIA
	return

EventScript_165109:: @ 8165109
	checkflag FLAG_0x2F5
	goto_if_eq EventScript_1A77A9
	clearflag FLAG_HIDE_LUGIA
	return

NavelRock_Base_MapScript2_165116:: @ 8165116
	checkflag FLAG_0x807
	call_if eq, EventScript_165120
	end

EventScript_165120:: @ 8165120
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 7
	goto_if ne, EventScript_1A77A9
	removeobject 1
	return

NavelRock_Base_EventScript_165134:: @ 8165134
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	waitse
	delay 20
	playse SE_T_AME_E
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 3
	setvar VAR_0x8006, 4
	setvar VAR_0x8007, 2
	special sub_80CAC28
	delay 30
	playse SE_T_AME_E
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 3
	setvar VAR_0x8006, 4
	setvar VAR_0x8007, 2
	special sub_80CAC28
	delay 30
	delay 50
	waitse
	playmoncry SPECIES_LUGIA, 2
	waitmoncry
	delay 20
	setvar VAR_0x8004, SPECIES_LUGIA
	setvar VAR_0x8005, 70
	setvar VAR_0x8006, 0
	special CreateObedientEnemyMon
	setflag FLAG_0x807
	special sub_807F9D8
	waitstate
	clearflag FLAG_0x807
	specialvar VAR_RESULT, sub_80CA74C
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_1651D9
	compare_var_to_value VAR_RESULT, 4
	goto_if_eq EventScript_1651E7
	compare_var_to_value VAR_RESULT, 5
	goto_if_eq EventScript_1651E7
	setflag FLAG_0x2F2
	release
	end

EventScript_1651D9:: @ 81651D9
	setflag FLAG_0x2F5
	setvar VAR_0x8004, SPECIES_LUGIA
	goto EventScript_1A9236
	end

EventScript_1651E7:: @ 81651E7
	setvar VAR_0x8004, SPECIES_LUGIA
	goto EventScript_1A9236
	end
