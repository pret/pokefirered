ThreeIsland_BerryForest_MapScripts:: @ 8163C71
	map_script 3, ThreeIsland_BerryForest_MapScript1_163C77
	.byte 0

ThreeIsland_BerryForest_MapScript1_163C77:: @ 8163C77
	setworldmapflag FLAG_WORLD_MAP_THREE_ISLAND_BERRY_FOREST
	setescapewarp MAP_THREE_ISLAND_BOND_BRIDGE, 255, 12, 6
	end

ThreeIsland_BerryForest_EventScript_163C83:: @ 8163C83
	lock
	faceplayer
	msgbox gUnknown_817ADD6
	playse SE_PIN
	applymovement 1, Movement_1A75DB
	waitmovement 0
	applymovement 1, Movement_163D22
	waitmovement 0
	msgbox gUnknown_817AE8E
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	waitse
	playmoncry SPECIES_HYPNO, 2
	waitmoncry
	setwildbattle SPECIES_HYPNO, 30, ITEM_NONE
	dowildbattle
	special sub_8112364
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_817AEE1
	setorcopyvar VAR_0x8000, 147
	setorcopyvar VAR_0x8001, 1
	callstd 0
	compare_var_to_value VAR_RESULT, 0
	call_if 1, EventScript_163D19
	special sub_80CA6DC
	msgbox gUnknown_817AF3B
	closemessage
	setflag FLAG_0x2A3
	setflag FLAG_0x07A
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2
	clearflag FLAG_0x075
	warp MAP_TWO_ISLAND_JOYFUL_GAME_CORNER, 255, 6, 6
	waitstate
	release
	end

EventScript_163D19:: @ 8163D19
	msgbox gUnknown_817AF9F
	return

Movement_163D22:: @ 8163D22
	step_2f
	step_1c
	step_30
	step_1b
	step_2f
	step_end

ThreeIsland_BerryForest_EventScript_163D28:: @ 8163D28
	msgbox gUnknown_817AFD6, 3
	end

ThreeIsland_BerryForest_EventScript_163D31:: @ 8163D31
	msgbox gUnknown_817B029, 3
	end
