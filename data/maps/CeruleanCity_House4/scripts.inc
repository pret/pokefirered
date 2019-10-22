CeruleanCity_House4_MapScripts:: @ 816ACEE
	.byte 0

CeruleanCity_House4_EventScript_16ACEF:: @ 816ACEF
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	lock
	specialvar VAR_0x8004, Special_GetMENewsJisanItemAndState
	copyvar VAR_0x8008, VAR_RESULT
	compare_var_to_value VAR_0x8004, 0
	goto_if eq, EventScript_CeruleanCity_House4_NoNews
	compare_var_to_value VAR_0x8004, 1
	goto_if eq, EventScript_CeruleanCity_House4_News1
	compare_var_to_value VAR_0x8004, 2
	goto_if eq, EventScript_CeruleanCity_House4_News2
	compare_var_to_value VAR_0x8004, 3
	goto_if eq, EventScript_CeruleanCity_House4_NewsNotSpread
	compare_var_to_value VAR_0x8004, 4
	goto_if eq, EventScript_CeruleanCity_House4_NewsSpread1
	compare_var_to_value VAR_0x8004, 5
	goto_if eq, EventScript_CeruleanCity_House4_NewsSpread2
	compare_var_to_value VAR_0x8004, 6
	goto_if eq, EventScript_CeruleanCity_House4_NewsDone
	end

EventScript_CeruleanCity_House4_NoNews:: @ 816AD59
	msgbox gUnknown_8192AF0
	release
	end

EventScript_CeruleanCity_House4_News1:: @ 816AD63
	call EventScript_CeruleanCity_House4_MovementReactionToNews
	msgbox gUnknown_8192B43
	giveitem VAR_0x8008
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16AE45
	release
	end

EventScript_CeruleanCity_House4_News2:: @ 816AD89
	call EventScript_CeruleanCity_House4_MovementReactionToNews
	msgbox gUnknown_8192C07
	giveitem VAR_0x8008, 4
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16AE45
	release
	end

EventScript_CeruleanCity_House4_NewsNotSpread:: @ 816ADAF
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_8192CD5
	release
	end

EventScript_CeruleanCity_House4_NewsSpread1:: @ 816ADC3
	call EventScript_CeruleanCity_House4_MovementReactionToNews
	msgbox gUnknown_8192D4B
	giveitem VAR_0x8008
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16AE45
	release
	end

EventScript_CeruleanCity_House4_NewsSpread2:: @ 816ADE9
	call EventScript_CeruleanCity_House4_MovementReactionToNews
	msgbox gUnknown_8192DE3
	giveitem VAR_0x8008, 4
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_16AE45
	release
	end

EventScript_CeruleanCity_House4_NewsDone:: @ 816AE0F
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_8192EC5
	release
	end

EventScript_CeruleanCity_House4_MovementReactionToNews:: @ 816AE23
	playse SE_PIN
	applymovement 1, Movement_1A75DB
	waitmovement 0
	applymovement 1, Movement_1A75E1
	waitmovement 0
	applymovement 1, Movement_1A75DD
	waitmovement 0
	return

EventScript_16AE45:: @ 816AE45
	msgbox gUnknown_8192F2A
	release
	end
