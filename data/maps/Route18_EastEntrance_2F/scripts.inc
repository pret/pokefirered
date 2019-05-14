Route18_EastEntrance_2F_MapScripts:: @ 817046B
	.byte 0

Route18_EastEntrance_2F_EventScript_17046C:: @ 817046C
	loadword 0, gUnknown_819FD6B
	callstd 3
	end

Route18_EastEntrance_2F_EventScript_170475:: @ 8170475
	loadword 0, gUnknown_819FDB3
	callstd 3
	end

Route18_EastEntrance_2F_EventScript_17047E:: @ 817047E
	lock
	faceplayer
	setvar VAR_0x8008, 5
	call EventScript_1A8CAD
	checkflag FLAG_0x257
	goto_if 1, EventScript_1704F0
	loadword 0, gUnknown_81A597B
	callstd 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1704D8
	call EventScript_1A8CBD
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_1704D8
	call EventScript_1A8CC9
	compare_var_to_var VAR_RESULT, VAR_0x8009
	goto_if 5, EventScript_1704E2
	call EventScript_1A8CD9
	loadword 0, gUnknown_81A59DA
	callstd 4
	setflag FLAG_0x257
	release
	end

EventScript_1704D8:: @ 81704D8
	loadword 0, gUnknown_81A59B6
	callstd 4
	release
	end

EventScript_1704E2:: @ 81704E2
	getspeciesname 0, 32777
	loadword 0, gUnknown_81A59C6
	callstd 4
	release
	end

EventScript_1704F0:: @ 81704F0
	loadword 0, gUnknown_81A59E7
	callstd 4
	release
	end
