VermilionCity_PokemonFanClub_MapScripts:: @ 816B47E
	.byte 0

VermilionCity_PokemonFanClub_EventScript_16B47F:: @ 816B47F
	lock
	faceplayer
	checkflag FLAG_0x241
	goto_if 1, EventScript_16B4A7
	loadword 0, gUnknown_819457E
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16B4B1
	loadword 0, gUnknown_8194860
	callstd 4
	release
	end

EventScript_16B4A7:: @ 816B4A7
	loadword 0, gUnknown_819488E
	callstd 4
	release
	end

EventScript_16B4B1:: @ 816B4B1
	loadword 0, gUnknown_8194628
	callstd 4
	checkitemspace ITEM_BIKE_VOUCHER, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16B4F2
	setflag FLAG_0x241
	additem ITEM_BIKE_VOUCHER, 1
	giveitemfanfaremsg gUnknown_819474E, ITEM_BIKE_VOUCHER, 1, BGM_FRLG_ME_KEYITEM
	loadword 0, gUnknown_819477C
	callstd 4
	release
	end

EventScript_16B4F2:: @ 816B4F2
	loadword 0, gUnknown_81948D2
	callstd 4
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B4FC:: @ 816B4FC
	lock
	faceplayer
	checkflag FLAG_0x82C
	goto_if 1, EventScript_16B511
	loadword 0, gUnknown_81948E6
	callstd 4
	release
	end

EventScript_16B511:: @ 816B511
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 1
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_8194960
	callstd 4
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B528:: @ 816B528
	lock
	faceplayer
	checkflag FLAG_0x003
	goto_if 1, EventScript_16B54B
	loadword 0, gUnknown_81944CC
	callstd 4
	closemessage
	applymovement 5, Movement_1A75E5
	waitmovement 0
	setflag FLAG_0x002
	release
	end

EventScript_16B54B:: @ 816B54B
	loadword 0, gUnknown_8194518
	callstd 4
	closemessage
	applymovement 5, Movement_1A75E5
	waitmovement 0
	clearflag FLAG_0x003
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B563:: @ 816B563
	lock
	faceplayer
	checkflag FLAG_0x002
	goto_if 1, EventScript_16B586
	loadword 0, gUnknown_819446F
	callstd 4
	closemessage
	applymovement 6, Movement_1A75E5
	waitmovement 0
	setflag FLAG_0x003
	release
	end

EventScript_16B586:: @ 816B586
	loadword 0, gUnknown_819449C
	callstd 4
	closemessage
	applymovement 6, Movement_1A75E5
	waitmovement 0
	clearflag FLAG_0x002
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B59E:: @ 816B59E
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PIKACHU, 0
	loadword 0, gUnknown_819455A
	callstd 4
	waitmoncry
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B5B1:: @ 816B5B1
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SEEL, 0
	loadword 0, gUnknown_8194571
	callstd 4
	waitmoncry
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B5C4:: @ 816B5C4
	loadword 0, gUnknown_8194910
	callstd 3
	end

VermilionCity_PokemonFanClub_EventScript_16B5CD:: @ 816B5CD
	loadword 0, gUnknown_819493D
	callstd 3
	end

VermilionCity_House2_MapScripts:: @ 816B5D6
	.byte 0

VermilionCity_House2_EventScript_16B5D7:: @ 816B5D7
	lock
	faceplayer
	setvar VAR_0x8008, 3
	call EventScript_1A8CAD
	checkflag FLAG_0x24D
	goto_if 1, EventScript_16B649
	loadword 0, gUnknown_81949CB
	callstd 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16B631
	call EventScript_1A8CBD
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_16B631
	call EventScript_1A8CC9
	compare_var_to_var VAR_RESULT, VAR_0x8009
	goto_if 5, EventScript_16B63B
	call EventScript_1A8CD9
	loadword 0, gUnknown_8194A44
	callstd 4
	setflag FLAG_0x24D
	release
	end

EventScript_16B631:: @ 816B631
	loadword 0, gUnknown_81949FD
	callstd 4
	release
	end

EventScript_16B63B:: @ 816B63B
	getspeciesname 0, 32777
	loadword 0, gUnknown_8194A0D
	callstd 4
	release
	end

EventScript_16B649:: @ 816B649
	loadword 0, gUnknown_8194A4F
	callstd 4
	release
	end
