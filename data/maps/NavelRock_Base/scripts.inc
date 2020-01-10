NavelRock_Base_MapScripts:: @ 81650E7
	map_script MAP_SCRIPT_ON_TRANSITION, NavelRock_Base_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, NavelRock_Base_OnResume
	.byte 0

NavelRock_Base_OnTransition:: @ 81650F2
	call_if_set FLAG_FOUGHT_LUGIA, EventScript_165105
	call_if_unset FLAG_FOUGHT_LUGIA, EventScript_165109
	end

EventScript_165105:: @ 8165105
	setflag FLAG_HIDE_LUGIA
	return

EventScript_165109:: @ 8165109
	goto_if_set FLAG_LUGIA_FLEW_AWAY, EventScript_1A77A9
	clearflag FLAG_HIDE_LUGIA
	return

NavelRock_Base_OnResume:: @ 8165116
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, EventScript_165120
	end

EventScript_165120:: @ 8165120
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if_ne EventScript_1A77A9
	removeobject 1
	return

NavelRock_Base_EventScript_165134:: @ 8165134
	special sub_8110AB4
	compare VAR_RESULT, 2
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
	special Special_StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if_eq EventScript_1651D9
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if_eq EventScript_1651E7
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if_eq EventScript_1651E7
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
