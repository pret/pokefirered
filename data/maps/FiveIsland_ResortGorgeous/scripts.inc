FiveIsland_ResortGorgeous_MapScripts:: @ 81687E4
	map_script 4, FiveIsland_ResortGorgeous_MapScript1_1687EF
	map_script 2, FiveIsland_ResortGorgeous_MapScript2_1687FE
	.byte 0

FiveIsland_ResortGorgeous_MapScript1_1687EF:: @ 81687EF
	map_script_2 VAR_MAP_SCENE_FIVE_ISLAND_RESORT_GORGEOUS, 1, EventScript_1687F9
	.2byte 0

EventScript_1687F9:: @ 81687F9
	turnobject 255, 2
	end

FiveIsland_ResortGorgeous_MapScript2_1687FE:: @ 81687FE
	map_script_2 VAR_MAP_SCENE_FIVE_ISLAND_RESORT_GORGEOUS, 1, EventScript_168808
	.2byte 0

EventScript_168808:: @ 8168808
	lockall
	textcolor 1
	msgbox gUnknown_818A7DB
	closemessage
	applymovement 8, Movement_1A75E9
	waitmovement 0
	opendoor 39, 8
	waitdooranim
	applymovement 8, Movement_168841
	waitmovement 0
	closedoor 39, 8
	waitdooranim
	removeobject 8
	clearflag FLAG_HIDE_RESORT_GORGEOUS_INSIDE_SELPHY
	setvar VAR_MAP_SCENE_FIVE_ISLAND_RESORT_GORGEOUS, 2
	releaseall
	end

Movement_168841:: @ 8168841
	step_11
	step_60
	step_end

FiveIsland_ResortGorgeous_EventScript_168844:: @ 8168844
	msgbox gUnknown_818A7FE, 3
	end
