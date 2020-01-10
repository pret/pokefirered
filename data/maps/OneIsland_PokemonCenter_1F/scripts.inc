OneIsland_PokemonCenter_1F_MapScripts:: @ 8170BF8
	map_script MAP_SCRIPT_ON_TRANSITION, OneIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, OneIsland_PokemonCenter_1F_MapScript2_1BC05C
	map_script MAP_SCRIPT_ON_LOAD, OneIsland_PokemonCenter_1F_OnLoad
	map_script MAP_SCRIPT_ON_FRAME_TABLE, OneIsland_PokemonCenter_1F_OnFrame
	.byte 0

OneIsland_PokemonCenter_1F_OnLoad:: @ 8170C0D
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	call_if_ge EventScript_170C22
	call_if_set FLAG_SYS_CAN_LINK_WITH_RS, EventScript_170C36
	end

EventScript_170C22:: @ 8170C22
	setmetatile 13, 4, 861, 1
	return

EventScript_170C2C:: @ 8170C2C
	setmetatile 16, 4, 863, 1
	return

EventScript_170C36:: @ 8170C36
	call EventScript_170C2C
	setmetatile 14, 4, 858, 1
	setmetatile 15, 4, 859, 1
	return

OneIsland_PokemonCenter_1F_OnTransition:: @ 8170C4E
	setrespawn SPAWN_ONE_ISLAND
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 6
	call_if_eq EventScript_170C73
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 0
	call_if_eq EventScript_170C79
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 2
	call_if_eq EventScript_170C90
	end

EventScript_170C73:: @ 8170C73
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 7
	return

EventScript_170C79:: @ 8170C79
	setobjectxyperm 2, 9, 8
	setobjectmovementtype 2, 7
	setobjectxyperm 3, 15, 6
	setobjectmovementtype 3, 7
	return

EventScript_170C90:: @ 8170C90
	setobjectxyperm 2, 14, 7
	setobjectmovementtype 2, 9
	setobjectxyperm 3, 14, 8
	setobjectmovementtype 3, 9
	return

OneIsland_PokemonCenter_1F_OnFrame:: @ 8170CA7
	map_script_2 VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 0, EventScript_170CB1
	.2byte 0

EventScript_170CB1:: @ 8170CB1
	lockall
	textcolor 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_170E7D
	applymovement 2, Movement_170E86
	waitmovement 0
	msgbox gUnknown_81A0CDE
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	playse SE_PIN
	applymovement 3, Movement_ExclamationMark
	waitmovement 0
	applymovement 3, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement 3, Movement_Delay48
	waitmovement 0
	msgbox gUnknown_81A0CF7
	msgbox gUnknown_81A0D27
	applymovement 2, Movement_WalkInPlaceFastestDown
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox gUnknown_81A0D72
	applymovement 2, Movement_WalkInPlaceFastestRight
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	call_if_set FLAG_SYS_GAME_CLEAR, EventScript_170E34
	call_if_unset FLAG_SYS_GAME_CLEAR, EventScript_170E3D
	applymovement 3, Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox gUnknown_81A0E17
	msgbox gUnknown_81A0E90
	applymovement 3, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox gUnknown_81A0ECC
	closemessage
	applymovement 2, Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox gUnknown_81A0F40
	applymovement 2, Movement_WalkInPlaceFastestDown
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox gUnknown_81A0FB1
	msgreceiveditem gUnknown_81A10EE, ITEM_METEORITE, 1, MUS_FAN5
	additem ITEM_METEORITE
	applymovement 3, Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox gUnknown_81A1113
	giveitem_msg gUnknown_81A231B, ITEM_TRI_PASS, 1, MUS_FAN5
	msgbox gUnknown_81A1150
	compare VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	call_if_ge EventScript_170E46
	compare VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	call_if_lt EventScript_170E58
	setflag FLAG_SYS_SEVII_MAP_123
	msgbox gUnknown_81A1230
	closemessage
	applymovement 2, Movement_WalkInPlaceFastestUp
	waitmovement 0
	applymovement 3, Movement_WalkInPlaceFastestUp
	waitmovement 0
	setflag FLAG_SYS_PC_STORAGE_DISABLED
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 1
	releaseall
	end

EventScript_170E34:: @ 8170E34
	msgbox gUnknown_81A0DE8
	return

EventScript_170E3D:: @ 8170E3D
	msgbox gUnknown_81A0DAC
	return

EventScript_170E46:: @ 8170E46
	textcolor 3
	playfanfare MUS_FAN5
	message Text_1A11EC
	waitmessage
	waitfanfare
	call EventScript_1A6675
	return

EventScript_170E58:: @ 8170E58
	setflag FLAG_HIDE_TOWN_MAP
	setvar VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	giveitem_msg gUnknown_81A1218, ITEM_TOWN_MAP, 1, MUS_FAN5
	return

Movement_170E7D:: @ 8170E7D
	walk_up
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

Movement_170E86:: @ 8170E86
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_in_place_fastest_right
	step_end

Movement_170E8F:: @ 8170E8F
	walk_up
	step_end

Movement_170E91:: @ 8170E91
	walk_left
	walk_in_place_fastest_right
	step_end

OneIsland_PokemonCenter_1F_EventScript_170E94:: @ 8170E94
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

OneIsland_PokemonCenter_1F_EventScript_170E9D:: @ 8170E9D
	lock
	goto_if_set FLAG_SEVII_DETOUR_FINISHED, EventScript_170EB1
	msgbox gUnknown_81A1266
	release
	end

EventScript_170EB1:: @ 8170EB1
	applymovement 2, Movement_FacePlayer
	waitmovement 0
	msgbox gUnknown_81A128C
	release
	end

OneIsland_PokemonCenter_1F_EventScript_170EC5:: @ 8170EC5
	lock
	faceplayer
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 7
	goto_if_eq EventScript_170F35
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 6
	goto_if_eq EventScript_170F9B
	goto_if_set FLAG_RECOVERED_SAPPHIRE, EventScript_170FA5
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	goto_if_eq EventScript_17103A
	goto_if_set FLAG_GOT_RUBY, EventScript_171044
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4
	goto_if_eq EventScript_1710F2
	specialvar VAR_RESULT, IsNationalPokedexEnabled
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1710FC
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 3
	goto_if_eq EventScript_171134
	msgbox gUnknown_81A1321
	closemessage
	applymovement 3, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

EventScript_170F35:: @ 8170F35
	msgbox gUnknown_81A1EBD
	random 3
	compare VAR_RESULT, 0
	goto_if_eq EventScript_170F6D
	compare VAR_RESULT, 1
	goto_if_eq EventScript_170F84
	famechecker FAMECHECKER_BILL, 5
	msgbox gUnknown_81A2076
	release
	end

EventScript_170F6D:: @ 8170F6D
	famechecker FAMECHECKER_BILL, 3
	msgbox gUnknown_81A1EF3
	release
	end

EventScript_170F84:: @ 8170F84
	famechecker FAMECHECKER_BILL, 4
	msgbox gUnknown_81A1F7C
	release
	end

EventScript_170F9B:: @ 8170F9B
	msgbox gUnknown_81A1E39
	release
	end

EventScript_170FA5:: @ 8170FA5
	textcolor 3
	playfanfare MUS_ME_WAZA
	message Text_1A1C2D
	waitmessage
	waitfanfare
	call EventScript_1A6675
	removeitem ITEM_SAPPHIRE, 1
	msgbox gUnknown_81A1C4E
	closemessage
	applymovement 3, Movement_171142
	waitmovement 0
	playse SE_TK_KASYA
	call EventScript_170C2C
	special DrawWholeMapView
	msgbox gUnknown_81A1D45
	closemessage
	delay 60
	applymovement 3, Movement_17113E
	waitmovement 0
	delay 30
	applymovement 3, Movement_17113E
	waitmovement 0
	delay 40
	playse SE_PC_ON
	call EventScript_170C36
	special DrawWholeMapView
	msgbox gUnknown_81A1D59
	applymovement 3, Movement_FacePlayer
	waitmovement 0
	msgbox gUnknown_81A1D7D
	special sub_810B82C
	setflag FLAG_SYS_CAN_LINK_WITH_RS
	setflag FLAG_HIDE_CERULEAN_CAVE_GUARD
	setflag FLAG_HIDE_LORELEI_IN_HER_HOUSE
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 6
	special InitRoamer
	release
	end

EventScript_17103A:: @ 817103A
	msgbox gUnknown_81A1BB7
	release
	end

EventScript_171044:: @ 8171044
	msgbox gUnknown_81A197E
	textcolor 3
	playfanfare MUS_ME_WAZA
	message Text_1A198D
	waitmessage
	waitfanfare
	call EventScript_1A6675
	closemessage
	applymovement 3, Movement_171142
	waitmovement 0
	playse SE_TK_KASYA
	call EventScript_170C22
	special DrawWholeMapView
	delay 30
	applymovement 3, Movement_FacePlayer
	waitmovement 0
	msgbox gUnknown_81A19AA, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_171099
	goto EventScript_1710B2
	end

EventScript_171099:: @ 8171099
	msgbox gUnknown_81A1A08, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_171099
	goto EventScript_1710B2
	end

EventScript_1710B2:: @ 81710B2
	msgbox gUnknown_81A1A3F
	removeitem ITEM_RUBY, 1
	removeitem ITEM_TRI_PASS, 1
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	additem ITEM_RAINBOW_PASS
	setflag FLAG_SYS_SEVII_MAP_4567
	textcolor 3
	playfanfare MUS_FAN5
	message Text_1A1B56
	waitmessage
	waitfanfare
	playfanfare MUS_FAN5
	message Text_1A1B8E
	waitmessage
	waitfanfare
	call EventScript_1A6675
	goto EventScript_17103A
	end

EventScript_1710F2:: @ 81710F2
	msgbox gUnknown_81A1896
	release
	end

EventScript_1710FC:: @ 81710FC
	msgbox gUnknown_81A169B
	applymovement 3, Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox gUnknown_81A1723
	applymovement 3, Movement_FacePlayer
	waitmovement 0
	msgbox gUnknown_81A17DF
	setvar VAR_MAP_SCENE_MT_EMBER_EXTERIOR, 1
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4
	release
	end

EventScript_171134:: @ 8171134
	msgbox gUnknown_81A15EC
	release
	end

Movement_17113E:: @ 817113E
	walk_in_place_up
	delay_8
	walk_in_place_up
	step_end

Movement_171142:: @ 8171142
	walk_in_place_fastest_up
	walk_in_place_up
	delay_16
	walk_in_place_up
	walk_in_place_up
	step_end

OneIsland_PokemonCenter_1F_EventScript_171148:: @ 8171148
	msgbox gUnknown_81A20D5, MSGBOX_NPC
	end

OneIsland_PokemonCenter_1F_EventScript_171151:: @ 8171151
	msgbox gUnknown_81A212D, MSGBOX_NPC
	end

OneIsland_PokemonCenter_1F_EventScript_17115A:: @ 817115A
	lock
	faceplayer
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, EventScript_17116F
	msgbox gUnknown_81A218D
	release
	end

EventScript_17116F:: @ 817116F
	msgbox gUnknown_81A21D0
	release
	end

OneIsland_PokemonCenter_1F_EventScript_171179:: @ 8171179
	lockall
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, EventScript_1711A0
	goto_if_set FLAG_SEVII_DETOUR_FINISHED, EventScript_171196
	msgbox gUnknown_81A223F
	releaseall
	end

EventScript_171196:: @ 8171196
	msgbox gUnknown_81A2286
	releaseall
	end

EventScript_1711A0:: @ 81711A0
	msgbox gUnknown_81A22CB
	releaseall
	end

OneIsland_PokemonCenter_1F_EventScript_1711AA:: @ 81711AA
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_1711DA
	end

OneIsland_PokemonCenter_1F_EventScript_1711B6:: @ 81711B6
	lockall
	setvar VAR_TEMP_1, 2
	goto EventScript_1711DA
	end

OneIsland_PokemonCenter_1F_EventScript_1711C2:: @ 81711C2
	lockall
	setvar VAR_TEMP_1, 3
	goto EventScript_1711DA
	end

OneIsland_PokemonCenter_1F_EventScript_1711CE:: @ 81711CE
	lockall
	setvar VAR_TEMP_1, 4
	goto EventScript_1711DA
	end

EventScript_1711DA:: @ 81711DA
	textcolor 0
	playse SE_PIN
	applymovement 2, Movement_ExclamationMark
	waitmovement 0
	msgbox gUnknown_81A13B8
	closemessage
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_1712E4
	compare VAR_TEMP_1, 2
	call_if_eq EventScript_1712EF
	compare VAR_TEMP_1, 3
	call_if_eq EventScript_1712FA
	compare VAR_TEMP_1, 4
	call_if_eq EventScript_171305
	delay 10
	msgbox gUnknown_81A13CB
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox gUnknown_81A1431
	applymovement 2, Movement_WalkInPlaceFastestDown
	waitmovement 0
	applymovement 3, Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox gUnknown_81A1470
	msgbox gUnknown_81A14E1
	closemessage
	applymovement 2, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	delay 10
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	delay 15
	msgbox gUnknown_81A14FB
	closemessage
	applymovement 2, Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 15
	applymovement 3, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox gUnknown_81A1574
	closemessage
	delay 25
	applymovement OBJ_EVENT_ID_PLAYER, Movement_171326
	applymovement 2, Movement_17132D
	waitmovement 0
	playse SE_KAIDAN
	setflag FLAG_HIDE_ONE_ISLAND_POKECENTER_BILL
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 3
	clearflag FLAG_HIDE_CINNABAR_BILL
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 3
	setvar VAR_0x8004, SEAGALLOP_ONE_ISLAND
	setvar VAR_0x8006, SEAGALLOP_CINNABAR_ISLAND
	goto EventScript_1A90DA
	end

EventScript_1712E4:: @ 81712E4
	applymovement OBJ_EVENT_ID_PLAYER, Movement_171310
	waitmovement 0
	return

EventScript_1712EF:: @ 81712EF
	applymovement OBJ_EVENT_ID_PLAYER, Movement_171314
	waitmovement 0
	return

EventScript_1712FA:: @ 81712FA
	applymovement OBJ_EVENT_ID_PLAYER, Movement_171316
	waitmovement 0
	return

EventScript_171305:: @ 8171305
	applymovement OBJ_EVENT_ID_PLAYER, Movement_17131A
	waitmovement 0
	return

Movement_171310:: @ 8171310
	walk_right
	walk_down
	walk_in_place_fastest_right
	step_end

Movement_171314:: @ 8171314
	walk_right
	step_end

Movement_171316:: @ 8171316
	walk_right
	walk_up
	walk_in_place_fastest_right
	step_end

Movement_17131A:: @ 817131A
	walk_right
	walk_up
	walk_up
	walk_in_place_fastest_right
	step_end

Movement_17131F:: @ 817131F
	delay_16
	delay_16
	delay_4
	walk_in_place_fastest_left
	step_end

Movement_171324:: @ 8171324
	walk_in_place_fast_down
	step_end

Movement_171326:: @ 8171326
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	step_end

Movement_17132D:: @ 817132D
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	step_end
