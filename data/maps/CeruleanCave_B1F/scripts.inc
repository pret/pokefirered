CeruleanCave_B1F_MapScripts:: @ 81624BE
	map_script MAP_SCRIPT_ON_RESUME, CeruleanCave_B1F_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCave_B1F_OnTransition
	.byte 0

CeruleanCave_B1F_OnResume:: @ 81624C9
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, CeruleanCave_B1F_EventScript_TryRemoveMewtwo
	end

CeruleanCave_B1F_EventScript_TryRemoveMewtwo:: @ 81624D3
	specialvar VAR_RESULT, GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if_ne EventScript_Return
	removeobject VAR_LAST_TALKED
	return

CeruleanCave_B1F_OnTransition:: @ 81624E7
	call_if_unset FLAG_FOUGHT_MEWTWO, CeruleanCave_B1F_EventScript_ShowMewtwo
	end

CeruleanCave_B1F_EventScript_ShowMewtwo:: @ 81624F1
	clearflag FLAG_HIDE_MEWTWO
	return

CeruleanCave_B1F_EventScript_Mewtwo:: @ 81624F5
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MEWTWO, 2
	message CeruleanCave_B1F_Text_Mew
	waitmessage
	waitmoncry
	delay 20
	playbgm MUS_ENCOUNTER_GYM_LEADER, 0
	waitbuttonpress
	setwildbattle SPECIES_MEWTWO, 70, ITEM_NONE
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	special StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if_eq CeruleanCave_B1F_EventScript_DefeatedMewtwo
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if_eq CeruleanCave_B1F_EventScript_RanFromMewtwo
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if_eq CeruleanCave_B1F_EventScript_RanFromMewtwo
	setflag FLAG_FOUGHT_MEWTWO
	release
	end

CeruleanCave_B1F_EventScript_DefeatedMewtwo:: @ 8162558
	setflag FLAG_FOUGHT_MEWTWO
	goto EventScript_RemoveStaticMon
	end

CeruleanCave_B1F_EventScript_RanFromMewtwo:: @ 8162561
	setvar VAR_0x8004, SPECIES_MEWTWO
	goto EventScript_MonFlewAway
	end
