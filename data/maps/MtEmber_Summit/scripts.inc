MtEmber_Summit_MapScripts:: @ 8163AFC
	map_script 3, MtEmber_Summit_MapScript1_163B25
	map_script 5, MtEmber_Summit_MapScript2_163B07
	.byte 0

MtEmber_Summit_MapScript2_163B07:: @ 8163B07
	checkflag FLAG_SYS_SPECIAL_WILD_BATTLE
	call_if TRUE, EventScript_163B11
	end

EventScript_163B11:: @ 8163B11
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if ne, EventScript_1A77A9
	removeobject VAR_LAST_TALKED
	return

MtEmber_Summit_MapScript1_163B25:: @ 8163B25
	checkflag FLAG_FOUGHT_MOLTRES
	call_if FALSE, EventScript_163B2F
	end

EventScript_163B2F:: @ 8163B2F
	clearflag FLAG_HIDE_MOLTRES
	return

MtEmber_Summit_EventScript_163B33:: @ 8163B33
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	setwildbattle SPECIES_MOLTRES, 50, ITEM_NONE
	waitse
	playmoncry SPECIES_MOLTRES, 2
	message Text_1A6448
	waitmessage
	waitmoncry
	delay 10
	playbgm MUS_EXEYE, 0
	waitbuttonpress
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	special Special_StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if eq, EventScript_163B96
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if eq, EventScript_163B9F
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if eq, EventScript_163B9F
	setflag FLAG_FOUGHT_MOLTRES
	release
	end

EventScript_163B96:: @ 8163B96
	setflag FLAG_FOUGHT_MOLTRES
	goto EventScript_1A922D
	end

EventScript_163B9F:: @ 8163B9F
	setvar VAR_0x8004, SPECIES_MOLTRES
	goto EventScript_1A9236
	end
