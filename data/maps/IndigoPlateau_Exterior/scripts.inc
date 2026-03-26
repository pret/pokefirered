.equ LOCALID_RIVAL,    1
.equ LOCALID_PROF_OAK, 2

IndigoPlateau_Exterior_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, IndigoPlateau_Exterior_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, IndigoPlateau_Exterior_OnFrame
	.byte 0

IndigoPlateau_Exterior_OnTransition::
	setworldmapflag FLAG_WORLD_MAP_INDIGO_PLATEAU_EXTERIOR
	call_if_eq VAR_MAP_SCENE_INDIGO_PLATEAU_EXTERIOR, 1, IndigoPlateau_Exterior_EventScript_PlayCreditsMusic
	end

IndigoPlateau_Exterior_EventScript_PlayCreditsMusic::
	playbgm MUS_CREDITS, 0
	return

IndigoPlateau_Exterior_OnFrame::
	map_script_2 VAR_MAP_SCENE_INDIGO_PLATEAU_EXTERIOR, 1, IndigoPlateau_Exterior_EventScript_Credits
	.2byte 0


@ After beating the champion, you are warped to the main
@ entrance of Indigo Plateau. This script starts running
@ immediately after your walking animation.
@ The script is timed to the music.
IndigoPlateau_Exterior_EventScript_Credits::
	lockall
	delay 105

	@ Rival exits building. Spawn a dummy object to lock the camera.
	opendoor 11, 6
	waitdooranim
	special SpawnCameraObject
	addobject LOCALID_RIVAL
	applymovement LOCALID_RIVAL, IndigoPlateau_Exterior_Movement_RivalExitBuilding
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PushPlayerOutOfWay
	waitmovement 0
	closedoor 11, 6
	waitdooranim

	@ Rival runs off
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerWatchRivalLeave
	applymovement LOCALID_RIVAL, IndigoPlateau_Exterior_Movement_RivalLeave
	waitmovement 0
	delay 100

	@ Oak exits building
	opendoor 11, 6
	waitdooranim
	addobject LOCALID_PROF_OAK
	applymovement LOCALID_PROF_OAK, IndigoPlateau_Exterior_Movement_OakExitBuilding
	waitmovement 0
	closedoor 11, 6
	waitdooranim
	delay 160

	@ Oak looks at player, then walks off
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerWatchOakLeave
	applymovement LOCALID_PROF_OAK, IndigoPlateau_Exterior_Movement_OakLeave
	waitmovement 0
	delay 100

	@ Player begin to leave
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerBeginLeave
	waitmovement 0
	delay 155
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerFaceLeague
	waitmovement 0
	delay 90

	@ Player runs off
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerTurnAround
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, IndigoPlateau_Exterior_Movement_PlayerLeave
	waitmovement 0

	@ Reset the map state and roll the credits
	special RemoveCameraObject
	setvar VAR_MAP_SCENE_INDIGO_PLATEAU_EXTERIOR, 0
	removeobject LOCALID_RIVAL
	removeobject LOCALID_PROF_OAK
	special DoCredits
	waitstate
	releaseall
	end

IndigoPlateau_Exterior_Movement_PlayerLeave::
	player_run_down
	player_run_down
	player_run_down
	player_run_down
	player_run_down
	player_run_down
	step_end

@ Unused
IndigoPlateau_Exterior_Movement_PlayerExitBuilding::
	walk_down
	walk_down
	step_end

IndigoPlateau_Exterior_Movement_PlayerWatchRivalLeave::
	delay_16
	delay_4
	walk_in_place_faster_down
	step_end

IndigoPlateau_Exterior_Movement_PlayerWatchOakLeave::
	delay_8
	walk_in_place_faster_right
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_faster_down
	step_end

IndigoPlateau_Exterior_Movement_PlayerBeginLeave::
	walk_right
	delay_16
	walk_down
	walk_down
	delay_16
	delay_16
	step_end

IndigoPlateau_Exterior_Movement_PlayerTurnAround::
	walk_in_place_faster_down
	step_end

IndigoPlateau_Exterior_Movement_PushPlayerOutOfWay::
	face_right
	lock_facing_direction
	walk_left
	unlock_facing_direction
	step_end

IndigoPlateau_Exterior_Movement_PlayerFaceLeague::
	walk_in_place_faster_up
	step_end

IndigoPlateau_Exterior_Movement_RivalLeave::
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	step_end

IndigoPlateau_Exterior_Movement_RivalExitBuilding::
	walk_fast_down
	step_end

IndigoPlateau_Exterior_Movement_OakLeave::
	walk_in_place_faster_left
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_faster_down
	delay_16
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

IndigoPlateau_Exterior_Movement_OakExitBuilding::
	walk_down
	step_end
