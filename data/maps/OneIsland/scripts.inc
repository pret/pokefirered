OneIsland_MapScripts:: @ 8167484
	map_script 3, OneIsland_MapScript1_16748F
	map_script 2, OneIsland_MapScript2_167493
	.byte 0

OneIsland_MapScript1_16748F:: @ 816748F
	setworldmapflag FLAG_WORLD_MAP_ONE_ISLAND
	end

OneIsland_MapScript2_167493:: @ 8167493
	map_script_2 VAR_0x4075, 2, EventScript_16749D
	.2byte 0

EventScript_16749D:: @ 816749D
	lockall
	textcolor 0
	applymovement 255, Movement_167505
	waitmovement 0
	loadword 0, gUnknown_818161B
	callstd 4
	closemessage
	applymovement 1, Movement_167507
	applymovement 255, Movement_1674F4
	waitmovement 0
	opendoor 14, 5
	waitdooranim
	applymovement 1, Movement_167514
	applymovement 255, Movement_167501
	waitmovement 0
	closedoor 14, 5
	waitdooranim
	removeobject 1
	setvar VAR_0x4075, 3
	warp MAP_ONE_ISLAND_POKEMON_CENTER_1F, 255, 9, 9
	waitstate
	releaseall
	end

Movement_1674F4:: @ 81674F4
	step_11
	step_11
	step_11
	step_11
	step_11
	step_13
	step_13
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_167501:: @ 8167501
	step_11
	step_11
	step_60
	step_end

Movement_167505:: @ 8167505
	step_11
	step_end

Movement_167507:: @ 8167507
	step_11
	step_11
	step_11
	step_11
	step_13
	step_13
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_167514:: @ 8167514
	step_11
	step_60
	step_end

OneIsland_EventScript_167517:: @ 8167517
	lock
	faceplayer
	checkflag 2116
	goto_if 1, EventScript_16753F
	checkflag FLAG_0x2A1
	goto_if 1, EventScript_167535
	loadword 0, gUnknown_818174E
	callstd 4
	release
	end

EventScript_167535:: @ 8167535
	loadword 0, gUnknown_8181858
	callstd 4
	release
	end

EventScript_16753F:: @ 816753F
	loadword 0, gUnknown_8181901
	callstd 4
	release
	end

OneIsland_EventScript_167549:: @ 8167549
	loadword 0, gUnknown_8181A4A
	callstd 2
	end

OneIsland_EventScript_167552:: @ 8167552
	loadword 0, gUnknown_81819E1
	callstd 3
	end

OneIsland_EventScript_16755B:: @ 816755B
	loadword 0, gUnknown_8181A0A
	callstd 3
	end
