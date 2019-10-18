CinnabarIsland_PokemonCenter_1F_MapScripts:: @ 816E8D7
	map_script 3, CinnabarIsland_PokemonCenter_1F_MapScript1_16E8E2
	map_script 5, CinnabarIsland_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

CinnabarIsland_PokemonCenter_1F_MapScript1_16E8E2:: @ 816E8E2
	setrespawn SPAWN_CINNABAR_ISLAND
	end

CinnabarIsland_PokemonCenter_1F_EventScript_16E8E6:: @ 816E8E6
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

CinnabarIsland_PokemonCenter_1F_EventScript_16E8EF:: @ 816E8EF
	msgbox gUnknown_819A5BE, 2
	end

CinnabarIsland_PokemonCenter_1F_EventScript_16E8F8:: @ 816E8F8
	msgbox gUnknown_819A4F8, 2
	end

CinnabarIsland_PokemonCenter_1F_EventScript_16E901:: @ 816E901
	msgbox gUnknown_819A6B1, 2
	end

CinnabarIsland_PokemonCenter_1F_EventScript_16E90A:: @ 816E90A
	lock
	faceplayer
	msgbox gUnknown_819A725, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_16E9A5
	msgbox gUnknown_819A785
	closemessage
	playbgm MUS_ANNAI, 1
	savebgm MUS_ANNAI
	setflag FLAG_SPECIAL_FLAG_0x4001
	setflag FLAG_0x0A2
	delay 20
	compare_var_to_value VAR_FACING, 1
	call_if 1, EventScript_16E96F
	compare_var_to_value VAR_FACING, 4
	call_if 1, EventScript_16E981
	compare_var_to_value VAR_FACING, 3
	call_if 1, EventScript_16E993
	removeobject 7
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND_2, 1
	clearflag FLAG_0x062
	warp MAP_CINNABAR_ISLAND, 255, 14, 11
	waitstate
	release
	end

EventScript_16E96F:: @ 816E96F
	applymovement 7, Movement_16E9AF
	applymovement 255, Movement_16E9B9
	waitmovement 0
	return

EventScript_16E981:: @ 816E981
	applymovement 7, Movement_16E9C3
	applymovement 255, Movement_16E9CF
	waitmovement 0
	return

EventScript_16E993:: @ 816E993
	applymovement 7, Movement_16E9AF
	applymovement 255, Movement_16E9DE
	waitmovement 0
	return

EventScript_16E9A5:: @ 816E9A5
	msgbox gUnknown_819A766
	release
	end

Movement_16E9AF:: @ 816E9AF
	step_12
	step_12
	step_12
	step_12
	step_10
	step_10
	step_10
	step_1b
	step_60
	step_end

Movement_16E9B9:: @ 816E9B9
	step_10
	step_12
	step_12
	step_12
	step_12
	step_10
	step_10
	step_1c
	step_10
	step_end

Movement_16E9C3:: @ 816E9C3
	step_11
	step_12
	step_12
	step_10
	step_12
	step_12
	step_10
	step_10
	step_10
	step_1b
	step_60
	step_end

Movement_16E9CF:: @ 816E9CF
	step_1c
	step_1c
	step_1c
	step_02
	step_1c
	step_12
	step_12
	step_12
	step_10
	step_10
	step_1b
	step_10
	step_1b
	step_60
	step_end

Movement_16E9DE:: @ 816E9DE
	step_12
	step_12
	step_12
	step_12
	step_12
	step_10
	step_10
	step_1c
	step_10
	step_end
