SSAnne_Exterior_MapScripts:: @ 8160840
	map_script 3, SSAnne_Exterior_MapScript1_16084B
	map_script 2, SSAnne_Exterior_MapScript2_16084F
	.byte 0

SSAnne_Exterior_MapScript1_16084B:: @ 816084B
	setworldmapflag FLAG_WORLD_MAP_SSANNE_EXTERIOR
	end

SSAnne_Exterior_MapScript2_16084F:: @ 816084F
	map_script_2 VAR_MAP_SCENE_VERMILION_CITY, 1, SSAnne_Exterior_160859
	.2byte 0

SSAnne_Exterior_160859:: @ 8160859
	lockall
	getplayerxy VAR_0x8004, VAR_0x8005
	compare VAR_0x8005, 6
	call_if le, EventScript_1608A1
	compare VAR_0x8005, 7
	call_if ge, EventScript_1608AC
	fadenewbgm MUS_NAMINORI
	delay 50
	special Special_SSAnneDepartureCutscene
	waitstate
	removeobject 1
	applymovement 255, Movement_1608B7
	waitmovement 0
	setvar VAR_MAP_SCENE_VERMILION_CITY, 2
	setvar VAR_VERMILION_CITY_TICKET_CHECK_TRIGGER, 0
	warp MAP_VERMILION_CITY, 255, 23, 34
	waitstate
	releaseall
	end

EventScript_1608A1:: @ 81608A1
	applymovement 255, Movement_1608C1
	waitmovement 0
	return

EventScript_1608AC:: @ 81608AC
	applymovement 255, Movement_1A75ED
	waitmovement 0
	return

Movement_1608B7:: @ 81608B7
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_1608C1:: @ 81608C1
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end
