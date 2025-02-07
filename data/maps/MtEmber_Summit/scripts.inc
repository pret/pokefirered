# 1 "data/maps/MtEmber_Summit/scripts.pory"

# 2 "data/maps/MtEmber_Summit/scripts.pory"
MtEmber_Summit_MapScripts::
# 3 "data/maps/MtEmber_Summit/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, MtEmber_Summit_OnTransition
# 4 "data/maps/MtEmber_Summit/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, MtEmber_Summit_OnResume
# 5 "data/maps/MtEmber_Summit/scripts.pory"
	.byte 0
# 6 "data/maps/MtEmber_Summit/scripts.pory"

# 7 "data/maps/MtEmber_Summit/scripts.pory"
MtEmber_Summit_OnResume::
# 8 "data/maps/MtEmber_Summit/scripts.pory"
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, MtEmber_Summit_EventScript_TryRemoveMoltres
# 9 "data/maps/MtEmber_Summit/scripts.pory"
	end
# 10 "data/maps/MtEmber_Summit/scripts.pory"

# 11 "data/maps/MtEmber_Summit/scripts.pory"
MtEmber_Summit_EventScript_TryRemoveMoltres::
# 12 "data/maps/MtEmber_Summit/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 13 "data/maps/MtEmber_Summit/scripts.pory"
	goto_if_ne VAR_RESULT, B_OUTCOME_CAUGHT, EventScript_Return
# 14 "data/maps/MtEmber_Summit/scripts.pory"
	removeobject VAR_LAST_TALKED
# 15 "data/maps/MtEmber_Summit/scripts.pory"
	return
# 16 "data/maps/MtEmber_Summit/scripts.pory"

# 17 "data/maps/MtEmber_Summit/scripts.pory"
MtEmber_Summit_OnTransition::
# 18 "data/maps/MtEmber_Summit/scripts.pory"
	call_if_unset FLAG_FOUGHT_MOLTRES, MtEmber_Summit_EventScript_ShowMoltres
# 19 "data/maps/MtEmber_Summit/scripts.pory"
	end
# 20 "data/maps/MtEmber_Summit/scripts.pory"

# 21 "data/maps/MtEmber_Summit/scripts.pory"
MtEmber_Summit_EventScript_ShowMoltres::
# 22 "data/maps/MtEmber_Summit/scripts.pory"
	clearflag FLAG_HIDE_MOLTRES
# 23 "data/maps/MtEmber_Summit/scripts.pory"
	return
# 24 "data/maps/MtEmber_Summit/scripts.pory"

# 25 "data/maps/MtEmber_Summit/scripts.pory"
MtEmber_Summit_EventScript_Moltres::
# 26 "data/maps/MtEmber_Summit/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 27 "data/maps/MtEmber_Summit/scripts.pory"
	special QuestLog_CutRecording
# 28 "data/maps/MtEmber_Summit/scripts.pory"
	lock
# 29 "data/maps/MtEmber_Summit/scripts.pory"
	faceplayer
# 30 "data/maps/MtEmber_Summit/scripts.pory"
	setwildbattle SPECIES_MOLTRES, 50
# 31 "data/maps/MtEmber_Summit/scripts.pory"
	waitse
# 32 "data/maps/MtEmber_Summit/scripts.pory"
	playmoncry SPECIES_MOLTRES, CRY_MODE_ENCOUNTER
# 33 "data/maps/MtEmber_Summit/scripts.pory"
	message Text_Gyaoo
# 34 "data/maps/MtEmber_Summit/scripts.pory"
	waitmessage
# 35 "data/maps/MtEmber_Summit/scripts.pory"
	waitmoncry
# 36 "data/maps/MtEmber_Summit/scripts.pory"
	delay 10
# 37 "data/maps/MtEmber_Summit/scripts.pory"
	playbgm MUS_ENCOUNTER_GYM_LEADER, 0
# 38 "data/maps/MtEmber_Summit/scripts.pory"
	waitbuttonpress
# 39 "data/maps/MtEmber_Summit/scripts.pory"
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 40 "data/maps/MtEmber_Summit/scripts.pory"
	special StartLegendaryBattle
# 41 "data/maps/MtEmber_Summit/scripts.pory"
	waitstate
# 42 "data/maps/MtEmber_Summit/scripts.pory"
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 43 "data/maps/MtEmber_Summit/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 44 "data/maps/MtEmber_Summit/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, MtEmber_Summit_EventScript_DefeatedMoltres
# 45 "data/maps/MtEmber_Summit/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, MtEmber_Summit_EventScript_RanFromMoltres
# 46 "data/maps/MtEmber_Summit/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, MtEmber_Summit_EventScript_RanFromMoltres
# 47 "data/maps/MtEmber_Summit/scripts.pory"
	setflag FLAG_FOUGHT_MOLTRES
# 48 "data/maps/MtEmber_Summit/scripts.pory"
	release
# 49 "data/maps/MtEmber_Summit/scripts.pory"
	end
# 50 "data/maps/MtEmber_Summit/scripts.pory"

# 51 "data/maps/MtEmber_Summit/scripts.pory"
MtEmber_Summit_EventScript_DefeatedMoltres::
# 52 "data/maps/MtEmber_Summit/scripts.pory"
	setflag FLAG_FOUGHT_MOLTRES
# 53 "data/maps/MtEmber_Summit/scripts.pory"
	goto EventScript_RemoveStaticMon
# 54 "data/maps/MtEmber_Summit/scripts.pory"
	end
# 55 "data/maps/MtEmber_Summit/scripts.pory"

# 56 "data/maps/MtEmber_Summit/scripts.pory"
MtEmber_Summit_EventScript_RanFromMoltres::
# 57 "data/maps/MtEmber_Summit/scripts.pory"
	setvar VAR_0x8004, SPECIES_MOLTRES
# 58 "data/maps/MtEmber_Summit/scripts.pory"
	goto EventScript_MonFlewAway
# 59 "data/maps/MtEmber_Summit/scripts.pory"
	end
