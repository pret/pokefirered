.equ NUM_BOULDERS_PRESENT, VAR_TEMP_2

SeafoamIslands_B4F_MapScripts:: @ 816302E
	map_script MAP_SCRIPT_ON_TRANSITION, SeafoamIslands_B4F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, SeafoamIslands_B4F_OnResume
	map_script MAP_SCRIPT_ON_LOAD, SeafoamIslands_B4F_OnLoad
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, SeafoamIslands_B4F_OnWarp
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SeafoamIslands_B4F_OnFrame
	.byte 0

SeafoamIslands_B4F_OnResume:: @ 8163048
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, SeafoamIslands_B4F_EventScript_TryRemoveArticuno
	end

SeafoamIslands_B4F_EventScript_TryRemoveArticuno:: @ 8163052
	specialvar VAR_RESULT, GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if_ne EventScript_Return
	removeobject VAR_LAST_TALKED
	return

SeafoamIslands_B4F_OnTransition:: @ 8163066
	call_if_unset FLAG_FOUGHT_ARTICUNO, SeafoamIslands_B4F_EventScript_ShowArticuno
	call_if_unset FLAG_STOPPED_SEAFOAM_B4F_CURRENT, SeafoamIslands_B4F_EventScript_CheckStoppedCurrent
	call_if_set FLAG_STOPPED_SEAFOAM_B4F_CURRENT, SeafoamIslands_B4F_EventScript_SetNoCurrentLayout
	end

SeafoamIslands_B4F_EventScript_CheckStoppedCurrent:: @ 8163082
	setvar NUM_BOULDERS_PRESENT, 0
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_1, SeafoamIslands_B4F_EventScript_AddBoulderPresent
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_2, SeafoamIslands_B4F_EventScript_AddBoulderPresent
	compare NUM_BOULDERS_PRESENT, 2
	call_if_eq SeafoamIslands_B4F_EventScript_StoppedCurrent
	return

SeafoamIslands_B4F_EventScript_StoppedCurrent:: @ 81630A5
	setflag FLAG_STOPPED_SEAFOAM_B4F_CURRENT
	return

SeafoamIslands_B4F_EventScript_SetNoCurrentLayout:: @ 81630A9
	setmaplayoutindex LAYOUT_SEAFOAM_ISLANDS_B4F_CURRENT_STOPPED
	return

SeafoamIslands_B4F_EventScript_ShowArticuno:: @ 81630AD
	clearflag FLAG_HIDE_ARTICUNO
	return

SeafoamIslands_B4F_OnLoad:: @ 81630B1
	setvar NUM_BOULDERS_PRESENT, 0
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_1, SeafoamIslands_B4F_EventScript_AddBoulderPresent
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_2, SeafoamIslands_B4F_EventScript_AddBoulderPresent
	compare NUM_BOULDERS_PRESENT, 2
	goto_if_eq SeafoamIslands_B4F_EventScript_SetCalmWaterNearStairs
	end

SeafoamIslands_B4F_EventScript_SetCalmWaterNearStairs:: @ 81630D4
	setmetatile 12, 14, METATILE_General_CalmWater, 0
	setmetatile 13, 14, METATILE_General_CalmWater, 0
	end

SeafoamIslands_B4F_OnWarp:: @ 81630E7
	map_script_2 VAR_MAP_SCENE_SEAFOAM_ISLANDS_B4F, 1, SeafoamIslands_B4F_EventScript_WarpInOnCurrent
	.2byte 0

SeafoamIslands_B4F_EventScript_WarpInOnCurrent:: @ 81630F1
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
	special ForcePlayerToStartSurfing
	end

SeafoamIslands_B4F_OnFrame:: @ 81630F9
	map_script_2 VAR_MAP_SCENE_SEAFOAM_ISLANDS_B4F, 1, SeafoamIslands_B4F_EventScript_EnterOnCurrent
	map_script_2 VAR_TEMP_1, 1, SeafoamIslands_B4F_EventScript_EnterByFalling
	.2byte 0

@ The current the player is forced in on from B3F
SeafoamIslands_B4F_EventScript_EnterOnCurrent:: @ 816310B
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, SeafoamIslands_B4F_Movement_EnterOnCurrent
	waitmovement 0
	setvar VAR_MAP_SCENE_SEAFOAM_ISLANDS_B4F, 0
	releaseall
	end

SeafoamIslands_B4F_Movement_EnterOnCurrent:: @ 816311D
	walk_fast_up
	walk_fast_up
	walk_fast_up
	step_end

@ The current the player lands on when entering the map by falling
SeafoamIslands_B4F_EventScript_EnterByFalling:: @ 8163121
	lockall
	setvar NUM_BOULDERS_PRESENT, 0
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_1, SeafoamIslands_B4F_EventScript_AddBoulderPresent
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_2, SeafoamIslands_B4F_EventScript_AddBoulderPresent
	compare NUM_BOULDERS_PRESENT, 2
	goto_if_eq SeafoamIslands_B4F_EventScript_CurrentBlocked
	getplayerxy VAR_0x8008, VAR_0x8009
	compare VAR_0x8008, 9
	call_if_lt SeafoamIslands_B4F_EventScript_RideCurrentFar
	compare VAR_0x8008, 9
	call_if_ge SeafoamIslands_B4F_EventScript_RideCurrentClose
	special SeafoamIslandsB4F_CurrentDumpsPlayerOnLand
	setvar VAR_TEMP_1, 0
	releaseall
	end

SeafoamIslands_B4F_EventScript_AddBoulderPresent:: @ 8163169
	addvar NUM_BOULDERS_PRESENT, 1
	return

SeafoamIslands_B4F_EventScript_RideCurrentFar:: @ 816316F
	applymovement OBJ_EVENT_ID_PLAYER, SeafoamIslands_B4F_Movement_RideCurrentFar
	waitmovement 0
	return

SeafoamIslands_B4F_EventScript_RideCurrentClose:: @ 816317A
	applymovement OBJ_EVENT_ID_PLAYER, SeafoamIslands_B4F_Movement_RideCurrentClose
	waitmovement 0
	return

SeafoamIslands_B4F_EventScript_CurrentBlocked:: @ 8163185
	setvar VAR_TEMP_1, 0
	releaseall
	end

SeafoamIslands_B4F_Movement_RideCurrentFar:: @ 816318C
	walk_up
	walk_up
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	step_end

SeafoamIslands_B4F_Movement_RideCurrentClose:: @ 8163195
	walk_up
	walk_up
	walk_up
	walk_right
	walk_right
	walk_right
	walk_up
	step_end

@ Triggers blocking re-entry to B3F
SeafoamIslands_B4F_EventScript_UpwardCurrent:: @ 816319D
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, SeafoamIslands_B4F_Movement_WalkUp
	waitmovement 0
	releaseall
	end

SeafoamIslands_B4F_Movement_WalkUp:: @ 81631AA
	walk_up
	step_end

SeafoamIslands_B4F_EventScript_Articuno:: @ 81631AC
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	setwildbattle SPECIES_ARTICUNO, 50, ITEM_NONE
	waitse
	playmoncry SPECIES_ARTICUNO, 2
	message Text_Gyaoo
	waitmessage
	waitmoncry
	delay 10
	playbgm MUS_ENCOUNTER_GYM_LEADER, 0
	waitbuttonpress
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	special StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if_eq SeafoamIslands_B4F_EventScript_DefeatedArticuno
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if_eq SeafoamIslands_B4F_EventScript_RanFromArticuno
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if_eq SeafoamIslands_B4F_EventScript_RanFromArticuno
	setflag FLAG_FOUGHT_ARTICUNO
	release
	end

SeafoamIslands_B4F_EventScript_DefeatedArticuno:: @ 816320F
	setflag FLAG_FOUGHT_ARTICUNO
	goto EventScript_RemoveStaticMon
	end

SeafoamIslands_B4F_EventScript_RanFromArticuno:: @ 8163218
	setvar VAR_0x8004, SPECIES_ARTICUNO
	goto EventScript_MonFlewAway
	end

SeafoamIslands_B4F_EventScript_BoulderHintSign:: @ 8163223
	msgbox SeafoamIslands_B4F_Text_BouldersMightChangeWaterFlow, MSGBOX_SIGN
	end

SeafoamIslands_B4F_EventScript_FastCurrentSign:: @ 816322C
	msgbox SeafoamIslands_B4F_Text_DangerFastCurrent, MSGBOX_SIGN
	end
