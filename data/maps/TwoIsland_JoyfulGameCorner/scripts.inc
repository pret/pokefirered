TwoIsland_JoyfulGameCorner_MapScripts:: @ 81713D0
	map_script MAP_SCRIPT_ON_TRANSITION, TwoIsland_JoyfulGameCorner_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, TwoIsland_JoyfulGameCorner_OnWarp
	map_script MAP_SCRIPT_ON_FRAME_TABLE, TwoIsland_JoyfulGameCorner_OnFrame
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	.byte 0

TwoIsland_JoyfulGameCorner_OnTransition:: @ 81713E5
	checkflag FLAG_GOT_MOON_STONE_FROM_JOYFUL_GAME_CORNER
	call_if TRUE, EventScript_1713EF
	end

EventScript_1713EF:: @ 81713EF
	setobjectxyperm 1, 6, 2
	setobjectmovementtype 1, 8
	setobjectmovementtype 3, 1
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 4
	return

TwoIsland_JoyfulGameCorner_OnWarp:: @ 8171404
	map_script_2 VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2, EventScript_171416
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MINIGAME, EventScript_CheckTurnAttendant
	.2byte 0

EventScript_171416:: @ 8171416
	turnobject OBJ_EVENT_ID_PLAYER, 2
	end

TwoIsland_JoyfulGameCorner_OnFrame:: @ 817141B
	map_script_2 VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 0, EventScript_17145F
	map_script_2 VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2, EventScript_171435
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MINIGAME, CableClub_EventScript_ExitMinigameRoom
	.2byte 0

EventScript_171435:: @ 8171435
	lockall
	textcolor 0
	msgbox gUnknown_81A28B2
	textcolor 1
	special Special_BufferBigGuyOrBigGirlString
	msgbox gUnknown_81A2931
	closemessage
	applymovement 3, Movement_WalkInPlaceFastestDown
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
	applymovement 1, Movement_WalkInPlaceFastestDown
	waitmovement 0
	playse SE_PIN
	applymovement 1, Movement_ExclamationMark
	waitmovement 0
	applymovement 1, Movement_Delay48
	waitmovement 0
	applymovement 1, Movement_171527
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox gUnknown_81A2465
	closemessage
	playse SE_DOOR
	waitse
	applymovement OBJ_EVENT_ID_PLAYER, Movement_17152C
	waitmovement 0
	playbgm MUS_SHOUNEN, 0
	addobject 2
	applymovement 2, Movement_17152F
	waitmovement 0
	msgbox gUnknown_81A259A
	applymovement 2, Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox gUnknown_81A2658
	msgbox gUnknown_81A26D5
	closemessage
	applymovement 2, Movement_WalkInPlaceFastestDown
	waitmovement 0
	playse SE_KAIDAN
	removeobject 2
	fadedefaultbgm
	delay 60
	msgbox gUnknown_81A270C
	clearflag FLAG_HIDE_THREE_ISLAND_LONE_BIKER
	setvar VAR_MAP_SCENE_THREE_ISLAND, 2
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 1
	releaseall
	end

Movement_171520:: @ 8171520
	walk_left
	walk_right
	walk_right
	delay_8
	walk_in_place_fastest_up
	delay_16
	step_end

Movement_171527:: @ 8171527
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_left
	step_end

Movement_17152C:: @ 817152C
	walk_left
	walk_in_place_fastest_right
	step_end

Movement_17152F:: @ 817152F
	walk_in_place_fastest_left
	delay_8
	walk_in_place_fastest_right
	delay_8
	walk_in_place_fastest_up
	step_end

TwoIsland_JoyfulGameCorner_EventScript_171535:: @ 8171535
	lock
	faceplayer
	compare VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 4
	goto_if eq, EventScript_1BC060
	checkflag FLAG_RESCUED_LOSTELLE
	goto_if TRUE, EventScript_171555
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
	compare VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 4
	goto_if eq, EventScript_1BC0CE
	checkflag FLAG_GOT_MOON_STONE_FROM_JOYFUL_GAME_CORNER
	goto_if TRUE, EventScript_1715F5
	compare VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 3
	goto_if eq, EventScript_17158A
	msgbox gUnknown_81A2743
	release
	end

EventScript_17158A:: @ 817158A
	checkflag FLAG_NO_ROOM_FOR_JOYFUL_GAME_CORNER_MOON_STONE
	goto_if TRUE, EventScript_1715C4
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
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1715FF
	additem ITEM_MOON_STONE, 1
	setflag FLAG_GOT_MOON_STONE_FROM_JOYFUL_GAME_CORNER
	giveitemfanfaremsg gUnknown_81A2A9A, ITEM_MOON_STONE
	release
	end

EventScript_1715F5:: @ 81715F5
	msgbox gUnknown_81A2AF5
	release
	end

EventScript_1715FF:: @ 81715FF
	setflag FLAG_NO_ROOM_FOR_JOYFUL_GAME_CORNER_MOON_STONE
	msgbox gUnknown_81A2ACA
	release
	end

TwoIsland_JoyfulGameCorner_EventScript_17160C:: @ 817160C
	lock
	faceplayer
	msgbox gUnknown_81A2B53
	release
	end
