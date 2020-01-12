CeruleanCave_B1F_MapScripts:: @ 81624BE
	map_script MAP_SCRIPT_ON_RESUME, CeruleanCave_B1F_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCave_B1F_OnTransition
	.byte 0

CeruleanCave_B1F_OnResume:: @ 81624C9
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, EventScript_1624D3
	end

EventScript_1624D3:: @ 81624D3
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if_ne EventScript_Return
	removeobject VAR_LAST_TALKED
	return

CeruleanCave_B1F_OnTransition:: @ 81624E7
	call_if_unset FLAG_FOUGHT_MEWTWO, EventScript_1624F1
	end

EventScript_1624F1:: @ 81624F1
	clearflag FLAG_HIDE_MEWTWO
	return

CeruleanCave_B1F_EventScript_1624F5:: @ 81624F5
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
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
	special Special_StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if_eq EventScript_162558
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if_eq EventScript_162561
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if_eq EventScript_162561
	setflag FLAG_FOUGHT_MEWTWO
	release
	end

EventScript_162558:: @ 8162558
	setflag FLAG_FOUGHT_MEWTWO
	goto EventScript_RemoveStaticMon

EventScript_162560:: @ 8162560
	end

EventScript_162561:: @ 8162561
	setvar VAR_0x8004, SPECIES_MEWTWO
	goto EventScript_MonFlewAway

EventScript_16256B:: @ 816256B
	end
