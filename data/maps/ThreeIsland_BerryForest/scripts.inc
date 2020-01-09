ThreeIsland_BerryForest_MapScripts:: @ 8163C71
	map_script MAP_SCRIPT_ON_TRANSITION, ThreeIsland_BerryForest_OnTransition
	.byte 0

ThreeIsland_BerryForest_OnTransition:: @ 8163C77
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
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	waitse
	playmoncry SPECIES_HYPNO, 2
	waitmoncry
	setwildbattle SPECIES_HYPNO, 30, ITEM_NONE
	dowildbattle
	special sub_8112364
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_817AEE1
	giveitem ITEM_IAPAPA_BERRY
	compare VAR_RESULT, 0
	call_if eq, EventScript_163D19
	special Special_BufferBigGuyOrBigGirlString
	msgbox gUnknown_817AF3B
	closemessage
	setflag FLAG_RESCUED_LOSTELLE
	setflag FLAG_HIDE_LOSTELLE_IN_BERRY_FOREST
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2
	clearflag FLAG_HIDE_TWO_ISLAND_GAME_CORNER_LOSTELLE
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
