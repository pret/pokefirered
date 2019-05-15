SafariZone_SecretHouse_MapScripts:: @ 8162452
	.byte 0

SafariZone_SecretHouse_EventScript_162453:: @ 8162453
	lock
	faceplayer
	checkflag FLAG_0x239
	goto_if 1, EventScript_1624A9
	loadword 0, gUnknown_8177DC1
	callstd 4
	checkitemspace ITEM_HM03, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16249F
	additem ITEM_HM03, 1
	loadword 0, gUnknown_8177E92
	setorcopyvar VAR_0x8000, 341
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 257
	callstd 9 @ gStdScript_ItemMessageAndFanfare
	loadword 0, gUnknown_8177EB7
	callstd 4
	setflag FLAG_0x239
	release
	end

EventScript_16249F:: @ 816249F
	loadword 0, gUnknown_8177F72
	callstd 4
	release
	end

EventScript_1624A9:: @ 81624A9
	loadword 0, gUnknown_8177EB7
	callstd 4
	release
	end
