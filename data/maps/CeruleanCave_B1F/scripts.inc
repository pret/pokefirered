CeruleanCave_B1F_MapScripts:: @ 81624BE
	map_script 5, CeruleanCave_B1F_MapScript1_1624C9
	map_script 3, CeruleanCave_B1F_MapScript2_1624E7
	.byte 0

CeruleanCave_B1F_MapScript1_1624C9:: @ 81624C9
	checkflag FLAG_SYS_SPECIAL_WILD_BATTLE
	call_if TRUE, EventScript_1624D3
	end

EventScript_1624D3:: @ 81624D3
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare_var_to_value VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if ne, EventScript_1A77A9
	removeobject VAR_LAST_TALKED
	return

CeruleanCave_B1F_MapScript2_1624E7:: @ 81624E7
	checkflag FLAG_FOUGHT_MEWTWO
	call_if FALSE, EventScript_1624F1
	end

EventScript_1624F1:: @ 81624F1
	clearflag FLAG_HIDE_MEWTWO
	return

CeruleanCave_B1F_EventScript_1624F5:: @ 81624F5
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MEWTWO, 2
	message Text_177F9F
	waitmessage
	waitmoncry
	delay 20
	playbgm MUS_EXEYE, 0
	waitbuttonpress
	setwildbattle SPECIES_MEWTWO, 70, ITEM_NONE
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	special BattleSetup_StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare_var_to_value VAR_RESULT, B_OUTCOME_WON
	goto_if eq, EventScript_162558
	compare_var_to_value VAR_RESULT, B_OUTCOME_RAN
	goto_if eq, EventScript_162561
	compare_var_to_value VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if eq, EventScript_162561
	setflag FLAG_FOUGHT_MEWTWO
	release
	end

EventScript_162558:: @ 8162558
	setflag FLAG_FOUGHT_MEWTWO
	goto EventScript_1A922D

EventScript_162560:: @ 8162560
	end

EventScript_162561:: @ 8162561
	setvar VAR_0x8004, SPECIES_MEWTWO
	goto EventScript_1A9236

EventScript_16256B:: @ 816256B
	end
