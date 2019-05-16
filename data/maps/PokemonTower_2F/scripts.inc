PokemonTower_2F_MapScripts:: @ 8163285
	.byte 0

PokemonTower_2F_EventScript_163286:: @ 8163286
	msgbox gUnknown_8179EAE, 2
	end

PokemonTower_2F_EventScript_16328F:: @ 816328F
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_1632A7
	end

PokemonTower_2F_EventScript_16329B:: @ 816329B
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_1632A7
	end

EventScript_1632A7:: @ 81632A7
	textcolor 0
	playbgm BGM_FRLG_RIVAL, 0
	compare_var_to_value VAR_0x4001, 0
	call_if 1, EventScript_163339
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_16334B
	applymovement 1, Movement_1A75DB
	waitmovement 0
	applymovement 1, Movement_1A75DD
	waitmovement 0
	msgbox gUnknown_8179CFF
	setvar VAR_LAST_TALKED, 1
	compare_var_to_value VAR_STARTER_MON, 2
	call_if 1, EventScript_16335D
	compare_var_to_value VAR_STARTER_MON, 1
	call_if 1, EventScript_163368
	compare_var_to_value VAR_STARTER_MON, 0
	call_if 1, EventScript_163373
	msgbox gUnknown_8179DD4
	closemessage
	playbgm BGM_FRLG_RIVAL_POSTBATTLE, 0
	compare_var_to_value VAR_0x4001, 0
	call_if 1, EventScript_16337E
	compare_var_to_value VAR_0x4001, 1
	call_if 1, EventScript_163389
	playse SE_KAIDAN
	delay 25
	fadedefaultbgm
	removeobject 1
	setvar VAR_0x405D, 1
	releaseall
	end

EventScript_163339:: @ 8163339
	applymovement 1, Movement_1A75EB
	applymovement 255, Movement_1A75E7
	waitmovement 0
	return

EventScript_16334B:: @ 816334B
	applymovement 1, Movement_1A75ED
	applymovement 255, Movement_1A75E9
	waitmovement 0
	return

EventScript_16335D:: @ 816335D
	trainerbattle 3, 429, 0, Text_179D73
	return

EventScript_163368:: @ 8163368
	trainerbattle 3, 430, 0, Text_179D73
	return

EventScript_163373:: @ 8163373
	trainerbattle 3, 431, 0, Text_179D73
	return

EventScript_16337E:: @ 816337E
	applymovement 1, Movement_163394
	waitmovement 0
	return

EventScript_163389:: @ 8163389
	applymovement 1, Movement_16339D
	waitmovement 0
	return

Movement_163394:: @ 8163394
	step_10
	step_13
	step_13
	step_10
	step_10
	step_10
	step_10
	step_30
	step_end

Movement_16339D:: @ 816339D
	step_13
	step_13
	step_10
	step_10
	step_10
	step_10
	step_10
	step_30
	step_end
