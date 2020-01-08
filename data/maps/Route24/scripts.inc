Route24_MapScripts:: @ 816861F
	.byte 0

Route24_EventScript_168620:: @ 8168620
	lock
	faceplayer
	compare VAR_MAP_SCENE_ROUTE24, 1
	goto_if eq, EventScript_168656
	msgbox gUnknown_8188C3C
	checkitemspace ITEM_NUGGET, 1
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16864C
	call EventScript_1686B9
	release
	end

EventScript_16864C:: @ 816864C
	msgbox gUnknown_8188CC2
	release
	end

EventScript_168656:: @ 8168656
	msgbox gUnknown_8188DF1
	release
	end

Route24_EventScript_168660:: @ 8168660
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_168678
	end

Route24_EventScript_16866C:: @ 816866C
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_168678
	end

EventScript_168678:: @ 8168678
	textcolor 0
	compare VAR_0x4001, 0
	call_if eq, EventScript_1686FD
	compare VAR_0x4001, 1
	call_if eq, EventScript_168708
	applymovement 255, Movement_1A75EB
	waitmovement 0
	msgbox gUnknown_8188C3C
	checkitemspace ITEM_NUGGET, 1
	compare VAR_RESULT, 0
	goto_if eq, EventScript_168713
	call EventScript_1686B9
	releaseall
	end

EventScript_1686B9:: @ 81686B9
	additem ITEM_NUGGET, 1
	giveitemfanfaremsg gUnknown_8188C93, ITEM_NUGGET
	message Text_188CDB
	waitmessage
	playbgm MUS_ROCKET, 0
	waitbuttonpress
	setvar VAR_LAST_TALKED, 1
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_TEAM_ROCKET_GRUNT_6, 0, Text_188DDC
	msgbox gUnknown_8188DF1
	setvar VAR_MAP_SCENE_ROUTE24, 1
	return

EventScript_1686FD:: @ 81686FD
	applymovement 1, Movement_16873E
	waitmovement 0
	return

EventScript_168708:: @ 8168708
	applymovement 1, Movement_1A75E7
	waitmovement 0
	return

EventScript_168713:: @ 8168713
	msgbox gUnknown_8188CC2
	closemessage
	applymovement 255, Movement_168743
	waitmovement 0
	compare VAR_0x4001, 0
	call_if eq, EventScript_168733
	release
	end

EventScript_168733:: @ 8168733
	applymovement 1, Movement_168740
	waitmovement 0
	return

Movement_16873E:: @ 816873E
	step_12
	step_end

Movement_168740:: @ 8168740
	step_13
	step_2f
	step_end

Movement_168743:: @ 8168743
	step_10
	step_end
