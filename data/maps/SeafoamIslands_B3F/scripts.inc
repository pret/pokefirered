.equ NUM_BOULDERS_PRESENT, VAR_TEMP_2

SeafoamIslands_B3F_MapScripts:: @ 8162F4F
	map_script MAP_SCRIPT_ON_TRANSITION, SeafoamIslands_B3F_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SeafoamIslands_B3F_OnFrame
	.byte 0

SeafoamIslands_B3F_OnTransition:: @ 8162F5A
	call_if_unset FLAG_STOPPED_SEAFOAM_B3F_CURRENT, SeafoamIslands_B3F_EventScript_CheckStoppedCurrent
	call_if_set FLAG_STOPPED_SEAFOAM_B3F_CURRENT, SeafoamIslands_B3F_EventScript_SetNoCurrentLayout
	end

SeafoamIslands_B3F_EventScript_CheckStoppedCurrent:: @ 8162F6D
	setvar NUM_BOULDERS_PRESENT, 0
	call_if_unset FLAG_HIDE_SEAFOAM_B3F_BOULDER_1, SeafoamIslands_B3F_EventScript_AddBoulderPresent
	call_if_unset FLAG_HIDE_SEAFOAM_B3F_BOULDER_2, SeafoamIslands_B3F_EventScript_AddBoulderPresent
	compare NUM_BOULDERS_PRESENT, 2
	call_if_eq SeafoamIslands_B3F_EventScript_StoppedCurrent
	return

SeafoamIslands_B3F_EventScript_StoppedCurrent:: @ 8162F90
	setflag FLAG_STOPPED_SEAFOAM_B3F_CURRENT
	return

SeafoamIslands_B3F_EventScript_SetNoCurrentLayout:: @ 8162F94
	setmaplayoutindex LAYOUT_SEAFOAM_ISLANDS_B3F_CURRENT_STOPPED
	return

SeafoamIslands_B3F_OnFrame:: @ 8162F98
	map_script_2 VAR_TEMP_1, 1, SeafoamIslands_B3F_EventScript_EnterByFalling
	.2byte 0

SeafoamIslands_B3F_EventScript_EnterByFalling:: @ 8162FA2
	lockall
	setvar NUM_BOULDERS_PRESENT, 0
	call_if_unset FLAG_HIDE_SEAFOAM_B3F_BOULDER_1, SeafoamIslands_B3F_EventScript_AddBoulderPresent
	call_if_unset FLAG_HIDE_SEAFOAM_B3F_BOULDER_2, SeafoamIslands_B3F_EventScript_AddBoulderPresent
	compare NUM_BOULDERS_PRESENT, 2
	goto_if_eq SeafoamIslands_B3F_EventScript_CurrentBlocked
	getplayerxy VAR_0x8008, VAR_0x8009
	compare VAR_0x8008, 24
	call_if_lt SeafoamIslands_B3F_EventScript_RideCurrentFar
	compare VAR_0x8008, 24
	call_if_ge SeafoamIslands_B3F_EventScript_RideCurrentClose
	setvar VAR_MAP_SCENE_SEAFOAM_ISLANDS_B4F, 1
	warp MAP_SEAFOAM_ISLANDS_B4F, 255, 27, 21
	waitstate
	releaseall
	end

SeafoamIslands_B3F_EventScript_AddBoulderPresent:: @ 8162FF0
	addvar NUM_BOULDERS_PRESENT, 1
	return

SeafoamIslands_B3F_EventScript_RideCurrentFar:: @ 8162FF6
	applymovement OBJ_EVENT_ID_PLAYER, SeafoamIslands_B3F_Movement_RideCurrentFar
	waitmovement 0
	return

SeafoamIslands_B3F_EventScript_RideCurrentClose:: @ 8163001
	applymovement OBJ_EVENT_ID_PLAYER, SeafoamIslands_B3F_Movement_RideCurrentClose
	waitmovement 0
	return

SeafoamIslands_B3F_EventScript_CurrentBlocked:: @ 816300C
	setvar VAR_TEMP_1, 0
	releaseall
	end

SeafoamIslands_B3F_Movement_RideCurrentFar:: @ 8163013
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	step_end

SeafoamIslands_B3F_Movement_RideCurrentClose:: @ 8163021
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_right
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	step_end
