# 1 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 2 "data/maps/SeafoamIslands_B3F/scripts.pory"
.equ NUM_BOULDERS_PRESENT, VAR_TEMP_2
# 3 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 4 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_MapScripts::
# 5 "data/maps/SeafoamIslands_B3F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SeafoamIslands_B3F_OnTransition
# 6 "data/maps/SeafoamIslands_B3F/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SeafoamIslands_B3F_OnFrame
# 7 "data/maps/SeafoamIslands_B3F/scripts.pory"
	.byte 0
# 8 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 9 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_OnTransition::
# 10 "data/maps/SeafoamIslands_B3F/scripts.pory"
	call_if_unset FLAG_STOPPED_SEAFOAM_B3F_CURRENT, SeafoamIslands_B3F_EventScript_CheckStoppedCurrent
# 11 "data/maps/SeafoamIslands_B3F/scripts.pory"
	call_if_set FLAG_STOPPED_SEAFOAM_B3F_CURRENT, SeafoamIslands_B3F_EventScript_SetNoCurrentLayout
# 12 "data/maps/SeafoamIslands_B3F/scripts.pory"
	end
# 13 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 14 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_EventScript_CheckStoppedCurrent::
# 15 "data/maps/SeafoamIslands_B3F/scripts.pory"
	setvar NUM_BOULDERS_PRESENT, 0
# 16 "data/maps/SeafoamIslands_B3F/scripts.pory"
	call_if_unset FLAG_HIDE_SEAFOAM_B3F_BOULDER_1, SeafoamIslands_B3F_EventScript_AddBoulderPresent
# 17 "data/maps/SeafoamIslands_B3F/scripts.pory"
	call_if_unset FLAG_HIDE_SEAFOAM_B3F_BOULDER_2, SeafoamIslands_B3F_EventScript_AddBoulderPresent
# 18 "data/maps/SeafoamIslands_B3F/scripts.pory"
	call_if_eq NUM_BOULDERS_PRESENT, 2, SeafoamIslands_B3F_EventScript_StoppedCurrent
# 19 "data/maps/SeafoamIslands_B3F/scripts.pory"
	return
# 20 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 21 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_EventScript_StoppedCurrent::
# 22 "data/maps/SeafoamIslands_B3F/scripts.pory"
	setflag FLAG_STOPPED_SEAFOAM_B3F_CURRENT
# 23 "data/maps/SeafoamIslands_B3F/scripts.pory"
	return
# 24 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 25 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_EventScript_SetNoCurrentLayout::
# 26 "data/maps/SeafoamIslands_B3F/scripts.pory"
	setmaplayoutindex LAYOUT_SEAFOAM_ISLANDS_B3F_CURRENT_STOPPED
# 27 "data/maps/SeafoamIslands_B3F/scripts.pory"
	return
# 28 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 29 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_OnFrame::
# 30 "data/maps/SeafoamIslands_B3F/scripts.pory"
	map_script_2 VAR_TEMP_1, 1, SeafoamIslands_B3F_EventScript_EnterByFalling
# 31 "data/maps/SeafoamIslands_B3F/scripts.pory"
	.2byte 0
# 32 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 33 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_EventScript_EnterByFalling::
# 34 "data/maps/SeafoamIslands_B3F/scripts.pory"
	lockall
# 35 "data/maps/SeafoamIslands_B3F/scripts.pory"
	setvar NUM_BOULDERS_PRESENT, 0
# 36 "data/maps/SeafoamIslands_B3F/scripts.pory"
	call_if_unset FLAG_HIDE_SEAFOAM_B3F_BOULDER_1, SeafoamIslands_B3F_EventScript_AddBoulderPresent
# 37 "data/maps/SeafoamIslands_B3F/scripts.pory"
	call_if_unset FLAG_HIDE_SEAFOAM_B3F_BOULDER_2, SeafoamIslands_B3F_EventScript_AddBoulderPresent
# 38 "data/maps/SeafoamIslands_B3F/scripts.pory"
	goto_if_eq NUM_BOULDERS_PRESENT, 2, SeafoamIslands_B3F_EventScript_CurrentBlocked
# 39 "data/maps/SeafoamIslands_B3F/scripts.pory"
	getplayerxy VAR_0x8008, VAR_0x8009
# 40 "data/maps/SeafoamIslands_B3F/scripts.pory"
	call_if_lt VAR_0x8008, 24, SeafoamIslands_B3F_EventScript_RideCurrentFar
# 41 "data/maps/SeafoamIslands_B3F/scripts.pory"
	call_if_ge VAR_0x8008, 24, SeafoamIslands_B3F_EventScript_RideCurrentClose
# 42 "data/maps/SeafoamIslands_B3F/scripts.pory"
	setvar VAR_MAP_SCENE_SEAFOAM_ISLANDS_B4F, 1
# 43 "data/maps/SeafoamIslands_B3F/scripts.pory"
	warp MAP_SEAFOAM_ISLANDS_B4F, 27, 21
# 44 "data/maps/SeafoamIslands_B3F/scripts.pory"
	waitstate
# 45 "data/maps/SeafoamIslands_B3F/scripts.pory"
	releaseall
# 46 "data/maps/SeafoamIslands_B3F/scripts.pory"
	end
# 47 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 48 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_EventScript_AddBoulderPresent::
# 49 "data/maps/SeafoamIslands_B3F/scripts.pory"
	addvar NUM_BOULDERS_PRESENT, 1
# 50 "data/maps/SeafoamIslands_B3F/scripts.pory"
	return
# 51 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 52 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_EventScript_RideCurrentFar::
# 53 "data/maps/SeafoamIslands_B3F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SeafoamIslands_B3F_Movement_RideCurrentFar
# 54 "data/maps/SeafoamIslands_B3F/scripts.pory"
	waitmovement 0
# 55 "data/maps/SeafoamIslands_B3F/scripts.pory"
	return
# 56 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 57 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_EventScript_RideCurrentClose::
# 58 "data/maps/SeafoamIslands_B3F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SeafoamIslands_B3F_Movement_RideCurrentClose
# 59 "data/maps/SeafoamIslands_B3F/scripts.pory"
	waitmovement 0
# 60 "data/maps/SeafoamIslands_B3F/scripts.pory"
	return
# 61 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 62 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_EventScript_CurrentBlocked::
# 63 "data/maps/SeafoamIslands_B3F/scripts.pory"
	setvar VAR_TEMP_1, 0
# 64 "data/maps/SeafoamIslands_B3F/scripts.pory"
	releaseall
# 65 "data/maps/SeafoamIslands_B3F/scripts.pory"
	end
# 66 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 67 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_Movement_RideCurrentFar::
# 68 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 69 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 70 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 71 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 72 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_right
# 73 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_right
# 74 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_right
# 75 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 76 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 77 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 78 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 79 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 80 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 81 "data/maps/SeafoamIslands_B3F/scripts.pory"
	step_end
# 82 "data/maps/SeafoamIslands_B3F/scripts.pory"

# 83 "data/maps/SeafoamIslands_B3F/scripts.pory"
SeafoamIslands_B3F_Movement_RideCurrentClose::
# 84 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 85 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 86 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 87 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 88 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_right
# 89 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_right
# 90 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 91 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 92 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 93 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 94 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 95 "data/maps/SeafoamIslands_B3F/scripts.pory"
	walk_fast_down
# 96 "data/maps/SeafoamIslands_B3F/scripts.pory"
	step_end
