SeafoamIslands_B3F_MapScripts:: @ 8162F4F
	map_script MAP_SCRIPT_ON_TRANSITION, SeafoamIslands_B3F_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SeafoamIslands_B3F_OnFrame
	.byte 0

SeafoamIslands_B3F_OnTransition:: @ 8162F5A
	checkflag FLAG_STOPPED_SEAFOAM_B3F_CURRENT
	call_if FALSE, EventScript_162F6D
	checkflag FLAG_STOPPED_SEAFOAM_B3F_CURRENT
	call_if TRUE, EventScript_162F94
	end

EventScript_162F6D:: @ 8162F6D
	setvar VAR_0x4002, 0
	checkflag FLAG_HIDE_SEAFOAM_B3F_BOULDER_1
	call_if FALSE, EventScript_162FF0
	checkflag FLAG_HIDE_SEAFOAM_B3F_BOULDER_2
	call_if FALSE, EventScript_162FF0
	compare VAR_0x4002, 2
	call_if eq, EventScript_162F90
	return

EventScript_162F90:: @ 8162F90
	setflag FLAG_STOPPED_SEAFOAM_B3F_CURRENT
	return

EventScript_162F94:: @ 8162F94
	setmaplayoutindex LAYOUT_UNUSED_LAYOUT_833B6EC
	return

SeafoamIslands_B3F_OnFrame:: @ 8162F98
	map_script_2 VAR_0x4001, 1, EventScript_162FA2
	.2byte 0

EventScript_162FA2:: @ 8162FA2
	lockall
	setvar VAR_0x4002, 0
	checkflag FLAG_HIDE_SEAFOAM_B3F_BOULDER_1
	call_if FALSE, EventScript_162FF0
	checkflag FLAG_HIDE_SEAFOAM_B3F_BOULDER_2
	call_if FALSE, EventScript_162FF0
	compare VAR_0x4002, 2
	goto_if eq, EventScript_16300C
	getplayerxy VAR_0x8008, VAR_0x8009
	compare VAR_0x8008, 24
	call_if lt, EventScript_162FF6
	compare VAR_0x8008, 24
	call_if ge, EventScript_163001
	setvar VAR_MAP_SCENE_SEAFOAM_ISLANDS_B4F, 1
	warp MAP_SEAFOAM_ISLANDS_B4F, 255, 27, 21
	waitstate
	releaseall
	end

EventScript_162FF0:: @ 8162FF0
	addvar VAR_0x4002, 1
	return

EventScript_162FF6:: @ 8162FF6
	applymovement OBJ_EVENT_ID_PLAYER, Movement_163013
	waitmovement 0
	return

EventScript_163001:: @ 8163001
	applymovement OBJ_EVENT_ID_PLAYER, Movement_163021
	waitmovement 0
	return

EventScript_16300C:: @ 816300C
	setvar VAR_0x4001, 0
	releaseall
	end

Movement_163013:: @ 8163013
	step_1d
	step_1d
	step_1d
	step_1d
	step_20
	step_20
	step_20
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_end

Movement_163021:: @ 8163021
	step_1d
	step_1d
	step_1d
	step_1d
	step_20
	step_20
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_end
