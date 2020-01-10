VermilionCity_PokemonFanClub_MapScripts:: @ 816B47E
	.byte 0

VermilionCity_PokemonFanClub_EventScript_16B47F:: @ 816B47F
	lock
	faceplayer
	goto_if_set FLAG_GOT_BIKE_VOUCHER, EventScript_16B4A7
	msgbox gUnknown_819457E, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16B4B1
	msgbox gUnknown_8194860
	release
	end

EventScript_16B4A7:: @ 816B4A7
	msgbox gUnknown_819488E
	release
	end

EventScript_16B4B1:: @ 816B4B1
	msgbox gUnknown_8194628
	checkitemspace ITEM_BIKE_VOUCHER, 1
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16B4F2
	setflag FLAG_GOT_BIKE_VOUCHER
	giveitem_msg gUnknown_819474E, ITEM_BIKE_VOUCHER, 1, MUS_FAN5
	msgbox gUnknown_819477C
	release
	end

EventScript_16B4F2:: @ 816B4F2
	msgbox gUnknown_81948D2
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B4FC:: @ 816B4FC
	lock
	faceplayer
	goto_if_set FLAG_SYS_GAME_CLEAR, EventScript_16B511
	msgbox gUnknown_81948E6
	release
	end

EventScript_16B511:: @ 816B511
	famechecker FAMECHECKER_DAISY, 1
	msgbox gUnknown_8194960
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B528:: @ 816B528
	lock
	faceplayer
	goto_if_set FLAG_TEMP_3, EventScript_16B54B
	msgbox gUnknown_81944CC
	closemessage
	applymovement 5, Movement_FaceOriginalDirection
	waitmovement 0
	setflag FLAG_TEMP_2
	release
	end

EventScript_16B54B:: @ 816B54B
	msgbox gUnknown_8194518
	closemessage
	applymovement 5, Movement_FaceOriginalDirection
	waitmovement 0
	clearflag FLAG_TEMP_3
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B563:: @ 816B563
	lock
	faceplayer
	goto_if_set FLAG_TEMP_2, EventScript_16B586
	msgbox gUnknown_819446F
	closemessage
	applymovement 6, Movement_FaceOriginalDirection
	waitmovement 0
	setflag FLAG_TEMP_3
	release
	end

EventScript_16B586:: @ 816B586
	msgbox gUnknown_819449C
	closemessage
	applymovement 6, Movement_FaceOriginalDirection
	waitmovement 0
	clearflag FLAG_TEMP_2
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B59E:: @ 816B59E
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PIKACHU, 0
	msgbox gUnknown_819455A
	waitmoncry
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B5B1:: @ 816B5B1
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SEEL, 0
	msgbox gUnknown_8194571
	waitmoncry
	release
	end

VermilionCity_PokemonFanClub_EventScript_16B5C4:: @ 816B5C4
	msgbox gUnknown_8194910, 3
	end

VermilionCity_PokemonFanClub_EventScript_16B5CD:: @ 816B5CD
	msgbox gUnknown_819493D, 3
	end
