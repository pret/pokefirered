TwoIsland_JoyfulGameCorner_MapScripts:: @ 81713D0
	map_script 3, TwoIsland_JoyfulGameCorner_MapScript1_1713E5
	map_script 4, TwoIsland_JoyfulGameCorner_MapScript2_171404
	map_script 2, TwoIsland_JoyfulGameCorner_MapScript3_17141B
	map_script 1, TwoIsland_JoyfulGameCorner_MapScript4_1BB237
	.byte 0

TwoIsland_JoyfulGameCorner_MapScript1_1713E5:: @ 81713E5
	checkflag FLAG_0x2FB
	call_if 1, EventScript_1713EF
	end

EventScript_1713EF:: @ 81713EF
	setobjectxyperm 1, 6, 2
	setobjectmovementtype 1, 8
	setobjectmovementtype 3, 1
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 4
	return

TwoIsland_JoyfulGameCorner_MapScript2_171404:: @ 8171404
	map_script_2 VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2, EventScript_171416
	map_script_2 VAR_0x406F, 8, EventScript_1BB227
	.2byte 0

EventScript_171416:: @ 8171416
	turnobject 255, 2
	end

TwoIsland_JoyfulGameCorner_MapScript3_17141B:: @ 817141B
	map_script_2 VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 0, EventScript_17145F
	map_script_2 VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2, EventScript_171435
	map_script_2 VAR_0x406F, 8, EventScript_1BB2FD
	.2byte 0

EventScript_171435:: @ 8171435
	lockall
	textcolor 0
	msgbox gUnknown_81A28B2
	textcolor 1
	special sub_80CA6DC
	msgbox gUnknown_81A2931
	closemessage
	applymovement 3, Movement_1A75ED
	waitmovement 0
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 3
	releaseall
	end

EventScript_17145F:: @ 817145F
	lockall
	textcolor 0
	applymovement 1, Movement_171520
	waitmovement 0
	msgbox gUnknown_81A2408
	closemessage
	applymovement 1, Movement_1A75ED
	waitmovement 0
	playse SE_PIN
	applymovement 1, Movement_1A75DB
	waitmovement 0
	applymovement 1, Movement_1A75DD
	waitmovement 0
	applymovement 1, Movement_171527
	waitmovement 0
	applymovement 255, Movement_1A75EB
	waitmovement 0
	msgbox gUnknown_81A2465
	closemessage
	playse SE_DOOR
	waitse
	applymovement 255, Movement_17152C
	waitmovement 0
	playbgm BGM_FRLG_BOY_EYE, 0
	addobject 2
	applymovement 2, Movement_17152F
	waitmovement 0
	msgbox gUnknown_81A259A
	applymovement 2, Movement_1A75EB
	waitmovement 0
	msgbox gUnknown_81A2658
	msgbox gUnknown_81A26D5
	closemessage
	applymovement 2, Movement_1A75ED
	waitmovement 0
	playse SE_KAIDAN
	removeobject 2
	fadedefaultbgm
	delay 60
	msgbox gUnknown_81A270C
	clearflag FLAG_0x091
	setvar VAR_0x407B, 2
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 1
	releaseall
	end

Movement_171520:: @ 8171520
	step_12
	step_13
	step_13
	step_1b
	step_2e
	step_1c
	step_end

Movement_171527:: @ 8171527
	step_10
	step_10
	step_10
	step_2f
	step_end

Movement_17152C:: @ 817152C
	step_12
	step_30
	step_end

Movement_17152F:: @ 817152F
	step_2f
	step_1b
	step_30
	step_1b
	step_2e
	step_end

TwoIsland_JoyfulGameCorner_EventScript_171535:: @ 8171535
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 4
	goto_if 1, EventScript_1BC060
	checkflag FLAG_0x2A3
	goto_if 1, EventScript_171555
	msgbox gUnknown_81A285C
	release
	end

EventScript_171555:: @ 8171555
	msgbox gUnknown_81A288A
	release
	end

TwoIsland_JoyfulGameCorner_EventScript_17155F:: @ 817155F
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 4
	goto_if 1, EventScript_1BC0CE
	checkflag FLAG_0x2FB
	goto_if 1, EventScript_1715F5
	compare_var_to_value VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 3
	goto_if 1, EventScript_17158A
	msgbox gUnknown_81A2743
	release
	end

EventScript_17158A:: @ 817158A
	checkflag FLAG_0x2FE
	goto_if 1, EventScript_1715C4
	msgbox gUnknown_81A296A
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 2
	textcolor 3
	playfanfare MUS_ME_WAZA
	message Text_1A29F7
	waitmessage
	waitfanfare
	call EventScript_1A6675
	removeitem ITEM_METEORITE, 1
	msgbox gUnknown_81A2A24
	goto EventScript_1715C4
	end

EventScript_1715C4:: @ 81715C4
	checkitemspace ITEM_MOON_STONE, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1715FF
	additem ITEM_MOON_STONE, 1
	setflag FLAG_0x2FB
	giveitemfanfaremsg gUnknown_81A2A9A, ITEM_MOON_STONE
	release
	end

EventScript_1715F5:: @ 81715F5
	msgbox gUnknown_81A2AF5
	release
	end

EventScript_1715FF:: @ 81715FF
	setflag FLAG_0x2FE
	msgbox gUnknown_81A2ACA
	release
	end

TwoIsland_JoyfulGameCorner_EventScript_17160C:: @ 817160C
	lock
	faceplayer
	msgbox gUnknown_81A2B53
	release
	end
