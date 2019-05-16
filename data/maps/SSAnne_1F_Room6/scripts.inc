SSAnne_1F_Room6_MapScripts:: @ 8160DF2
	.byte 0

SSAnne_1F_Room6_EventScript_160DF3:: @ 8160DF3
	lock
	faceplayer
	msgbox gUnknown_817445B, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_160E18
	closemessage
	call EventScript_1A6C26
	msgbox gUnknown_8174490
	release
	end

EventScript_160E18:: @ 8160E18
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_160E2E
	msgbox gUnknown_8174515
	release
	end

EventScript_160E2E:: @ 8160E2E
	msgbox gUnknown_81744D0
	release
	end
