SixIsland_DottedHole_SapphireRoom_MapScripts:: @ 81641B4
	.byte 0

SixIsland_DottedHole_SapphireRoom_EventScript_1641B5:: @ 81641B5
	lock
	faceplayer
	textcolor 3
	playfanfare MUS_FAN5
	message Text_17BD82
	waitmessage
	waitfanfare
	closemessage
	setobjectxyperm 2, 5, 0
	addobject 2
	playse SE_RU_HYUU
	applymovement 2, Movement_16440F
	waitmovement 0
	playse SE_W070
	compare VAR_FACING, 2
	call_if eq, EventScript_16430F
	compare VAR_FACING, 1
	call_if eq, EventScript_16430F
	compare VAR_FACING, 4
	call_if eq, EventScript_16431A
	compare VAR_FACING, 3
	call_if eq, EventScript_16431A
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 0
	setvar VAR_0x8006, 12
	setvar VAR_0x8007, 3
	special Special_ShakeScreen
	delay 60
	compare VAR_FACING, 2
	call_if eq, EventScript_164325
	compare VAR_FACING, 1
	call_if eq, EventScript_164330
	compare VAR_FACING, 4
	call_if eq, EventScript_16433B
	compare VAR_FACING, 3
	call_if eq, EventScript_164346
	textcolor 0
	msgbox gUnknown_817BD97
	closemessage
	compare VAR_FACING, 2
	call_if eq, EventScript_164351
	compare VAR_FACING, 1
	call_if eq, EventScript_164366
	compare VAR_FACING, 4
	call_if eq, EventScript_16437B
	compare VAR_FACING, 3
	call_if eq, EventScript_164390
	removeobject 1
	compare VAR_FACING, 2
	call_if eq, EventScript_1642F9
	compare VAR_FACING, 1
	call_if eq, EventScript_1642F9
	compare VAR_FACING, 4
	call_if eq, EventScript_164304
	compare VAR_FACING, 3
	call_if eq, EventScript_164304
	msgbox gUnknown_817BDD4
	closemessage
	compare VAR_FACING, 2
	call_if eq, EventScript_1643A5
	compare VAR_FACING, 1
	call_if eq, EventScript_1643B7
	compare VAR_FACING, 4
	call_if eq, EventScript_1643C9
	compare VAR_FACING, 3
	call_if eq, EventScript_1643DB
	playse SE_KAIDAN
	delay 35
	removeobject 2
	setflag FLAG_LEARNED_YES_NAH_CHANSEY
	release
	end

EventScript_1642F9:: @ 81642F9
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75E7
	waitmovement 0
	return

EventScript_164304:: @ 8164304
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75ED
	waitmovement 0
	return

EventScript_16430F:: @ 816430F
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75E7
	waitmovement 0
	return

EventScript_16431A:: @ 816431A
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75ED
	waitmovement 0
	return

EventScript_164325:: @ 8164325
	applymovement 2, Movement_1643ED
	waitmovement 0
	return

EventScript_164330:: @ 8164330
	applymovement 2, Movement_1643ED
	waitmovement 0
	return

EventScript_16433B:: @ 816433B
	applymovement 2, Movement_1643F1
	waitmovement 0
	return

EventScript_164346:: @ 8164346
	applymovement 2, Movement_1643F1
	waitmovement 0
	return

EventScript_164351:: @ 8164351
	applymovement 2, Movement_1643F5
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75E9
	waitmovement 0
	return

EventScript_164366:: @ 8164366
	applymovement 2, Movement_1643F5
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75ED
	waitmovement 0
	return

EventScript_16437B:: @ 816437B
	applymovement 2, Movement_1643F7
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75EB
	waitmovement 0
	return

EventScript_164390:: @ 8164390
	applymovement 2, Movement_1643F7
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75E7
	waitmovement 0
	return

EventScript_1643A5:: @ 81643A5
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16441C
	applymovement 2, Movement_1643F9
	waitmovement 0
	return

EventScript_1643B7:: @ 81643B7
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16441C
	applymovement 2, Movement_164401
	waitmovement 0
	return

EventScript_1643C9:: @ 81643C9
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16441C
	applymovement 2, Movement_164409
	waitmovement 0
	return

EventScript_1643DB:: @ 81643DB
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16441C
	applymovement 2, Movement_164409
	waitmovement 0
	return

Movement_1643ED:: @ 81643ED
	step_11
	step_11
	step_30
	step_end

Movement_1643F1:: @ 81643F1
	step_13
	step_13
	step_2e
	step_end

Movement_1643F5:: @ 81643F5
	step_13
	step_end

Movement_1643F7:: @ 81643F7
	step_11
	step_end

Movement_1643F9:: @ 81643F9
	step_1e
	step_20
	step_20
	step_20
	step_1d
	step_20
	step_20
	step_end

Movement_164401:: @ 8164401
	step_1d
	step_20
	step_20
	step_20
	step_1e
	step_20
	step_20
	step_end

Movement_164409:: @ 8164409
	step_20
	step_20
	step_20
	step_20
	step_1e
	step_end

Movement_16440F:: @ 816440F
	step_00
	step_5e
	step_39
	step_39
	step_39
	step_39
	step_39
	step_39
	step_39
	step_39
	step_39
	step_5f
	step_end

Movement_16441C:: @ 816441C
	step_1c
	step_30
	step_end

SixIsland_DottedHole_SapphireRoom_EventScript_16441F:: @ 816441F
	lockall
	setvar VAR_0x8005, 130
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A9321
	getbraillestringwidth gUnknown_81A9321
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A932D
	getbraillestringwidth gUnknown_81A932D
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A9338
	getbraillestringwidth gUnknown_81A9338
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A933F
	getbraillestringwidth gUnknown_81A933F
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A934A
	getbraillestringwidth gUnknown_81A934A
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A9356
	getbraillestringwidth gUnknown_81A9356
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A9362
	getbraillestringwidth gUnknown_81A9362
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A9368
	getbraillestringwidth gUnknown_81A9368
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A9374
	getbraillestringwidth gUnknown_81A9374
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A937C
	getbraillestringwidth gUnknown_81A937C
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A9387
	getbraillestringwidth gUnknown_81A9387
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A9393
	getbraillestringwidth gUnknown_81A9393
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A939F
	getbraillestringwidth gUnknown_81A939F
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A93AB
	getbraillestringwidth gUnknown_81A93AB
	call EventScript_BrailleCursorWaitButton
	setvar VAR_0x8006, 0
	braillemessage gUnknown_81A93B4
	getbraillestringwidth gUnknown_81A93B4
	call EventScript_BrailleCursorWaitButton
	braillemessage gUnknown_81A93C0
	waitbuttonpress
	releaseall
	end
