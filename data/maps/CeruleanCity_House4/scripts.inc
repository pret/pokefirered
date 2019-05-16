CeruleanCity_House4_MapScripts:: @ 816ACEE
	.byte 0

CeruleanCity_House4_EventScript_16ACEF:: @ 816ACEF
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_8112364
	lock
	specialvar VAR_0x8004, sub_8146CE8
	copyvar VAR_0x8008, VAR_RESULT
	compare_var_to_value VAR_0x8004, 0
	goto_if 1, EventScript_16AD59
	compare_var_to_value VAR_0x8004, 1
	goto_if 1, EventScript_16AD63
	compare_var_to_value VAR_0x8004, 2
	goto_if 1, EventScript_16AD89
	compare_var_to_value VAR_0x8004, 3
	goto_if 1, EventScript_16ADAF
	compare_var_to_value VAR_0x8004, 4
	goto_if 1, EventScript_16ADC3
	compare_var_to_value VAR_0x8004, 5
	goto_if 1, EventScript_16ADE9
	compare_var_to_value VAR_0x8004, 6
	goto_if 1, EventScript_16AE0F
	end

EventScript_16AD59:: @ 816AD59
	msgbox gUnknown_8192AF0
	release
	end

EventScript_16AD63:: @ 816AD63
	call EventScript_16AE23
	msgbox gUnknown_8192B43
	setorcopyvar VAR_0x8000, VAR_0x8008
	setorcopyvar VAR_0x8001, 1
	callstd 0
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16AE45
	release
	end

EventScript_16AD89:: @ 816AD89
	call EventScript_16AE23
	msgbox gUnknown_8192C07
	setorcopyvar VAR_0x8000, VAR_0x8008
	setorcopyvar VAR_0x8001, 4
	callstd 0
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16AE45
	release
	end

EventScript_16ADAF:: @ 816ADAF
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_8192CD5
	release
	end

EventScript_16ADC3:: @ 816ADC3
	call EventScript_16AE23
	msgbox gUnknown_8192D4B
	setorcopyvar VAR_0x8000, VAR_0x8008
	setorcopyvar VAR_0x8001, 1
	callstd 0
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16AE45
	release
	end

EventScript_16ADE9:: @ 816ADE9
	call EventScript_16AE23
	msgbox gUnknown_8192DE3
	setorcopyvar VAR_0x8000, VAR_0x8008
	setorcopyvar VAR_0x8001, 4
	callstd 0
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16AE45
	release
	end

EventScript_16AE0F:: @ 816AE0F
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_8192EC5
	release
	end

EventScript_16AE23:: @ 816AE23
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
