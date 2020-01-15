VermilionCity_MapScripts:: @ 81668DC
	map_script MAP_SCRIPT_ON_TRANSITION, VermilionCity_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, VermilionCity_OnFrame
	.byte 0

VermilionCity_OnFrame:: @ 81668E7
	map_script_2 VAR_MAP_SCENE_VERMILION_CITY, 2, EventScript_1668F1
	.2byte 0

EventScript_1668F1:: @ 81668F1
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, Movement_166903
	waitmovement 0
	setvar VAR_MAP_SCENE_VERMILION_CITY, 3
	releaseall
	end

Movement_166903:: @ 8166903
	walk_up
	walk_up
	step_end

VermilionCity_OnTransition:: @ 8166906
	setworldmapflag FLAG_WORLD_MAP_VERMILION_CITY
	call_if_set FLAG_TALKED_TO_OAKS_AIDE_IN_VERMILION, EventScript_166913
	end

EventScript_166913:: @ 8166913
	setflag FLAG_HIDE_VERMILION_CITY_OAKS_AIDE
	return

VermilionCity_EventScript_166917:: @ 8166917
	msgbox gUnknown_817F723, MSGBOX_NPC
	end

VermilionCity_EventScript_166920:: @ 8166920
	lock
	faceplayer
	compare VAR_MAP_SCENE_VERMILION_CITY, 3
	goto_if_eq EventScript_166937
	msgbox gUnknown_817F776
	release
	end

EventScript_166937:: @ 8166937
	msgbox gUnknown_817F7A6
	release
	end

VermilionCity_EventScript_166941:: @ 8166941
	lock
	faceplayer
	compare VAR_MAP_SCENE_VERMILION_CITY, 3
	goto_if_eq EventScript_166996
	msgbox gUnknown_817FA22
	release
	end

EventScript_166958:: @ 8166958
	goto_if_unset FLAG_SYS_GOT_MYSTIC_TICKET, EventScript_SetResultFalse
	checkitem ITEM_MYSTIC_TICKET, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_SetResultFalse
	goto EventScript_SetResultTrue
	end

EventScript_166977:: @ 8166977
	goto_if_unset FLAG_SYS_GOT_AURORA_TICKET, EventScript_SetResultFalse
	checkitem ITEM_AURORA_TICKET, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_SetResultFalse
	goto EventScript_SetResultTrue
	end

EventScript_166996:: @ 8166996
	setvar VAR_0x8004, SEAGALLOP_VERMILION_CITY
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	goto_if_ge EventScript_1669BB
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 1
	goto_if_ge EventScript_166B3B
	msgbox gUnknown_817FB10
	release
	end

EventScript_1669BB:: @ 81669BB
	goto_if_questlog EventScript_ReleaseEnd
	special sub_8112364
	call EventScript_166958
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1669FD
	call EventScript_166977
	compare VAR_RESULT, 1
	goto_if_eq EventScript_166A5F
	setvar VAR_0x8004, SEAGALLOP_VERMILION_CITY
	message Text_17FBB8
	waitmessage
	goto EventScript_1A911E
	end

EventScript_1669FD:: @ 81669FD
	call EventScript_166977
	compare VAR_RESULT, 1
	goto_if_eq EventScript_166AB1
	call_if_unset FLAG_SHOWED_MYSTICTICKET_TO_CAPTAIN, EventScript_166A53
	message Text_17FCC1
	waitmessage
	multichoice 17, 6, MULTICHOICE_SEVII_NAVEL, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A911E
	case 1, EventScript_166B0B
	case 2, EventScript_CancelSail
	case 127, EventScript_CancelSail
	end

EventScript_166A53:: @ 8166A53
	setflag FLAG_SHOWED_MYSTICTICKET_TO_CAPTAIN
	msgbox gUnknown_817FC00
	return

EventScript_166A5F:: @ 8166A5F
	call_if_unset FLAG_SHOWED_AURORATICKET_TO_CAPTAIN, EventScript_166AA5
	message Text_17FCC1
	waitmessage
	multichoice 13, 6, MULTICHOICE_SEVII_BIRTH, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A911E
	case 1, EventScript_166B23
	case 2, EventScript_CancelSail
	case 127, EventScript_CancelSail
	end

EventScript_166AA5:: @ 8166AA5
	setflag FLAG_SHOWED_AURORATICKET_TO_CAPTAIN
	msgbox gUnknown_817FC5F
	return

EventScript_166AB1:: @ 8166AB1
	call_if_unset FLAG_SHOWED_MYSTICTICKET_TO_CAPTAIN, EventScript_166A53
	call_if_unset FLAG_SHOWED_AURORATICKET_TO_CAPTAIN, EventScript_166AA5
	message Text_17FCC1
	waitmessage
	multichoice 13, 5, MULTICHOICE_SEVII_NAVEL_BIRTH, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A911E
	case 1, EventScript_166B0B
	case 2, EventScript_166B23
	case 3, EventScript_CancelSail
	case 127, EventScript_CancelSail
	end

EventScript_166B0B:: @ 8166B0B
	msgbox gUnknown_817FCEC
	setvar VAR_0x8004, SEAGALLOP_VERMILION_CITY
	setvar VAR_0x8006, SEAGALLOP_NAVEL_ROCK
	goto EventScript_1A90DA
	end

EventScript_166B23:: @ 8166B23
	msgbox gUnknown_817FD5F
	setvar VAR_0x8004, SEAGALLOP_VERMILION_CITY
	setvar VAR_0x8006, SEAGALLOP_BIRTH_ISLAND
	goto EventScript_1A90DA
	end

EventScript_166B3B:: @ 8166B3B
	message Text_17FB23
	waitmessage
	setvar VAR_0x8004, SEAGALLOP_VERMILION_CITY
	multichoice 19, 5, MULTICHOICE_SEAGALLOP_123, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A8FEE
	case 1, EventScript_1A8FF9
	case 2, EventScript_1A9004
	case 3, EventScript_CancelSail
	case 127, EventScript_CancelSail
	end

EventScript_166B88:: @ 8166B88
	release
	end

VermilionCity_EventScript_166B8A:: @ 8166B8A
	lockall
	goto EventScript_166BA0
	end

VermilionCity_EventScript_166B91:: @ 8166B91
	lockall
	goto EventScript_166BA0
	end

VermilionCity_EventScript_166B98:: @ 8166B98
	lockall
	setvar VAR_VERMILION_CITY_TICKET_CHECK_TRIGGER, 0
	releaseall
	end

EventScript_166BA0:: @ 8166BA0
	textcolor 0
	applymovement 6, Movement_WalkInPlaceFastestLeft
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	compare VAR_MAP_SCENE_VERMILION_CITY, 3
	goto_if_eq EventScript_166BED
	msgbox gUnknown_817FA3C
	goto_if_unset FLAG_GOT_SS_TICKET, EventScript_166BDE
	msgbox gUnknown_817FA77
	setvar VAR_VERMILION_CITY_TICKET_CHECK_TRIGGER, 1
	releaseall
	end

EventScript_166BDE:: @ 8166BDE
	msgbox gUnknown_817FABA
	closemessage
	goto EventScript_1A9108
	end

EventScript_166BED:: @ 8166BED
	setvar VAR_0x8004, SEAGALLOP_VERMILION_CITY
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	goto_if_ge EventScript_1669BB
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 1
	goto_if_ge EventScript_166B3B
	msgbox gUnknown_817FB10
	closemessage
	goto EventScript_1A9108
	end

VermilionCity_EventScript_166C17:: @ 8166C17
	msgbox gUnknown_817F8AC, MSGBOX_NPC
	end

VermilionCity_EventScript_166C20:: @ 8166C20
	lock
	faceplayer
	setflag FLAG_TALKED_TO_OAKS_AIDE_IN_VERMILION
	msgbox gUnknown_817FDD2
	release
	end

VermilionCity_EventScript_166C2F:: @ 8166C2F
	msgbox gUnknown_817F7FD, MSGBOX_NPC
	end

VermilionCity_EventScript_166C38:: @ 8166C38
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MACHOP, 0
	msgbox gUnknown_817F871
	waitmoncry
	msgbox gUnknown_817F888
	release
	end

VermilionCity_EventScript_166C53:: @ 8166C53
	msgbox gUnknown_817F8FB, MSGBOX_SIGN
	end

VermilionCity_EventScript_166C5C:: @ 8166C5C
	msgbox gUnknown_817F928, MSGBOX_SIGN
	end

VermilionCity_EventScript_166C65:: @ 8166C65
	msgbox gUnknown_817F9A1, MSGBOX_SIGN
	end

VermilionCity_EventScript_166C6E:: @ 8166C6E
	lockall
	famechecker FAMECHECKER_LTSURGE, 0
	msgbox gUnknown_817F9CC
	releaseall
	end

VermilionCity_EventScript_166C86:: @ 8166C86
	msgbox gUnknown_817FA11, MSGBOX_SIGN
	end
