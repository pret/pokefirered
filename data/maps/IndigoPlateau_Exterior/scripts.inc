IndigoPlateau_Exterior_MapScripts:: @ 816723B
	map_script 3, IndigoPlateau_Exterior_MapScript1_167246
	map_script 2, IndigoPlateau_Exterior_MapScript2_16725A
	.byte 0

IndigoPlateau_Exterior_MapScript1_167246:: @ 8167246
	setworldmapflag FLAG_WORLD_MAP_INDIGO_PLATEAU_EXTERIOR
	compare_var_to_value VAR_0x4085, 1
	call_if 1, EventScript_167255
	end

EventScript_167255:: @ 8167255
	playbgm BGM_FRLG_CREDITS, 0
	return

IndigoPlateau_Exterior_MapScript2_16725A:: @ 816725A
	map_script_2 VAR_0x4085, 1, EventScript_167264
	.2byte 0

EventScript_167264:: @ 8167264
	lockall
	delay 105
	opendoor 11, 6
	waitdooranim
	special SpawnScriptFieldObject
	addobject 1
	applymovement 1, Movement_167346
	applymovement 255, Movement_167337
	waitmovement 0
	closedoor 11, 6
	waitdooranim
	applymovement 255, Movement_16731B
	applymovement 1, Movement_16733E
	waitmovement 0
	delay 100
	opendoor 11, 6
	waitdooranim
	addobject 2
	applymovement 2, Movement_16735D
	waitmovement 0
	closedoor 11, 6
	waitdooranim
	delay 160
	applymovement 255, Movement_16731F
	applymovement 2, Movement_167348
	waitmovement 0
	delay 100
	applymovement 255, Movement_16732E
	waitmovement 0
	delay 155
	applymovement 255, Movement_16733C
	waitmovement 0
	delay 90
	applymovement 255, Movement_167335
	waitmovement 0
	applymovement 255, Movement_167311
	waitmovement 0
	special RemoveScriptFieldObject
	setvar VAR_0x4085, 0
	removeobject 1
	removeobject 2
	special sub_80F39B4
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
