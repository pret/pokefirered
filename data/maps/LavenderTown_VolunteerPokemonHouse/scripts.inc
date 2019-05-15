LavenderTown_VolunteerPokemonHouse_MapScripts:: @ 816B149
	.byte 0

LavenderTown_VolunteerPokemonHouse_EventScript_16B14A:: @ 816B14A
	lock
	faceplayer
	checkflag FLAG_0x23D
	goto_if 1, EventScript_16B196
	loadword 0, gUnknown_81936FF
	callstd 4
	checkitemspace ITEM_POKE_FLUTE, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16B1A0
	setflag FLAG_0x23D
	additem ITEM_POKE_FLUTE, 1
	loadword 0, gUnknown_81937BD
	setorcopyvar VAR_0x8000, 350
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 318
	callstd 9 @ gStdScript_ItemMessageAndFanfare
	loadword 0, gUnknown_81937E5
	callstd 4
	release
	end

EventScript_16B196:: @ 816B196
	loadword 0, gUnknown_8193878
	callstd 4
	release
	end

EventScript_16B1A0:: @ 816B1A0
	loadword 0, gUnknown_819385B
	callstd 4
	release
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B1AA:: @ 816B1AA
	lock
	faceplayer
	setvar VAR_0x8004, 14
	setvar VAR_0x8005, 0
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_8193652
	callstd 4
	release
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B1C3:: @ 816B1C3
	loadword 0, gUnknown_81936B4
	callstd 2
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B1CC:: @ 816B1CC
	lock
	faceplayer
	checkflag FLAG_0x23C
	goto_if 1, EventScript_16B1E1
	loadword 0, gUnknown_81935ED
	callstd 4
	release
	end

EventScript_16B1E1:: @ 816B1E1
	loadword 0, gUnknown_819361D
	callstd 4
	release
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B1EB:: @ 816B1EB
	lock
	faceplayer
	waitse
	playmoncry SPECIES_NIDORINO, 0
	loadword 0, gUnknown_81936DE
	callstd 4
	waitmoncry
	release
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B1FE:: @ 816B1FE
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PSYDUCK, 0
	loadword 0, gUnknown_81936EE
	callstd 4
	waitmoncry
	release
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B211:: @ 816B211
	lockall
	setvar VAR_0x8004, 14
	setvar VAR_0x8005, 2
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_81938A0
	callstd 4
	releaseall
	end

LavenderTown_VolunteerPokemonHouse_EventScript_16B229:: @ 816B229
	loadword 0, gUnknown_819392B
	callstd 3
	end
