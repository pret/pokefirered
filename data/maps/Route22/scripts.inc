Route22_MapScripts:: @ 816828B
	.byte 0

Route22_EventScript_16828C:: @ 816828C
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_1682BE

EventScript_168297:: @ 8168297
	end

Route22_EventScript_168298:: @ 8168298
	lockall
	setvar VAR_0x4001, 1
	setobjectxyperm 1, 25, 5
	goto EventScript_1682BE

EventScript_1682AA:: @ 81682AA
	end

Route22_EventScript_1682AB:: @ 81682AB
	lockall
	setvar VAR_0x4001, 2
	setobjectxyperm 1, 25, 5
	goto EventScript_1682BE

EventScript_1682BD:: @ 81682BD
	end

EventScript_1682BE:: @ 81682BE
	textcolor 0
	playbgm MUS_RIVAL1, 0
	addobject 1
	compare VAR_0x4001, 0
	call_if eq, EventScript_168350
	compare VAR_0x4001, 1
	call_if eq, EventScript_168350
	compare VAR_0x4001, 2
	call_if eq, EventScript_16835B
	delay 6
	msgbox gUnknown_8188890
	compare VAR_STARTER_MON, 2
	call_if eq, EventScript_16836D
	compare VAR_STARTER_MON, 1
	call_if eq, EventScript_16837C
	compare VAR_STARTER_MON, 0
	call_if eq, EventScript_16838B
	msgbox gUnknown_8188974
	closemessage
	delay 10
	playbgm MUS_RIVAL2, 0
	compare VAR_0x4001, 0
	call_if eq, EventScript_16839A
	compare VAR_0x4001, 1
	call_if eq, EventScript_16839A
	compare VAR_0x4001, 2
	call_if eq, EventScript_1683A5
	fadedefaultbgm
	removeobject 1
	setvar VAR_MAP_SCENE_ROUTE22, 2
	releaseall
	end

EventScript_168350:: @ 8168350
	applymovement 1, Movement_1683D1
	waitmovement 0
	return

EventScript_16835B:: @ 816835B
	applymovement 1, Movement_1683D9
	applymovement 255, Movement_1683E3
	waitmovement 0
	return

EventScript_16836D:: @ 816836D
	trainerbattle TRAINER_BATTLE_TUTORIAL, TRAINER_RIVAL_ROUTE22_EARLY_SQUIRTLE, 0, Text_188959, Text_18DE1A
	return

EventScript_16837C:: @ 816837C
	trainerbattle TRAINER_BATTLE_TUTORIAL, TRAINER_RIVAL_ROUTE22_EARLY_BULBASAUR, 0, Text_188959, Text_18DE1A
	return

EventScript_16838B:: @ 816838B
	trainerbattle TRAINER_BATTLE_TUTORIAL, TRAINER_RIVAL_ROUTE22_EARLY_CHARMANDER, 0, Text_188959, Text_18DE1A
	return

EventScript_16839A:: @ 816839A
	applymovement 1, Movement_1683B8
	waitmovement 0
	return

EventScript_1683A5:: @ 81683A5
	applymovement 1, Movement_1683C5
	waitmovement 0
	return

Movement_1683B0:: @ 8
	step_13
	step_13
	step_13
	step_13
	step_13
	step_13
	step_13
	step_end

Movement_1683B8:: @ 81683B8
	step_10
	step_13
	step_13
	step_13
	step_13
	step_13
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

Movement_1683C5:: @ 81683C5
	step_13
	step_13
	step_13
	step_13
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_end

Movement_1683D1:: @ 81683D1
	step_13
	step_13
	step_13
	step_13
	step_13
	step_13
	step_13
	step_end

Movement_1683D9:: @ 81683D9
	step_13
	step_13
	step_13
	step_13
	step_13
	step_13
	step_13
	step_13
	step_2d
	step_end

Movement_1683E3:: @ 81683E3
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1b
	step_2e
	step_end

Route22_EventScript_1683ED:: @ 81683ED
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_16841F

EventScript_1683F8:: @ 81683F8
	end

Route22_EventScript_1683F9:: @ 81683F9
	lockall
	setvar VAR_0x4001, 1
	setobjectxyperm 1, 25, 5
	goto EventScript_16841F

EventScript_16840B:: @ 816840B
	end

Route22_EventScript_16840C:: @ 816840C
	lockall
	setvar VAR_0x4001, 2
	setobjectxyperm 1, 25, 5
	goto EventScript_16841F

EventScript_16841E:: @ 816841E
	end

EventScript_16841F:: @ 816841F
	textcolor 0
	playbgm MUS_RIVAL1, 0
	addobject 1
	compare VAR_0x4001, 0
	call_if eq, EventScript_16849C
	compare VAR_0x4001, 1
	call_if eq, EventScript_16849C
	compare VAR_0x4001, 2
	call_if eq, EventScript_1684A7
	msgbox gUnknown_8188A3C
	setvar VAR_LAST_TALKED, 1
	compare VAR_STARTER_MON, 2
	call_if eq, EventScript_1684B9
	compare VAR_STARTER_MON, 1
	call_if eq, EventScript_1684C4
	compare VAR_STARTER_MON, 0
	call_if eq, EventScript_1684CF
	msgbox gUnknown_8188B29
	closemessage
	delay 10
	playbgm MUS_RIVAL2, 0
	applymovement 1, Movement_1684DA
	waitmovement 0
	fadedefaultbgm
	removeobject 1
	setvar VAR_MAP_SCENE_ROUTE22, 4
	releaseall
	end

EventScript_16849C:: @ 816849C
	applymovement 1, Movement_1683D1
	waitmovement 0
	return

EventScript_1684A7:: @ 81684A7
	applymovement 1, Movement_1683D9
	applymovement 255, Movement_1683E3
	waitmovement 0
	return

EventScript_1684B9:: @ 81684B9
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_RIVAL_ROUTE22_LATE_SQUIRTLE, 0, Text_188B08
	return

EventScript_1684C4:: @ 81684C4
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_RIVAL_ROUTE22_LATE_BULBASAUR, 0, Text_188B08
	return

EventScript_1684CF:: @ 81684CF
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_RIVAL_ROUTE22_LATE_CHARMANDER, 0, Text_188B08
	return

Movement_1684DA:: @ 81684DA
	step_12
	step_12
	step_12
	step_12
	step_12
	step_12
	step_12
	step_end

Route22_EventScript_1684E2:: @ 81684E2
	msgbox gUnknown_8188BFF, 3
	end
