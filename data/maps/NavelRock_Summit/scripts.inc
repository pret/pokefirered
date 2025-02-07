# 1 "data/maps/NavelRock_Summit/scripts.pory"

# 2 "data/maps/NavelRock_Summit/scripts.pory"
.set LOCALID_HO_OH, 1
# 3 "data/maps/NavelRock_Summit/scripts.pory"

# 4 "data/maps/NavelRock_Summit/scripts.pory"
NavelRock_Summit_MapScripts::
# 5 "data/maps/NavelRock_Summit/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, NavelRock_Summit_OnTransition
# 6 "data/maps/NavelRock_Summit/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, NavelRock_Summit_OnResume
# 7 "data/maps/NavelRock_Summit/scripts.pory"
	.byte 0
# 8 "data/maps/NavelRock_Summit/scripts.pory"

# 9 "data/maps/NavelRock_Summit/scripts.pory"
NavelRock_Summit_OnTransition::
# 10 "data/maps/NavelRock_Summit/scripts.pory"
	call_if_set FLAG_FOUGHT_HO_OH, NavelRock_Summit_EventScript_HideHoOh
# 11 "data/maps/NavelRock_Summit/scripts.pory"
	call_if_unset FLAG_FOUGHT_HO_OH, NavelRock_Summit_EventScript_TryShowHoOh
# 12 "data/maps/NavelRock_Summit/scripts.pory"
	end
# 13 "data/maps/NavelRock_Summit/scripts.pory"

# 14 "data/maps/NavelRock_Summit/scripts.pory"
NavelRock_Summit_EventScript_HideHoOh::
# 15 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_TEMP_1, 1
# 16 "data/maps/NavelRock_Summit/scripts.pory"
	setflag FLAG_HIDE_HO_OH
# 17 "data/maps/NavelRock_Summit/scripts.pory"
	return
# 18 "data/maps/NavelRock_Summit/scripts.pory"

# 19 "data/maps/NavelRock_Summit/scripts.pory"
NavelRock_Summit_EventScript_TryShowHoOh::
# 20 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_TEMP_1, 1
# 21 "data/maps/NavelRock_Summit/scripts.pory"
	goto_if_set FLAG_HO_OH_FLEW_AWAY, EventScript_Return
# 22 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_TEMP_1, 0
# 23 "data/maps/NavelRock_Summit/scripts.pory"
	clearflag FLAG_HIDE_HO_OH
# 24 "data/maps/NavelRock_Summit/scripts.pory"
	return
# 25 "data/maps/NavelRock_Summit/scripts.pory"

# 26 "data/maps/NavelRock_Summit/scripts.pory"
NavelRock_Summit_OnResume::
# 27 "data/maps/NavelRock_Summit/scripts.pory"
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, NavelRock_Summit_EventScript_TryRemoveHoOh
# 28 "data/maps/NavelRock_Summit/scripts.pory"
	end
# 29 "data/maps/NavelRock_Summit/scripts.pory"

# 30 "data/maps/NavelRock_Summit/scripts.pory"
NavelRock_Summit_EventScript_TryRemoveHoOh::
# 31 "data/maps/NavelRock_Summit/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 32 "data/maps/NavelRock_Summit/scripts.pory"
	goto_if_ne VAR_RESULT, B_OUTCOME_CAUGHT, EventScript_Return
# 33 "data/maps/NavelRock_Summit/scripts.pory"
	removeobject LOCALID_HO_OH
# 34 "data/maps/NavelRock_Summit/scripts.pory"
	return
# 35 "data/maps/NavelRock_Summit/scripts.pory"

# 36 "data/maps/NavelRock_Summit/scripts.pory"
NavelRock_Summit_EventScript_HoOh::
# 37 "data/maps/NavelRock_Summit/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 38 "data/maps/NavelRock_Summit/scripts.pory"
	special QuestLog_CutRecording
# 39 "data/maps/NavelRock_Summit/scripts.pory"
	lockall
# 40 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_TEMP_1, 1
# 41 "data/maps/NavelRock_Summit/scripts.pory"
	special SpawnCameraObject
# 42 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_0x8004, 3  @ Num loops
# 43 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_0x8005, 35 @ Delay
# 44 "data/maps/NavelRock_Summit/scripts.pory"
	special LoopWingFlapSound
# 45 "data/maps/NavelRock_Summit/scripts.pory"
	applymovement LOCALID_HO_OH, Movement_HoOhAppear
# 46 "data/maps/NavelRock_Summit/scripts.pory"
	applymovement OBJ_EVENT_ID_CAMERA, Movement_CameraPanUp
# 47 "data/maps/NavelRock_Summit/scripts.pory"
	waitmovement 0
# 48 "data/maps/NavelRock_Summit/scripts.pory"
	delay 50
# 49 "data/maps/NavelRock_Summit/scripts.pory"
	setweather 0
# 50 "data/maps/NavelRock_Summit/scripts.pory"
	doweather
# 51 "data/maps/NavelRock_Summit/scripts.pory"
	waitse
# 52 "data/maps/NavelRock_Summit/scripts.pory"
	playmoncry SPECIES_HO_OH, CRY_MODE_ENCOUNTER
# 53 "data/maps/NavelRock_Summit/scripts.pory"
	delay 30
# 54 "data/maps/NavelRock_Summit/scripts.pory"
	waitmoncry
# 55 "data/maps/NavelRock_Summit/scripts.pory"
	delay 60
# 56 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_0x8004, 3  @ Num loops
# 57 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_0x8005, 35 @ Delay
# 58 "data/maps/NavelRock_Summit/scripts.pory"
	special LoopWingFlapSound
# 59 "data/maps/NavelRock_Summit/scripts.pory"
	applymovement OBJ_EVENT_ID_CAMERA, Movement_CameraPanDown
# 60 "data/maps/NavelRock_Summit/scripts.pory"
	applymovement LOCALID_HO_OH, Movement_HoOhApproach
# 61 "data/maps/NavelRock_Summit/scripts.pory"
	waitmovement 0
# 62 "data/maps/NavelRock_Summit/scripts.pory"
	special RemoveCameraObject
# 63 "data/maps/NavelRock_Summit/scripts.pory"
	seteventmon SPECIES_HO_OH, 70
# 64 "data/maps/NavelRock_Summit/scripts.pory"
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 65 "data/maps/NavelRock_Summit/scripts.pory"
	special StartLegendaryBattle
# 66 "data/maps/NavelRock_Summit/scripts.pory"
	waitstate
# 67 "data/maps/NavelRock_Summit/scripts.pory"
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 68 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_HO_OH
# 69 "data/maps/NavelRock_Summit/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 70 "data/maps/NavelRock_Summit/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, NavelRock_Summit_EventScript_DefeatedHoOh
# 71 "data/maps/NavelRock_Summit/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, NavelRock_Summit_EventScript_RanFromHoOh
# 72 "data/maps/NavelRock_Summit/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, NavelRock_Summit_EventScript_RanFromHoOh
# 73 "data/maps/NavelRock_Summit/scripts.pory"
	setflag FLAG_FOUGHT_HO_OH
# 74 "data/maps/NavelRock_Summit/scripts.pory"
	releaseall
# 75 "data/maps/NavelRock_Summit/scripts.pory"
	end
# 76 "data/maps/NavelRock_Summit/scripts.pory"

# 77 "data/maps/NavelRock_Summit/scripts.pory"
NavelRock_Summit_EventScript_DefeatedHoOh::
# 78 "data/maps/NavelRock_Summit/scripts.pory"
	setflag FLAG_HO_OH_FLEW_AWAY
# 79 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_0x8004, SPECIES_HO_OH
# 80 "data/maps/NavelRock_Summit/scripts.pory"
	goto EventScript_MonFlewAway
# 81 "data/maps/NavelRock_Summit/scripts.pory"
	end
# 82 "data/maps/NavelRock_Summit/scripts.pory"

# 83 "data/maps/NavelRock_Summit/scripts.pory"
NavelRock_Summit_EventScript_RanFromHoOh::
# 84 "data/maps/NavelRock_Summit/scripts.pory"
	setvar VAR_0x8004, SPECIES_HO_OH
# 85 "data/maps/NavelRock_Summit/scripts.pory"
	goto EventScript_MonFlewAway
# 86 "data/maps/NavelRock_Summit/scripts.pory"
	end
# 87 "data/maps/NavelRock_Summit/scripts.pory"

# 88 "data/maps/NavelRock_Summit/scripts.pory"
Movement_CameraPanUp:
# 89 "data/maps/NavelRock_Summit/scripts.pory"
	walk_up
# 90 "data/maps/NavelRock_Summit/scripts.pory"
	walk_up
# 91 "data/maps/NavelRock_Summit/scripts.pory"
	walk_up
# 92 "data/maps/NavelRock_Summit/scripts.pory"
	step_end
# 93 "data/maps/NavelRock_Summit/scripts.pory"

# 94 "data/maps/NavelRock_Summit/scripts.pory"
Movement_CameraPanDown:
# 95 "data/maps/NavelRock_Summit/scripts.pory"
	delay_16
# 96 "data/maps/NavelRock_Summit/scripts.pory"
	delay_16
# 97 "data/maps/NavelRock_Summit/scripts.pory"
	walk_down
# 98 "data/maps/NavelRock_Summit/scripts.pory"
	walk_down
# 99 "data/maps/NavelRock_Summit/scripts.pory"
	walk_down
# 100 "data/maps/NavelRock_Summit/scripts.pory"
	step_end
# 101 "data/maps/NavelRock_Summit/scripts.pory"

# 102 "data/maps/NavelRock_Summit/scripts.pory"
Movement_HoOhApproach:
# 103 "data/maps/NavelRock_Summit/scripts.pory"
	walk_down
# 104 "data/maps/NavelRock_Summit/scripts.pory"
	walk_down
# 105 "data/maps/NavelRock_Summit/scripts.pory"
	walk_down
# 106 "data/maps/NavelRock_Summit/scripts.pory"
	walk_down
# 107 "data/maps/NavelRock_Summit/scripts.pory"
	walk_down
# 108 "data/maps/NavelRock_Summit/scripts.pory"
	walk_in_place_down
# 109 "data/maps/NavelRock_Summit/scripts.pory"
	delay_16
# 110 "data/maps/NavelRock_Summit/scripts.pory"
	delay_16
# 111 "data/maps/NavelRock_Summit/scripts.pory"
	step_end
# 112 "data/maps/NavelRock_Summit/scripts.pory"

# 113 "data/maps/NavelRock_Summit/scripts.pory"
Movement_HoOhAppear:
# 114 "data/maps/NavelRock_Summit/scripts.pory"
	delay_16
# 115 "data/maps/NavelRock_Summit/scripts.pory"
	delay_16
# 116 "data/maps/NavelRock_Summit/scripts.pory"
	walk_in_place_down
# 117 "data/maps/NavelRock_Summit/scripts.pory"
	walk_in_place_down
# 118 "data/maps/NavelRock_Summit/scripts.pory"
	walk_in_place_down
# 119 "data/maps/NavelRock_Summit/scripts.pory"
	walk_in_place_down
# 120 "data/maps/NavelRock_Summit/scripts.pory"
	step_end
