Route12_FishingHouse_MapScripts:: @ 816FF0B
	.byte 0

Route12_FishingHouse_EventScript_16FF0C:: @ 816FF0C
	lock
	faceplayer
	checkflag FLAG_0x255
	goto_if 1, EventScript_16FF7F
	loadword 0, gUnknown_819EFE0
	callstd 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16FF34
	loadword 0, gUnknown_819F1FA
	callstd 4
	release
	end

EventScript_16FF34:: @ 816FF34
	checkitemspace ITEM_SUPER_ROD, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16FF75
	additem ITEM_SUPER_ROD, 1
	loadword 0, gUnknown_819F05B
	callstd 4
	loadword 0, gUnknown_819F0B2
	setorcopyvar VAR_0x8000, 264
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 257
	callstd 9 @ gStdScript_ItemMessageAndFanfare
	setflag FLAG_0x255
	loadword 0, gUnknown_819F0EB
	callstd 4
	release
	end

EventScript_16FF75:: @ 816FF75
	loadword 0, gUnknown_819F494
	callstd 4
	release
	end

EventScript_16FF7F:: @ 816FF7F
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_8112364
	setvar VAR_0x8004, 129
	specialvar VAR_RESULT, sub_80CC48C
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16FFF5
	special sub_80A096C
	loadword 0, gUnknown_819F2DB
	callstd 4
	special sub_80BF8FC
	waitstate
	copyvar VAR_RESULT, VAR_0x8004
	compare_var_to_value VAR_RESULT, 6
	goto_if 4, EventScript_16FFFF
	special sub_80A0984
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_170001
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_17000B
	compare_var_to_value VAR_RESULT, 3
	goto_if 1, EventScript_170031
	compare_var_to_value VAR_RESULT, 4
	goto_if 1, EventScript_17001E
	release
	end

EventScript_16FFF5:: @ 816FFF5
	loadword 0, gUnknown_819F217
	callstd 4
	release
	end

EventScript_16FFFF:: @ 816FFFF
	release
	end

EventScript_170001:: @ 8170001
	loadword 0, gUnknown_819F468
	callstd 4
	release
	end

EventScript_17000B:: @ 817000B
	checkflag FLAG_0x29C
	goto_if 0, EventScript_170031
	loadword 0, gUnknown_819F40A
	callstd 4
	release
	end

EventScript_17001E:: @ 817001E
	checkflag FLAG_0x29C
	goto_if 0, EventScript_170031
	loadword 0, gUnknown_819F3CB
	callstd 4
	release
	end

EventScript_170031:: @ 8170031
	setflag FLAG_0x29C
	loadword 0, gUnknown_819F31B
	callstd 4
	setorcopyvar VAR_0x8000, 6
	setorcopyvar VAR_0x8001, 1
	callstd 0
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_17005D
	loadword 0, gUnknown_819F395
	callstd 4
	release
	end

EventScript_17005D:: @ 817005D
	loadword 0, gUnknown_819F494
	callstd 4
	release
	end

Route12_FishingHouse_EventScript_170067:: @ 8170067
	lockall
	checkflag FLAG_0x29C
	goto_if 1, EventScript_17007B
	loadword 0, gUnknown_819F50C
	callstd 4
	releaseall
	end

EventScript_17007B:: @ 817007B
	special sub_80A096C
	loadword 0, gUnknown_819F4CF
	callstd 4
	releaseall
	end
