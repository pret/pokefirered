SeafoamIslands_B4F_MapScripts:: @ 816302E
	map_script MAP_SCRIPT_ON_TRANSITION, SeafoamIslands_B4F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, SeafoamIslands_B4F_OnResume
	map_script MAP_SCRIPT_ON_LOAD, SeafoamIslands_B4F_OnLoad
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, SeafoamIslands_B4F_OnWarp
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SeafoamIslands_B4F_OnFrame
	.byte 0

SeafoamIslands_B4F_OnResume:: @ 8163048
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, EventScript_163052
	end

EventScript_163052:: @ 8163052
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_CAUGHT
	goto_if_ne EventScript_Return
	removeobject VAR_LAST_TALKED
	return

SeafoamIslands_B4F_OnTransition:: @ 8163066
	call_if_unset FLAG_FOUGHT_ARTICUNO, EventScript_1630AD
	call_if_unset FLAG_STOPPED_SEAFOAM_B4F_CURRENT, EventScript_163082
	call_if_set FLAG_STOPPED_SEAFOAM_B4F_CURRENT, EventScript_1630A9
	end

EventScript_163082:: @ 8163082
	setvar VAR_TEMP_2, 0
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_1, EventScript_163169
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_2, EventScript_163169
	compare VAR_TEMP_2, 2
	call_if_eq EventScript_1630A5
	return

EventScript_1630A5:: @ 81630A5
	setflag FLAG_STOPPED_SEAFOAM_B4F_CURRENT
	return

EventScript_1630A9:: @ 81630A9
	setmaplayoutindex LAYOUT_UNUSED_LAYOUT_833BE30
	return

EventScript_1630AD:: @ 81630AD
	clearflag FLAG_HIDE_ARTICUNO
	return

SeafoamIslands_B4F_OnLoad:: @ 81630B1
	setvar VAR_TEMP_2, 0
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_1, EventScript_163169
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_2, EventScript_163169
	compare VAR_TEMP_2, 2
	goto_if_eq EventScript_1630D4
	end

EventScript_1630D4:: @ 81630D4
	setmetatile 12, 14, 299, 0
	setmetatile 13, 14, 299, 0
	end

SeafoamIslands_B4F_OnWarp:: @ 81630E7
	map_script_2 VAR_MAP_SCENE_SEAFOAM_ISLANDS_B4F, 1, EventScript_1630F1
	.2byte 0

EventScript_1630F1:: @ 81630F1
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
	special Special_ForcePlayerToStartSurfing
	end

SeafoamIslands_B4F_OnFrame:: @ 81630F9
	map_script_2 VAR_MAP_SCENE_SEAFOAM_ISLANDS_B4F, 1, EventScript_16310B
	map_script_2 VAR_TEMP_1, 1, EventScript_163121
	.2byte 0

EventScript_16310B:: @ 816310B
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16311D
	waitmovement 0
	setvar VAR_MAP_SCENE_SEAFOAM_ISLANDS_B4F, 0
	releaseall
	end

Movement_16311D:: @ 816311D
	walk_fast_up
	walk_fast_up
	walk_fast_up
	step_end

EventScript_163121:: @ 8163121
	lockall
	setvar VAR_TEMP_2, 0
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_1, EventScript_163169
	call_if_unset FLAG_HIDE_SEAFOAM_B4F_BOULDER_2, EventScript_163169
	compare VAR_TEMP_2, 2
	goto_if_eq EventScript_163185
	getplayerxy VAR_0x8008, VAR_0x8009
	compare VAR_0x8008, 9
	call_if_lt EventScript_16316F
	compare VAR_0x8008, 9
	call_if_ge EventScript_16317A
	special sub_805D1A8
	setvar VAR_TEMP_1, 0
	releaseall
	end

EventScript_163169:: @ 8163169
	addvar VAR_TEMP_2, 1
	return

EventScript_16316F:: @ 816316F
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16318C
	waitmovement 0
	return

EventScript_16317A:: @ 816317A
	applymovement OBJ_EVENT_ID_PLAYER, Movement_163195
	waitmovement 0
	return

EventScript_163185:: @ 8163185
	setvar VAR_TEMP_1, 0
	releaseall
	end

Movement_16318C:: @ 816318C
	walk_up
	walk_up
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	step_end

Movement_163195:: @ 8163195
	walk_up
	walk_up
	walk_up
	walk_right
	walk_right
	walk_right
	walk_up
	step_end

SeafoamIslands_B4F_EventScript_16319D:: @ 816319D
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1631AA
	waitmovement 0
	releaseall
	end

Movement_1631AA:: @ 81631AA
	walk_up
	step_end

SeafoamIslands_B4F_EventScript_1631AC:: @ 81631AC
	goto_if_questlog EventScript_ReleaseEnd
	special sub_8112364
	lock
	faceplayer
	setwildbattle SPECIES_ARTICUNO, 50, ITEM_NONE
	waitse
	playmoncry SPECIES_ARTICUNO, 2
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
	goto_if_eq EventScript_16320F
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if_eq EventScript_163218
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if_eq EventScript_163218
	setflag FLAG_FOUGHT_ARTICUNO
	release
	end

EventScript_16320F:: @ 816320F
	setflag FLAG_FOUGHT_ARTICUNO
	goto EventScript_RemoveStaticMon

EventScript_163217:: @ 8163217
	end

EventScript_163218:: @ 8163218
	setvar VAR_0x8004, SPECIES_ARTICUNO
	goto EventScript_MonFlewAway

EventScript_163222:: @ 8163222
	end

SeafoamIslands_B4F_EventScript_163223:: @ 8163223
	msgbox gUnknown_8179B36, MSGBOX_SIGN
	end

SeafoamIslands_B4F_EventScript_16322C:: @ 816322C
	msgbox gUnknown_8179B65, MSGBOX_SIGN
	end
