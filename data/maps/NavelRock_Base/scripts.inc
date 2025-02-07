# 1 "data/maps/NavelRock_Base/scripts.pory"

# 2 "data/maps/NavelRock_Base/scripts.pory"
.set LOCALID_LUGIA, 1
# 3 "data/maps/NavelRock_Base/scripts.pory"

# 4 "data/maps/NavelRock_Base/scripts.pory"
NavelRock_Base_MapScripts::
# 5 "data/maps/NavelRock_Base/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, NavelRock_Base_OnTransition
# 6 "data/maps/NavelRock_Base/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, NavelRock_Base_OnResume
# 7 "data/maps/NavelRock_Base/scripts.pory"
	.byte 0
# 8 "data/maps/NavelRock_Base/scripts.pory"

# 9 "data/maps/NavelRock_Base/scripts.pory"
NavelRock_Base_OnTransition::
# 10 "data/maps/NavelRock_Base/scripts.pory"
	call_if_set FLAG_FOUGHT_LUGIA, NavelRock_Base_EventScript_HideLugia
# 11 "data/maps/NavelRock_Base/scripts.pory"
	call_if_unset FLAG_FOUGHT_LUGIA, NavelRock_Base_EventScript_TryShowLugia
# 12 "data/maps/NavelRock_Base/scripts.pory"
	end
# 13 "data/maps/NavelRock_Base/scripts.pory"

# 14 "data/maps/NavelRock_Base/scripts.pory"
NavelRock_Base_EventScript_HideLugia::
# 15 "data/maps/NavelRock_Base/scripts.pory"
	setflag FLAG_HIDE_LUGIA
# 16 "data/maps/NavelRock_Base/scripts.pory"
	return
# 17 "data/maps/NavelRock_Base/scripts.pory"

# 18 "data/maps/NavelRock_Base/scripts.pory"
NavelRock_Base_EventScript_TryShowLugia::
# 19 "data/maps/NavelRock_Base/scripts.pory"
	goto_if_set FLAG_LUGIA_FLEW_AWAY, EventScript_Return
# 20 "data/maps/NavelRock_Base/scripts.pory"
	clearflag FLAG_HIDE_LUGIA
# 21 "data/maps/NavelRock_Base/scripts.pory"
	return
# 22 "data/maps/NavelRock_Base/scripts.pory"

# 23 "data/maps/NavelRock_Base/scripts.pory"
NavelRock_Base_OnResume::
# 24 "data/maps/NavelRock_Base/scripts.pory"
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, NavelRock_Base_EventScript_TryRemoveLugia
# 25 "data/maps/NavelRock_Base/scripts.pory"
	end
# 26 "data/maps/NavelRock_Base/scripts.pory"

# 27 "data/maps/NavelRock_Base/scripts.pory"
NavelRock_Base_EventScript_TryRemoveLugia::
# 28 "data/maps/NavelRock_Base/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 29 "data/maps/NavelRock_Base/scripts.pory"
	goto_if_ne VAR_RESULT, B_OUTCOME_CAUGHT, EventScript_Return
# 30 "data/maps/NavelRock_Base/scripts.pory"
	removeobject LOCALID_LUGIA
# 31 "data/maps/NavelRock_Base/scripts.pory"
	return
# 32 "data/maps/NavelRock_Base/scripts.pory"

# 33 "data/maps/NavelRock_Base/scripts.pory"
NavelRock_Base_EventScript_Lugia::
# 34 "data/maps/NavelRock_Base/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 35 "data/maps/NavelRock_Base/scripts.pory"
	special QuestLog_CutRecording
# 36 "data/maps/NavelRock_Base/scripts.pory"
	lock
# 37 "data/maps/NavelRock_Base/scripts.pory"
	faceplayer
# 38 "data/maps/NavelRock_Base/scripts.pory"
	waitse
# 39 "data/maps/NavelRock_Base/scripts.pory"
	delay 20
# 40 "data/maps/NavelRock_Base/scripts.pory"
	playse SE_THUNDERSTORM_STOP
# 41 "data/maps/NavelRock_Base/scripts.pory"
	setvar VAR_0x8004, 0  @ Vertical pan
# 42 "data/maps/NavelRock_Base/scripts.pory"
	setvar VAR_0x8005, 3  @ Horizontal pan
# 43 "data/maps/NavelRock_Base/scripts.pory"
	setvar VAR_0x8006, 4  @ Num shakes
# 44 "data/maps/NavelRock_Base/scripts.pory"
	setvar VAR_0x8007, 2  @ Shake delay
# 45 "data/maps/NavelRock_Base/scripts.pory"
	special ShakeScreen
# 46 "data/maps/NavelRock_Base/scripts.pory"
	delay 30
# 47 "data/maps/NavelRock_Base/scripts.pory"
	playse SE_THUNDERSTORM_STOP
# 48 "data/maps/NavelRock_Base/scripts.pory"
	setvar VAR_0x8004, 0  @ Vertical pan
# 49 "data/maps/NavelRock_Base/scripts.pory"
	setvar VAR_0x8005, 3  @ Horizontal pan
# 50 "data/maps/NavelRock_Base/scripts.pory"
	setvar VAR_0x8006, 4  @ Num shakes
# 51 "data/maps/NavelRock_Base/scripts.pory"
	setvar VAR_0x8007, 2  @ Shake delay
# 52 "data/maps/NavelRock_Base/scripts.pory"
	special ShakeScreen
# 53 "data/maps/NavelRock_Base/scripts.pory"
	delay 30
# 54 "data/maps/NavelRock_Base/scripts.pory"
	delay 50
# 55 "data/maps/NavelRock_Base/scripts.pory"
	waitse
# 56 "data/maps/NavelRock_Base/scripts.pory"
	playmoncry SPECIES_LUGIA, CRY_MODE_ENCOUNTER
# 57 "data/maps/NavelRock_Base/scripts.pory"
	waitmoncry
# 58 "data/maps/NavelRock_Base/scripts.pory"
	delay 20
# 59 "data/maps/NavelRock_Base/scripts.pory"
	seteventmon SPECIES_LUGIA, 70
# 60 "data/maps/NavelRock_Base/scripts.pory"
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 61 "data/maps/NavelRock_Base/scripts.pory"
	special StartLegendaryBattle
# 62 "data/maps/NavelRock_Base/scripts.pory"
	waitstate
# 63 "data/maps/NavelRock_Base/scripts.pory"
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 64 "data/maps/NavelRock_Base/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 65 "data/maps/NavelRock_Base/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, NavelRock_Base_EventScript_DefeatedLugia
# 66 "data/maps/NavelRock_Base/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, NavelRock_Base_EventScript_RanFromLugia
# 67 "data/maps/NavelRock_Base/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, NavelRock_Base_EventScript_RanFromLugia
# 68 "data/maps/NavelRock_Base/scripts.pory"
	setflag FLAG_FOUGHT_LUGIA
# 69 "data/maps/NavelRock_Base/scripts.pory"
	release
# 70 "data/maps/NavelRock_Base/scripts.pory"
	end
# 71 "data/maps/NavelRock_Base/scripts.pory"

# 72 "data/maps/NavelRock_Base/scripts.pory"
NavelRock_Base_EventScript_DefeatedLugia::
# 73 "data/maps/NavelRock_Base/scripts.pory"
	setflag FLAG_LUGIA_FLEW_AWAY
# 74 "data/maps/NavelRock_Base/scripts.pory"
	setvar VAR_0x8004, SPECIES_LUGIA
# 75 "data/maps/NavelRock_Base/scripts.pory"
	goto EventScript_MonFlewAway
# 76 "data/maps/NavelRock_Base/scripts.pory"
	end
# 77 "data/maps/NavelRock_Base/scripts.pory"

# 78 "data/maps/NavelRock_Base/scripts.pory"
NavelRock_Base_EventScript_RanFromLugia::
# 79 "data/maps/NavelRock_Base/scripts.pory"
	setvar VAR_0x8004, SPECIES_LUGIA
# 80 "data/maps/NavelRock_Base/scripts.pory"
	goto EventScript_MonFlewAway
# 81 "data/maps/NavelRock_Base/scripts.pory"
	end
