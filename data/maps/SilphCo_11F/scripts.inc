SilphCo_11F_MapScripts:: @ 8161DEE
	map_script MAP_SCRIPT_ON_LOAD, SilphCo_11F_OnLoad
	.byte 0

SilphCo_11F_OnLoad:: @ 8161DF4
	checkflag FLAG_SILPH_11F_DOOR
	call_if FALSE, EventScript_Close11FDoor
	end

SilphCo_11F_EventScript_161DFE:: @ 8161DFE
	lock
	faceplayer
	checkflag FLAG_GOT_MASTER_BALL_FROM_SILPH
	goto_if TRUE, EventScript_161E75
	checkplayergender
	compare VAR_RESULT, 0
	call_if eq, EventScript_161E59
	compare VAR_RESULT, 1
	call_if eq, EventScript_161E62
	checkitemspace ITEM_MASTER_BALL, 1
	compare VAR_RESULT, 0
	goto_if eq, EventScript_161E6B
	additem ITEM_MASTER_BALL, 1
	giveitemfanfaremsg gUnknown_8176FBD, ITEM_MASTER_BALL, 1, MUS_FAN5
	msgbox gUnknown_8176FEB
	setflag FLAG_GOT_MASTER_BALL_FROM_SILPH
	release
	end

EventScript_161E59:: @ 8161E59
	msgbox gUnknown_8176E12
	return

EventScript_161E62:: @ 8161E62
	msgbox gUnknown_8176EE7
	return

EventScript_161E6B:: @ 8161E6B
	msgbox gUnknown_817708E
	release
	end

EventScript_161E75:: @ 8161E75
	msgbox gUnknown_8176FEB
	release
	end

SilphCo_11F_EventScript_161E7F:: @ 8161E7F
	msgbox gUnknown_81770A9, 2
	end

SilphCo_11F_EventScript_161E88:: @ 8161E88
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_161EA0

EventScript_161E93:: @ 8161E93
	end

SilphCo_11F_EventScript_161E94:: @ 8161E94
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_161EA0

EventScript_161E9F:: @ 8161E9F
	end

EventScript_161EA0:: @ 8161EA0
	textcolor 0
	applymovement 3, Movement_1A75ED
	waitmovement 0
	delay 25
	msgbox gUnknown_8177108
	closemessage
	compare VAR_0x4001, 0
	call_if eq, EventScript_161F00
	compare VAR_0x4001, 1
	call_if eq, EventScript_161F12
	setvar VAR_LAST_TALKED, 3
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_BOSS_GIOVANNI_2, 0, Text_1771AB
	msgbox gUnknown_81771C2
	closemessage
	fadescreen 1
	removeobject 3
	removeobject 4
	removeobject 6
	fadescreen 0
	setvar VAR_MAP_SCENE_SILPH_CO_11F, 1
	setflag FLAG_HIDE_SAFFRON_ROCKETS
	clearflag FLAG_HIDE_SAFFRON_CIVILIANS
	releaseall
	end

EventScript_161F00:: @ 8161F00
	applymovement 3, Movement_161F1D
	applymovement 255, Movement_161F27
	waitmovement 0
	return

EventScript_161F12:: @ 8161F12
	applymovement 3, Movement_161F23
	waitmovement 0
	return

Movement_161F1D:: @ 8161F1D
	step_10
	step_10
	step_10
	step_10
	step_2f
	step_end

Movement_161F23:: @ 8161F23
	step_10
	step_10
	step_10
	step_end

Movement_161F27:: @ 8161F27
	step_1c
	step_1c
	step_1c
	step_1b
	step_1a
	step_30
	step_end

EventScript_161F2E:: @ 8161F2E
	msgbox gUnknown_817732B, 3
	end

SilphCo_11F_EventScript_161F37:: @ 8161F37
	msgbox gUnknown_817734A, 3
	end

SilphCo_11F_EventScript_161F40:: @ 8161F40
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TEAM_ROCKET_GRUNT_40, 0, Text_1772B8, Text_1772E7
	msgbox gUnknown_81772F9, 6
	end

SilphCo_11F_EventScript_161F57:: @ 8161F57
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TEAM_ROCKET_GRUNT_41, 0, Text_17726A, Text_17728C
	msgbox gUnknown_817729B, 6
	end
