VermilionCity_MapScripts:: @ 81668DC
	map_script 3, VermilionCity_MapScript1_166906
	map_script 2, VermilionCity_MapScript2_1668E7
	.byte 0

VermilionCity_MapScript2_1668E7:: @ 81668E7
	map_script_2 VAR_MAP_SCENE_VERMILION_CITY, 2, EventScript_1668F1
	.2byte 0

EventScript_1668F1:: @ 81668F1
	lockall
	applymovement 255, Movement_166903
	waitmovement 0
	setvar VAR_MAP_SCENE_VERMILION_CITY, 3
	releaseall
	end

Movement_166903:: @ 8166903
	step_11
	step_11
	step_end

VermilionCity_MapScript1_166906:: @ 8166906
	setworldmapflag FLAG_WORLD_MAP_VERMILION_CITY
	checkflag FLAG_0x2F9
	call_if 1, EventScript_166913
	end

EventScript_166913:: @ 8166913
	setflag FLAG_0x0A1
	return

VermilionCity_EventScript_166917:: @ 8166917
	loadword 0, gUnknown_817F723
	callstd 2
	end

VermilionCity_EventScript_166920:: @ 8166920
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_VERMILION_CITY, 3
	goto_if 1, EventScript_166937
	loadword 0, gUnknown_817F776
	callstd 4
	release
	end

EventScript_166937:: @ 8166937
	loadword 0, gUnknown_817F7A6
	callstd 4
	release
	end

VermilionCity_EventScript_166941:: @ 8166941
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_VERMILION_CITY, 3
	goto_if 1, EventScript_166996
	loadword 0, gUnknown_817FA22
	callstd 4
	release
	end

EventScript_166958:: @ 8166958
	checkflag FLAG_0x84A
	goto_if 0, EventScript_1A77B0
	checkitem ITEM_MYSTIC_TICKET, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1A77B0
	goto EventScript_1A77AA
	end

EventScript_166977:: @ 8166977
	checkflag FLAG_0x84B
	goto_if 0, EventScript_1A77B0
	checkitem ITEM_AURORA_TICKET, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1A77B0
	goto EventScript_1A77AA
	end

EventScript_166996:: @ 8166996
	setvar VAR_0x8004, 0
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	goto_if 4, EventScript_1669BB
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 1
	goto_if 4, EventScript_166B3B
	loadword 0, gUnknown_817FB10
	callstd 4
	release
	end

EventScript_1669BB:: @ 81669BB
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_8112364
	call EventScript_166958
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_1669FD
	call EventScript_166977
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_166A5F
	setvar VAR_0x8004, 0
	message Text_17FBB8
	waitmessage
	goto EventScript_1A911E
	end

EventScript_1669FD:: @ 81669FD
	call EventScript_166977
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_166AB1
	checkflag FLAG_0x2F0
	call_if 0, EventScript_166A53
	message Text_17FCC1
	waitmessage
	multichoice 17, 6, 54, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_1A911E
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_166B0B
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_1A90F6
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_1A90F6
	end

EventScript_166A53:: @ 8166A53
	setflag FLAG_0x2F0
	loadword 0, gUnknown_817FC00
	callstd 4
	return

EventScript_166A5F:: @ 8166A5F
	checkflag FLAG_0x2F1
	call_if 0, EventScript_166AA5
	message Text_17FCC1
	waitmessage
	multichoice 13, 6, 55, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_1A911E
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_166B23
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_1A90F6
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_1A90F6
	end

EventScript_166AA5:: @ 8166AA5
	setflag FLAG_0x2F1
	loadword 0, gUnknown_817FC5F
	callstd 4
	return

EventScript_166AB1:: @ 8166AB1
	checkflag FLAG_0x2F0
	call_if 0, EventScript_166A53
	checkflag FLAG_0x2F1
	call_if 0, EventScript_166AA5
	message Text_17FCC1
	waitmessage
	multichoice 13, 5, 56, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_1A911E
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_166B0B
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_166B23
	compare_var_to_value VAR_0x8000, 3
	goto_if 1, EventScript_1A90F6
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_1A90F6
	end

EventScript_166B0B:: @ 8166B0B
	loadword 0, gUnknown_817FCEC
	callstd 4
	setvar VAR_0x8004, 0
	setvar VAR_0x8006, 9
	goto EventScript_1A90DA
	end

EventScript_166B23:: @ 8166B23
	loadword 0, gUnknown_817FD5F
	callstd 4
	setvar VAR_0x8004, 0
	setvar VAR_0x8006, 10
	goto EventScript_1A90DA
	end

EventScript_166B3B:: @ 8166B3B
	message Text_17FB23
	waitmessage
	setvar VAR_0x8004, 0
	multichoice 19, 5, 57, 0
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_1A8FEE
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_1A8FF9
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_1A9004
	compare_var_to_value VAR_0x8000, 3
	goto_if 1, EventScript_1A90F6
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_1A90F6
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
	setvar VAR_0x4053, 0
	releaseall
	end

EventScript_166BA0:: @ 8166BA0
	textcolor 0
	applymovement 6, Movement_1A75E7
	applymovement 255, Movement_1A75EB
	waitmovement 0
	compare_var_to_value VAR_MAP_SCENE_VERMILION_CITY, 3
	goto_if 1, EventScript_166BED
	loadword 0, gUnknown_817FA3C
	callstd 4
	checkflag FLAG_0x234
	goto_if 0, EventScript_166BDE
	loadword 0, gUnknown_817FA77
	callstd 4
	setvar VAR_0x4053, 1
	releaseall
	end

EventScript_166BDE:: @ 8166BDE
	loadword 0, gUnknown_817FABA
	callstd 4
	closemessage
	goto EventScript_1A9108
	end

EventScript_166BED:: @ 8166BED
	setvar VAR_0x8004, 0
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	goto_if 4, EventScript_1669BB
	compare_var_to_value VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 1
	goto_if 4, EventScript_166B3B
	loadword 0, gUnknown_817FB10
	callstd 4
	closemessage
	goto EventScript_1A9108
	end

VermilionCity_EventScript_166C17:: @ 8166C17
	loadword 0, gUnknown_817F8AC
	callstd 2
	end

VermilionCity_EventScript_166C20:: @ 8166C20
	lock
	faceplayer
	setflag FLAG_0x2F9
	loadword 0, gUnknown_817FDD2
	callstd 4
	release
	end

VermilionCity_EventScript_166C2F:: @ 8166C2F
	loadword 0, gUnknown_817F7FD
	callstd 2
	end

VermilionCity_EventScript_166C38:: @ 8166C38
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MACHOP, 0
	loadword 0, gUnknown_817F871
	callstd 4
	waitmoncry
	loadword 0, gUnknown_817F888
	callstd 4
	release
	end

VermilionCity_EventScript_166C53:: @ 8166C53
	loadword 0, gUnknown_817F8FB
	callstd 3
	end

VermilionCity_EventScript_166C5C:: @ 8166C5C
	loadword 0, gUnknown_817F928
	callstd 3
	end

VermilionCity_EventScript_166C65:: @ 8166C65
	loadword 0, gUnknown_817F9A1
	callstd 3
	end

VermilionCity_EventScript_166C6E:: @ 8166C6E
	lockall
	setvar VAR_0x8004, 4
	setvar VAR_0x8005, 0
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_817F9CC
	callstd 4
	releaseall
	end

VermilionCity_EventScript_166C86:: @ 8166C86
	loadword 0, gUnknown_817FA11
	callstd 3
	end
