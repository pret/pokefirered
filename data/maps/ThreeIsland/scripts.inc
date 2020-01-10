ThreeIsland_MapScripts:: @ 81677AD
	map_script MAP_SCRIPT_ON_TRANSITION, ThreeIsland_OnTransition
	.byte 0

ThreeIsland_OnTransition:: @ 81677B3
	setworldmapflag FLAG_WORLD_MAP_THREE_ISLAND
	call_if_set FLAG_RESCUED_LOSTELLE, EventScript_1677CB
	compare VAR_MAP_SCENE_THREE_ISLAND, 4
	call_if_eq EventScript_1677CF
	end

EventScript_1677CB:: @ 81677CB
	setflag FLAG_HIDE_THREE_ISLAND_ANTIBIKERS
	return

EventScript_1677CF:: @ 81677CF
	setobjectmovementtype 1, 1
	setobjectmovementtype 2, 1
	return

ThreeIsland_EventScript_1677D8:: @ 81677D8
	lock
	setvar VAR_TEMP_1, 2
	call EventScript_16786F
	release
	end

ThreeIsland_EventScript_1677E5:: @ 81677E5
	lock
	goto_if_set FLAG_GOT_FULL_RESTORE_FROM_THREE_ISLAND_DEFENDER, EventScript_167806
	compare VAR_MAP_SCENE_THREE_ISLAND, 4
	goto_if_eq EventScript_16781A
	setvar VAR_TEMP_1, 0
	call EventScript_16786F
	release
	end

EventScript_167806:: @ 8167806
	applymovement 1, Movement_FacePlayer
	waitmovement 0
	msgbox gUnknown_81827F1
	release
	end

EventScript_16781A:: @ 816781A
	applymovement 1, Movement_FacePlayer
	waitmovement 0
	msgbox gUnknown_818275A
	checkitemspace ITEM_FULL_RESTORE, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_167865
	msgreceiveditem gUnknown_81827BE, ITEM_FULL_RESTORE
	additem ITEM_FULL_RESTORE
	setflag FLAG_GOT_FULL_RESTORE_FROM_THREE_ISLAND_DEFENDER
	msgbox gUnknown_81827F1
	release
	end

EventScript_167865:: @ 8167865
	msgbox gUnknown_81827DB
	release
	end

EventScript_16786F:: @ 816786F
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_167947
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_167947
	applymovement 1, Movement_167A1B
	waitmovement 0
	msgbox gUnknown_81820C0
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_167952
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_167952
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_16795D
	applymovement 5, Movement_167A19
	waitmovement 0
	msgbox gUnknown_8182125
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_167931
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_167931
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_167973
	applymovement 2, Movement_167A1B
	waitmovement 0
	msgbox gUnknown_81821A9
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_167952
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_167952
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_16795D
	applymovement 4, Movement_167A19
	waitmovement 0
	msgbox gUnknown_81821DC
	return

EventScript_167931:: @ 8167931
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

EventScript_16793C:: @ 816793C
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

EventScript_167947:: @ 8167947
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

EventScript_167952:: @ 8167952
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

EventScript_16795D:: @ 816795D
	getplayerxy VAR_0x8004, VAR_0x8005
	compare VAR_0x8004, 9
	goto_if_ge EventScript_167931
	goto EventScript_167952
	end

EventScript_167973:: @ 8167973
	getplayerxy VAR_0x8004, VAR_0x8005
	compare VAR_0x8004, 9
	goto_if_ge EventScript_167947
	goto EventScript_167931
	end

ThreeIsland_EventScript_167989:: @ 8167989
	lock
	compare VAR_MAP_SCENE_THREE_ISLAND, 4
	goto_if_eq EventScript_1679A1
	setvar VAR_TEMP_1, 1
	call EventScript_16786F
	release
	end

EventScript_1679A1:: @ 81679A1
	applymovement 2, Movement_FacePlayer
	waitmovement 0
	msgbox gUnknown_8182823
	release
	end

ThreeIsland_EventScript_1679B5:: @ 81679B5
	lockall
	textcolor 0
	applymovement 1, Movement_167A1B
	waitmovement 0
	msgbox gUnknown_81821F1
	applymovement 3, Movement_167A19
	waitmovement 0
	msgbox gUnknown_818221F
	applymovement 1, Movement_167A1B
	waitmovement 0
	msgbox gUnknown_8182275
	applymovement 3, Movement_167A19
	waitmovement 0
	msgbox gUnknown_81822FB
	applymovement 1, Movement_167A1B
	waitmovement 0
	msgbox gUnknown_81823C7
	setvar VAR_MAP_SCENE_THREE_ISLAND, 3
	releaseall
	end

Movement_167A19:: @ 8167A19
	walk_in_place_left
	step_end

Movement_167A1B:: @ 8167A1B
	walk_in_place_right
	step_end

ThreeIsland_EventScript_167A1D:: @ 8167A1D
	lockall
	setvar VAR_TEMP_1, 0
	goto EventScript_167A59
	end

ThreeIsland_EventScript_167A29:: @ 8167A29
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_167A59
	end

ThreeIsland_EventScript_167A35:: @ 8167A35
	lockall
	setvar VAR_TEMP_1, 2
	goto EventScript_167A59
	end

ThreeIsland_EventScript_167A41:: @ 8167A41
	lockall
	setvar VAR_TEMP_1, 3
	goto EventScript_167A59
	end

ThreeIsland_EventScript_167A4D:: @ 8167A4D
	lockall
	setvar VAR_TEMP_1, 4
	goto EventScript_167A59
	end

EventScript_167A59:: @ 8167A59
	textcolor 0
	applymovement 5, Movement_WalkInPlaceFastestDown
	waitmovement 0
	playse SE_PIN
	applymovement 5, Movement_ExclamationMark
	waitmovement 0
	applymovement 5, Movement_Delay48
	waitmovement 0
	applymovement 5, Movement_167C57
	waitmovement 0
	playbgm MUS_SHOUNEN, 0
	msgbox gUnknown_81823ED, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_167C35
	msgbox gUnknown_818247D
	setvar VAR_LAST_TALKED, 5
	trainerbattle_no_intro TRAINER_BIKER_GOON, Text_1824B7
	applymovement 5, Movement_167C5C
	waitmovement 0
	msgbox gUnknown_81824CF
	closemessage
	applymovement 7, Movement_167C57
	waitmovement 0
	playbgm MUS_SHOUNEN, 0
	msgbox gUnknown_81824EF
	setvar VAR_LAST_TALKED, 7
	trainerbattle_no_intro TRAINER_BIKER_GOON_2, Text_182521
	applymovement 7, Movement_167C5C
	waitmovement 0
	msgbox gUnknown_8182536
	closemessage
	applymovement 4, Movement_167C57
	waitmovement 0
	playbgm MUS_SHOUNEN, 0
	msgbox gUnknown_8182582
	setvar VAR_LAST_TALKED, 4
	trainerbattle_no_intro TRAINER_BIKER_GOON_3, Text_1825D4
	applymovement 4, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement 6, Movement_WalkInPlaceFastestDown
	applymovement 8, Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox gUnknown_81825E2
	closemessage
	delay 45
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_167BC6
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_167BD8
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_167BEA
	compare VAR_TEMP_1, 3
	call_if_eq EventScript_167C03
	compare VAR_TEMP_1, 4
	call_if_eq EventScript_167C1C
	playbgm MUS_SHOUNEN, 0
	msgbox gUnknown_8182623
	setvar VAR_LAST_TALKED, 3
	trainerbattle_no_intro TRAINER_CUE_BALL_PAXTON, Text_1826B7
	msgbox gUnknown_818271D
	closemessage
	fadescreen FADE_TO_BLACK
	removeobject 3
	removeobject 5
	removeobject 7
	removeobject 4
	removeobject 6
	removeobject 8
	removeobject 14
	fadescreen FADE_FROM_BLACK
	setvar VAR_MAP_SCENE_THREE_ISLAND, 4
	releaseall
	end

EventScript_167BC6:: @ 8167BC6
	applymovement 4, Movement_WalkInPlaceFastestDown
	applymovement 3, Movement_167C5E
	waitmovement 0
	return

EventScript_167BD8:: @ 8167BD8
	applymovement 4, Movement_WalkInPlaceFastestDown
	applymovement 3, Movement_167C62
	waitmovement 0
	return

EventScript_167BEA:: @ 8167BEA
	applymovement 4, Movement_WalkInPlaceFastestDown
	applymovement 3, Movement_167C64
	applymovement OBJ_EVENT_ID_PLAYER, Movement_167C68
	waitmovement 0
	return

EventScript_167C03:: @ 8167C03
	applymovement 4, Movement_WalkInPlaceFastestDown
	applymovement OBJ_EVENT_ID_PLAYER, Movement_167C68
	applymovement 3, Movement_167C6C
	waitmovement 0
	return

EventScript_167C1C:: @ 8167C1C
	applymovement 4, Movement_WalkInPlaceFastestDown
	applymovement OBJ_EVENT_ID_PLAYER, Movement_167C68
	applymovement 3, Movement_167C71
	waitmovement 0
	return

EventScript_167C35:: @ 8167C35
	msgbox gUnknown_8182453
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_167C55
	waitmovement 0
	applymovement 5, Movement_167C59
	waitmovement 0
	fadedefaultbgm
	releaseall
	end

Movement_167C55:: @ 8167C55
	walk_down
	step_end

Movement_167C57:: @ 8167C57
	walk_down
	step_end

Movement_167C59:: @ 8167C59
	walk_up
	walk_in_place_fastest_left
	step_end

Movement_167C5C:: @ 8167C5C
	walk_in_place_down
	step_end

Movement_167C5E:: @ 8167C5E
	walk_down
	walk_left
	walk_in_place_fastest_down
	step_end

Movement_167C62:: @ 8167C62
	walk_down
	step_end

Movement_167C64:: @ 8167C64
	walk_down
	walk_down
	walk_in_place_fastest_right
	step_end

Movement_167C68:: @ 8167C68
	delay_16
	delay_16
	walk_in_place_fastest_left
	step_end

Movement_167C6C:: @ 8167C6C
	walk_down
	walk_down
	walk_right
	walk_in_place_fastest_right
	step_end

Movement_167C71:: @ 8167C71
	walk_down
	walk_down
	walk_right
	walk_right
	walk_in_place_fastest_right
	step_end

ThreeIsland_EventScript_167C77:: @ 8167C77
	msgbox gUnknown_81828EB, MSGBOX_NPC
	end

ThreeIsland_EventScript_167C80:: @ 8167C80
	msgbox gUnknown_818298A, MSGBOX_NPC
	end

ThreeIsland_EventScript_167C89:: @ 8167C89
	lock
	faceplayer
	waitse
	playmoncry SPECIES_DODUO, 0
	msgbox gUnknown_81829F4
	waitmoncry
	release
	end

ThreeIsland_EventScript_167C9C:: @ 8167C9C
	msgbox gUnknown_8182061, MSGBOX_SIGN
	end

ThreeIsland_EventScript_167CA5:: @ 8167CA5
	msgbox gUnknown_818208B, MSGBOX_NPC
	end
