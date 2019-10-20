LavenderTown_VolunteerPokemonHouse_MapScripts:: @ 816B149
	.byte 0

LavenderTown_VolunteerPokemonHouse_EventScript_16B14A:: @ 816B14A
	lock
	faceplayer
	checkflag FLAG_0x23D
	goto_if_eq EventScript_16B196
	msgbox gUnknown_81936FF
	checkitemspace ITEM_POKE_FLUTE, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_16B1A0
	setflag FLAG_0x23D
	additem ITEM_POKE_FLUTE, 1
	giveitemfanfaremsg gUnknown_81937BD, ITEM_POKE_FLUTE, 1, MUS_FAN5
	msgbox gUnknown_81937E5
	release
	end

EventScript_16B196:: @ 816B196
	msgbox gUnknown_8193878
	release
	end

EventScript_16B1A0:: @ 816B1A0
	msgbox gUnknown_819385B
	release
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B1AA:: @ 816B1AA
	lock
	faceplayer
	famechecker FAMECHECKER_MRFUJI, 0
	msgbox gUnknown_8193652
	release
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B1C3:: @ 816B1C3
	msgbox gUnknown_81936B4, 2
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B1CC:: @ 816B1CC
	lock
	faceplayer
	checkflag FLAG_0x23C
	goto_if_eq EventScript_16B1E1
	msgbox gUnknown_81935ED
	release
	end

EventScript_16B1E1:: @ 816B1E1
	msgbox gUnknown_819361D
	release
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B1EB:: @ 816B1EB
	lock
	faceplayer
	waitse
	playmoncry SPECIES_NIDORINO, 0
	msgbox gUnknown_81936DE
	waitmoncry
	release
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B1FE:: @ 816B1FE
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PSYDUCK, 0
	msgbox gUnknown_81936EE
	waitmoncry
	release
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B211:: @ 816B211
	lockall
	famechecker FAMECHECKER_MRFUJI, 2
	msgbox gUnknown_81938A0
	releaseall
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B229:: @ 816B229
	msgbox gUnknown_819392B, 3
	end
