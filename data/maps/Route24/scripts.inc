Route24_MapScripts:: @ 816861F
	.byte 0

Route24_EventScript_168620:: @ 8168620
	lock
	faceplayer
	compare VAR_MAP_SCENE_ROUTE24, 1
	goto_if_eq EventScript_168656
	msgbox gUnknown_8188C3C
	checkitemspace ITEM_NUGGET, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_16864C
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
	setvar VAR_TEMP_1, 0
	goto EventScript_168678
	end

Route24_EventScript_16866C:: @ 816866C
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_168678
	end

EventScript_168678:: @ 8168678
	textcolor 0
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_1686FD
	compare VAR_TEMP_1, 1
	call_if_eq EventScript_168708
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox gUnknown_8188C3C
	checkitemspace ITEM_NUGGET, 1
	compare VAR_RESULT, 0
	goto_if_eq EventScript_168713
	call EventScript_1686B9
	releaseall
	end

EventScript_1686B9:: @ 81686B9
	giveitem_msg gUnknown_8188C93, ITEM_NUGGET
	message Text_188CDB
	waitmessage
	playbgm MUS_ROCKET, 0
	waitbuttonpress
	setvar VAR_LAST_TALKED, 1
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_GRUNT_6, Text_188DDC
	msgbox gUnknown_8188DF1
	setvar VAR_MAP_SCENE_ROUTE24, 1
	return

EventScript_1686FD:: @ 81686FD
	applymovement 1, Movement_16873E
	waitmovement 0
	return

EventScript_168708:: @ 8168708
	applymovement 1, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

EventScript_168713:: @ 8168713
	msgbox gUnknown_8188CC2
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_168743
	waitmovement 0
	compare VAR_TEMP_1, 0
	call_if_eq EventScript_168733
	release
	end

EventScript_168733:: @ 8168733
	applymovement 1, Movement_168740
	waitmovement 0
	return

Movement_16873E:: @ 816873E
	walk_left
	step_end

Movement_168740:: @ 8168740
	walk_right
	walk_in_place_fastest_left
	step_end

Movement_168743:: @ 8168743
	walk_down
	step_end
