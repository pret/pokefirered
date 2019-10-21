OneIsland_PokemonCenter_1F_MapScripts:: @ 8170BF8
	map_script 3, OneIsland_PokemonCenter_1F_MapScript1_170C4E
	map_script 5, OneIsland_PokemonCenter_1F_MapScript2_1BC05C
	map_script 1, OneIsland_PokemonCenter_1F_MapScript3_170C0D
	map_script 2, OneIsland_PokemonCenter_1F_MapScript4_170CA7
	.byte 0

OneIsland_PokemonCenter_1F_MapScript3_170C0D:: @ 8170C0D
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	call_if ge, EventScript_170C22
	checkflag FLAG_0x844
	call_if eq, EventScript_170C36
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

OneIsland_PokemonCenter_1F_MapScript1_170C4E:: @ 8170C4E
	setrespawn SPAWN_ONE_ISLAND
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 6
	call_if eq, EventScript_170C73
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 0
	call_if eq, EventScript_170C79
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 2
	call_if eq, EventScript_170C90
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

OneIsland_PokemonCenter_1F_MapScript4_170CA7:: @ 8170CA7
	map_script_2 VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 0, EventScript_170CB1
	.2byte 0

EventScript_170CB1:: @ 8170CB1
	lockall
	textcolor 0
	applymovement 255, Movement_170E7D
	applymovement 2, Movement_170E86
	waitmovement 0
	msgbox gUnknown_81A0CDE
	applymovement 255, Movement_1A75EB
	waitmovement 0
	playse SE_PIN
	applymovement 3, Movement_1A75DB
	waitmovement 0
	applymovement 3, Movement_1A75E7
	waitmovement 0
	applymovement 3, Movement_1A75DD
	waitmovement 0
	msgbox gUnknown_81A0CF7
	msgbox gUnknown_81A0D27
	applymovement 2, Movement_1A75ED
	applymovement 255, Movement_1A75E9
	waitmovement 0
	msgbox gUnknown_81A0D72
	applymovement 2, Movement_1A75EB
	waitmovement 0
	applymovement 255, Movement_1A75EB
	waitmovement 0
	checkflag FLAG_SYS_GAME_CLEAR
	call_if eq, EventScript_170E34
	checkflag FLAG_SYS_GAME_CLEAR
	call_if lt, EventScript_170E3D
	applymovement 3, Movement_1A75ED
	waitmovement 0
	msgbox gUnknown_81A0E17
	msgbox gUnknown_81A0E90
	applymovement 3, Movement_1A75E7
	waitmovement 0
	msgbox gUnknown_81A0ECC
	closemessage
	applymovement 2, Movement_1A75E9
	waitmovement 0
	msgbox gUnknown_81A0F40
	applymovement 2, Movement_1A75ED
	waitmovement 0
	applymovement 255, Movement_1A75E9
	waitmovement 0
	msgbox gUnknown_81A0FB1
	giveitemfanfaremsg gUnknown_81A10EE, ITEM_METEORITE, 1, MUS_FAN5
	additem ITEM_METEORITE, 1
	applymovement 3, Movement_1A75ED
	waitmovement 0
	msgbox gUnknown_81A1113
	additem ITEM_TRI_PASS, 1
	giveitemfanfaremsg gUnknown_81A231B, ITEM_TRI_PASS, 1, MUS_FAN5
	msgbox gUnknown_81A1150
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	call_if ge, EventScript_170E46
	compare_var_to_value VAR_MAP_SCENE_PALLET_TOWN_GARYS_HOUSE, 2
	call_if lt, EventScript_170E58
	setflag FLAG_0x845
	msgbox gUnknown_81A1230
	closemessage
	applymovement 2, Movement_1A75E9
	waitmovement 0
	applymovement 3, Movement_1A75E9
	waitmovement 0
	setflag FLAG_0x841
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
	additem ITEM_TOWN_MAP, 1
	giveitemfanfaremsg gUnknown_81A1218, ITEM_TOWN_MAP, 1, MUS_FAN5
	return

Movement_170E7D:: @ 8170E7D
	step_11
	step_11
	step_13
	step_13
	step_13
	step_13
	step_13
	step_2e
	step_end

Movement_170E86:: @ 8170E86
	step_11
	step_13
	step_13
	step_13
	step_13
	step_13
	step_11
	step_30
	step_end

Movement_170E8F:: @ 8170E8F
	step_11
	step_end

Movement_170E91:: @ 8170E91
	step_12
	step_30
	step_end

OneIsland_PokemonCenter_1F_EventScript_170E94:: @ 8170E94
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

OneIsland_PokemonCenter_1F_EventScript_170E9D:: @ 8170E9D
	lock
	checkflag FLAG_0x2A1
	goto_if_eq EventScript_170EB1
	msgbox gUnknown_81A1266
	release
	end

EventScript_170EB1:: @ 8170EB1
	applymovement 2, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_81A128C
	release
	end

OneIsland_PokemonCenter_1F_EventScript_170EC5:: @ 8170EC5
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 7
	goto_if_eq EventScript_170F35
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 6
	goto_if_eq EventScript_170F9B
	checkflag FLAG_0x2DC
	goto_if_eq EventScript_170FA5
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	goto_if_eq EventScript_17103A
	checkflag FLAG_0x2DD
	goto_if_eq EventScript_171044
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4
	goto_if_eq EventScript_1710F2
	specialvar VAR_RESULT, IsNationalPokedexEnabled
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_1710FC
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 3
	goto_if_eq EventScript_171134
	msgbox gUnknown_81A1321
	closemessage
	applymovement 3, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_170F35:: @ 8170F35
	msgbox gUnknown_81A1EBD
	random 3
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_170F6D
	compare_var_to_value VAR_RESULT, 1
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
	applymovement 3, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_81A1D7D
	special sub_810B82C
	setflag FLAG_0x844
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
	applymovement 3, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_81A19AA, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_171099
	goto EventScript_1710B2
	end

EventScript_171099:: @ 8171099
	msgbox gUnknown_81A1A08, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_171099
	goto EventScript_1710B2
	end

EventScript_1710B2:: @ 81710B2
	msgbox gUnknown_81A1A3F
	removeitem ITEM_RUBY, 1
	removeitem ITEM_TRI_PASS, 1
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	additem ITEM_RAINBOW_PASS, 1
	setflag FLAG_0x846
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
	applymovement 3, Movement_1A75E9
	waitmovement 0
	msgbox gUnknown_81A1723
	applymovement 3, Movement_1A75E1
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
	step_26
	step_1b
	step_26
	step_end

Movement_171142:: @ 8171142
	step_2e
	step_26
	step_1c
	step_26
	step_26
	step_end

OneIsland_PokemonCenter_1F_EventScript_171148:: @ 8171148
	msgbox gUnknown_81A20D5, 2
	end

OneIsland_PokemonCenter_1F_EventScript_171151:: @ 8171151
	msgbox gUnknown_81A212D, 2
	end

OneIsland_PokemonCenter_1F_EventScript_17115A:: @ 817115A
	lock
	faceplayer
	checkflag FLAG_0x844
	goto_if_eq EventScript_17116F
	msgbox gUnknown_81A218D
	release
	end

EventScript_17116F:: @ 817116F
	msgbox gUnknown_81A21D0
	release
	end

OneIsland_PokemonCenter_1F_EventScript_171179:: @ 8171179
	lockall
	checkflag FLAG_0x844
	goto_if_eq EventScript_1711A0
	checkflag FLAG_0x2A1
	goto_if_eq EventScript_171196
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
	setvar VAR_0x4001, 1
	goto EventScript_1711DA
	end

OneIsland_PokemonCenter_1F_EventScript_1711B6:: @ 81711B6
	lockall
	setvar VAR_0x4001, 2
	goto EventScript_1711DA
	end

OneIsland_PokemonCenter_1F_EventScript_1711C2:: @ 81711C2
	lockall
	setvar VAR_0x4001, 3
	goto EventScript_1711DA
	end

OneIsland_PokemonCenter_1F_EventScript_1711CE:: @ 81711CE
	lockall
	setvar VAR_0x4001, 4
	goto EventScript_1711DA
	end

EventScript_1711DA:: @ 81711DA
	textcolor 0
	playse SE_PIN
	applymovement 2, Movement_1A75DB
	waitmovement 0
	msgbox gUnknown_81A13B8
	closemessage
	compare_var_to_value VAR_0x4001, 1
	call_if eq, EventScript_1712E4
	compare_var_to_value VAR_0x4001, 2
	call_if eq, EventScript_1712EF
	compare_var_to_value VAR_0x4001, 3
	call_if eq, EventScript_1712FA
	compare_var_to_value VAR_0x4001, 4
	call_if eq, EventScript_171305
	delay 10
	msgbox gUnknown_81A13CB
	applymovement 255, Movement_1A75ED
	waitmovement 0
	msgbox gUnknown_81A1431
	applymovement 2, Movement_1A75ED
	waitmovement 0
	applymovement 3, Movement_1A75E9
	waitmovement 0
	msgbox gUnknown_81A1470
	msgbox gUnknown_81A14E1
	closemessage
	applymovement 2, Movement_1A75E7
	waitmovement 0
	delay 10
	applymovement 255, Movement_1A75EB
	waitmovement 0
	delay 15
	msgbox gUnknown_81A14FB
	closemessage
	applymovement 2, Movement_1A75ED
	waitmovement 0
	delay 15
	applymovement 3, Movement_1A75E7
	waitmovement 0
	applymovement 255, Movement_1A75ED
	waitmovement 0
	msgbox gUnknown_81A1574
	closemessage
	delay 25
	applymovement 255, Movement_171326
	applymovement 2, Movement_17132D
	waitmovement 0
	playse SE_KAIDAN
	setflag FLAG_HIDE_ONE_ISLAND_POKECENTER_BILL
	setvar VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 3
	clearflag FLAG_HIDE_CINNABAR_BILL
	setvar VAR_MAP_SCENE_CINNABAR_ISLAND, 3
	setvar VAR_0x8004, 1
	setvar VAR_0x8006, 8
	goto EventScript_1A90DA
	end

EventScript_1712E4:: @ 81712E4
	applymovement 255, Movement_171310
	waitmovement 0
	return

EventScript_1712EF:: @ 81712EF
	applymovement 255, Movement_171314
	waitmovement 0
	return

EventScript_1712FA:: @ 81712FA
	applymovement 255, Movement_171316
	waitmovement 0
	return

EventScript_171305:: @ 8171305
	applymovement 255, Movement_17131A
	waitmovement 0
	return

Movement_171310:: @ 8171310
	step_13
	step_10
	step_30
	step_end

Movement_171314:: @ 8171314
	step_13
	step_end

Movement_171316:: @ 8171316
	step_13
	step_11
	step_30
	step_end

Movement_17131A:: @ 817131A
	step_13
	step_11
	step_11
	step_30
	step_end

Movement_17131F:: @ 817131F
	step_1c
	step_1c
	step_1a
	step_2f
	step_end

Movement_171324:: @ 8171324
	step_29
	step_end

Movement_171326:: @ 8171326
	step_12
	step_12
	step_12
	step_12
	step_10
	step_10
	step_end

Movement_17132D:: @ 817132D
	step_12
	step_12
	step_12
	step_12
	step_12
	step_10
	step_end
