IndigoPlateau_Exterior_MapScripts:: @ 816723B
	map_script MAP_SCRIPT_ON_TRANSITION, IndigoPlateau_Exterior_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, IndigoPlateau_Exterior_OnFrame
	.byte 0

IndigoPlateau_Exterior_OnTransition:: @ 8167246
	setworldmapflag FLAG_WORLD_MAP_INDIGO_PLATEAU_EXTERIOR
	compare VAR_MAP_SCENE_INDIGO_PLATEAU_EXTERIOR, 1
	call_if eq, EventScript_IndigoPlateau_Exterior_PlayCreditsMusic
	end

EventScript_IndigoPlateau_Exterior_PlayCreditsMusic:: @ 8167255
	playbgm MUS_ENDING, 0
	return

IndigoPlateau_Exterior_OnFrame:: @ 816725A
	map_script_2 VAR_MAP_SCENE_INDIGO_PLATEAU_EXTERIOR, 1, EventScript_IndigoPlateau_Exterior_Credits
	.2byte 0

EventScript_IndigoPlateau_Exterior_Credits:: @ 8167264
	@ After beating the champion, you are warped to the main
	@ entrance of Indigo Plateau. This script starts running
	@ immediately after your walking animation.
	@ The script is timed to the music.
	lockall
	delay 105

	@ Rival exits building. Spawn a dummy object to lock the camera.
	opendoor 11, 6
	waitdooranim
	special SpawnCameraObject
	addobject 1
	applymovement 1, Movement_167346
	applymovement OBJ_EVENT_ID_PLAYER, Movement_167337
	waitmovement 0
	closedoor 11, 6
	waitdooranim

	@ Rival runs off
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16731B
	applymovement 1, Movement_16733E
	waitmovement 0
	delay 100

	@ Oak exits building
	opendoor 11, 6
	waitdooranim
	addobject 2
	applymovement 2, Movement_16735D
	waitmovement 0
	closedoor 11, 6
	waitdooranim
	delay 160

	@ Oak looks at player, then walks off
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16731F
	applymovement 2, Movement_167348
	waitmovement 0
	delay 100
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16732E
	waitmovement 0
	delay 155

	@ Player turns to face the League
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16733C
	waitmovement 0
	delay 90

	@ Player runs off
	applymovement OBJ_EVENT_ID_PLAYER, Movement_167335
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_167311
	waitmovement 0

	@ Reset the map state and roll the credits
	special RemoveCameraObject
	setvar VAR_MAP_SCENE_INDIGO_PLATEAU_EXTERIOR, 0
	removeobject 1
	removeobject 2
	special Special_Credits @ noreturn
	waitstate
	releaseall
	end

Movement_167311:: @ 8167311
	step_3d
	step_3d
	step_3d
	step_3d
	step_3d
	step_3d
	step_end

Movement_167318:: @ 8167318
	step_10
	step_10
	step_end

Movement_16731B:: @ 816731B
	step_1c
	step_1a
	step_2d
	step_end

Movement_16731F:: @ 816731F
	step_1b
	step_30
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_2d
	step_end

Movement_16732E:: @ 816732E
	step_13
	step_1c
	step_10
	step_10
	step_1c
	step_1c
	step_end

Movement_167335:: @ 8167335
	step_2d
	step_end

Movement_167337:: @ 8167337
	step_03
	step_4c
	step_12
	step_4d
	step_end

Movement_16733C:: @ 816733C
	step_2e
	step_end

Movement_16733E:: @ 816733E
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_1d
	step_end

Movement_167346:: @ 8167346
	step_1d
	step_end

Movement_167348:: @ 8167348
	step_2f
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_2d
	step_1c
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

Movement_16735D:: @ 816735D
	step_10
	step_end
