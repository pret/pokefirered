NavelRock_Base_MapScripts:: @ 81650E7
	map_script 3, NavelRock_Base_MapScript1_1650F2
	map_script 5, NavelRock_Base_MapScript2_165116
	.byte 0

NavelRock_Base_MapScript1_1650F2:: @ 81650F2
	checkflag FLAG_FOUGHT_LUGIA
	call_if TRUE, EventScript_165105
	checkflag FLAG_FOUGHT_LUGIA
	call_if FALSE, EventScript_165109
	end

EventScript_165105:: @ 8165105
	setflag FLAG_HIDE_LUGIA
	return

EventScript_165109:: @ 8165109
	checkflag FLAG_LUGIA_FLEW_AWAY
	goto_if TRUE, EventScript_1A77A9
	clearflag FLAG_HIDE_LUGIA
	return

NavelRock_Base_MapScript2_165116:: @ 8165116
	checkflag FLAG_SYS_SPECIAL_WILD_BATTLE
	call_if TRUE, EventScript_165120
	end

EventScript_165120:: @ 8165120
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare_var_to_value VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if ne, EventScript_1A77A9
	removeobject 1
	return

NavelRock_Base_EventScript_165134:: @ 8165134
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
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
	special Special_ShakeScreen
	delay 30
	playse SE_T_AME_E
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 3
	setvar VAR_0x8006, 4
	setvar VAR_0x8007, 2
	special Special_ShakeScreen
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
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	special sub_807F9D8
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare_var_to_value VAR_RESULT, B_OUTCOME_WON
	goto_if eq, EventScript_1651D9
	compare_var_to_value VAR_RESULT, B_OUTCOME_RAN
	goto_if eq, EventScript_1651E7
	compare_var_to_value VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if eq, EventScript_1651E7
	setflag FLAG_FOUGHT_LUGIA
	release
	end

EventScript_1651D9:: @ 81651D9
	setflag FLAG_LUGIA_FLEW_AWAY
	setvar VAR_0x8004, SPECIES_LUGIA
	goto EventScript_1A9236
	end

EventScript_1651E7:: @ 81651E7
	setvar VAR_0x8004, SPECIES_LUGIA
	goto EventScript_1A9236
	end
