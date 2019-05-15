Route16_House_MapScripts:: @ 817014E
	.byte 0

Route16_House_EventScript_17014F:: @ 817014F
	lock
	faceplayer
	checkflag FLAG_0x238
	goto_if 1, EventScript_1701A5
	loadword 0, gUnknown_819F851
	callstd 4
	checkitemspace ITEM_HM02, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_17019B
	additem ITEM_HM02, 1
	loadword 0, gUnknown_819F8C0
	setorcopyvar VAR_0x8000, 340
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 257
	callstd 9 @ gStdScript_ItemMessageAndFanfare
	loadword 0, gUnknown_819F8E0
	callstd 4
	setflag FLAG_0x238
	release
	end

EventScript_17019B:: @ 817019B
	loadword 0, gUnknown_819F92D
	callstd 4
	release
	end

EventScript_1701A5:: @ 81701A5
	loadword 0, gUnknown_819F8E0
	callstd 4
	release
	end

Route16_House_EventScript_1701AF:: @ 81701AF
	lock
	faceplayer
	waitse
	playmoncry SPECIES_FEAROW, 0
	loadword 0, gUnknown_819F94F
	callstd 4
	waitmoncry
	release
	end
