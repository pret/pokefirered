FuchsiaCity_MapScripts:: @ 8166D75
	map_script 3, FuchsiaCity_MapScript1_166D7B
	.byte 0

FuchsiaCity_MapScript1_166D7B:: @ 8166D7B
	setworldmapflag FLAG_WORLD_MAP_FUCHSIA_CITY
	checkflag FLAG_0x272
	call_if 1, EventScript_166D91
	checkflag FLAG_0x272
	call_if 0, EventScript_166D97
	end

EventScript_166D91:: @ 8166D91
	setvar VAR_0x4010, 118
	return

EventScript_166D97:: @ 8166D97
	setvar VAR_0x4010, 147
	return

FuchsiaCity_EventScript_166D9D:: @ 8166D9D
	loadword 0, gUnknown_818056E
	callstd 2
	end

FuchsiaCity_EventScript_166DA6:: @ 8166DA6
	loadword 0, gUnknown_81805C6
	callstd 2
	end

FuchsiaCity_EventScript_166DAF:: @ 8166DAF
	loadword 0, gUnknown_818062C
	callstd 2
	end

FuchsiaCity_EventScript_166DB8:: @ 8166DB8
	loadword 0, gUnknown_818065A
	callstd 2
	end

FuchsiaCity_EventScript_166DC1:: @ 8166DC1
	lock
	faceplayer
	setvar VAR_0x8004, 6
	setvar VAR_0x8005, 3
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_8180ABD
	callstd 4
	release
	end

FuchsiaCity_EventScript_166DDA:: @ 8166DDA
	loadword 0, gUnknown_81806AB
	callstd 3
	end

FuchsiaCity_EventScript_166DE3:: @ 8166DE3
	loadword 0, gUnknown_81806D3
	callstd 3
	end

FuchsiaCity_EventScript_166DEC:: @ 8166DEC
	loadword 0, gUnknown_81806F0
	callstd 3
	end

FuchsiaCity_EventScript_166DF5:: @ 8166DF5
	loadword 0, gUnknown_818070D
	callstd 3
	end

EventScript_166DFE:: @ 8166DFE
	loadword 0, gUnknown_8180727
	callstd 3
	end

FuchsiaCity_EventScript_166E07:: @ 8166E07
	lockall
	setvar VAR_0x8004, 6
	setvar VAR_0x8005, 0
	special SetFlavorTextFlagFromSpecialVars
	loadword 0, gUnknown_8180768
	callstd 4
	releaseall
	end

FuchsiaCity_EventScript_166E1F:: @ 8166E1F
	lockall
	setvar VAR_0x8004, 113
	special sub_80CBDCC
	drawmonpic SPECIES_CHANSEY, 10, 3
	loadword 0, gUnknown_81807A9
	callstd 4
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_166E38:: @ 8166E38
	lockall
	setvar VAR_0x8004, 100
	special sub_80CBDCC
	drawmonpic SPECIES_VOLTORB, 10, 3
	loadword 0, gUnknown_81807D9
	callstd 4
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_166E51:: @ 8166E51
	lockall
	setvar VAR_0x8004, 115
	special sub_80CBDCC
	drawmonpic SPECIES_KANGASKHAN, 10, 3
	loadword 0, gUnknown_8180806
	callstd 4
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_166E6A:: @ 8166E6A
	lockall
	setvar VAR_0x8004, 79
	special sub_80CBDCC
	drawmonpic SPECIES_SLOWPOKE, 10, 3
	loadword 0, gUnknown_8180859
	callstd 4
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_166E83:: @ 8166E83
	lockall
	setvar VAR_0x8004, 131
	special sub_80CBDCC
	drawmonpic SPECIES_LAPRAS, 10, 3
	loadword 0, gUnknown_8180887
	callstd 4
	erasemonpic
	releaseall
	end

FuchsiaCity_EventScript_166E9C:: @ 8166E9C
	lockall
	checkflag FLAG_0x272
	goto_if 1, EventScript_166EBE
	setvar VAR_0x8004, 140
	special sub_80CBDCC
	drawmonpic SPECIES_KABUTO, 10, 3
	loadword 0, gUnknown_81808FA
	callstd 4
	erasemonpic
	releaseall
	end

EventScript_166EBE:: @ 8166EBE
	setvar VAR_0x8004, 138
	special sub_80CBDCC
	drawmonpic SPECIES_OMANYTE, 10, 3
	loadword 0, gUnknown_81808AE
	callstd 4
	erasemonpic
	releaseall
	end
