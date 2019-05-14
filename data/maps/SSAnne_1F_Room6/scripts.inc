SSAnne_1F_Room6_MapScripts:: @ 8160DF2
	.byte 0

SSAnne_1F_Room6_EventScript_160DF3:: @ 8160DF3
	lock
	faceplayer
	loadword 0, gUnknown_817445B
	callstd 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_160E18
	closemessage
	call EventScript_1A6C26
	loadword 0, gUnknown_8174490
	callstd 4
	release
	end

EventScript_160E18:: @ 8160E18
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_160E2E
	loadword 0, gUnknown_8174515
	callstd 4
	release
	end

EventScript_160E2E:: @ 8160E2E
	loadword 0, gUnknown_81744D0
	callstd 4
	release
	end
