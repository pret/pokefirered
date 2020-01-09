PewterCity_Museum_1F_MapScripts:: @ 816A31A
	.byte 0

PewterCity_Museum_1F_EventScript_16A31B:: @ 816A31B
	lock
	faceplayer
	compare VAR_FACING, 3
	goto_if eq, EventScript_16A348
	compare VAR_FACING, 1
	goto_if eq, EventScript_16A348
	compare VAR_FACING, 2
	goto_if eq, EventScript_16A348
	msgbox gUnknown_8190539
	release
	end

EventScript_16A348:: @ 816A348
	msgbox gUnknown_8190550, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16A367
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16A37B
	end

EventScript_16A367:: @ 816A367
	msgbox gUnknown_81905B1
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_16A37B:: @ 816A37B
	msgbox gUnknown_8190627
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

PewterCity_Museum_1F_EventScript_16A38F:: @ 816A38F
	lockall
	setvar VAR_0x4001, 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75EB
	waitmovement 0
	goto EventScript_16A3D1
	end

PewterCity_Museum_1F_EventScript_16A3A5:: @ 816A3A5
	lockall
	setvar VAR_0x4001, 1
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75EB
	waitmovement 0
	goto EventScript_16A3D1
	end

PewterCity_Museum_1F_EventScript_16A3BB:: @ 816A3BB
	lockall
	setvar VAR_0x4001, 2
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75EB
	waitmovement 0
	goto EventScript_16A3D1
	end

EventScript_16A3D1:: @ 816A3D1
	textcolor 0
	showmoneybox 0, 0, 0
	msgbox gUnknown_81904B5, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16A402
	msgbox gUnknown_81904F9
	closemessage
	hidemoneybox 0, 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16A48E
	waitmovement 0
	releaseall
	end

EventScript_16A402:: @ 816A402
	checkmoney 50, 0
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16A476
	closemessage
	compare VAR_0x4001, 0
	call_if eq, EventScript_16A455
	compare VAR_0x4001, 1
	call_if eq, EventScript_16A460
	compare VAR_0x4001, 2
	call_if eq, EventScript_16A46B
	playse SE_SHOP
	takemoney 50, 0
	updatemoneybox 0, 0, 0
	waitse
	msgbox gUnknown_8190505
	setvar VAR_MAP_SCENE_PEWTER_CITY_MUSEUM_1F, 1
	hidemoneybox 0, 0
	releaseall
	end

EventScript_16A455:: @ 816A455
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16A490
	waitmovement 0
	return

EventScript_16A460:: @ 816A460
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16A495
	waitmovement 0
	return

EventScript_16A46B:: @ 816A46B
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16A499
	waitmovement 0
	return

EventScript_16A476:: @ 816A476
	msgbox gUnknown_819051C
	closemessage
	hidemoneybox 0, 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_16A48E
	waitmovement 0
	releaseall
	end

Movement_16A48E:: @ 816A48E
	step_10
	step_end

Movement_16A490:: @ 816A490
	step_13
	step_13
	step_1b
	step_28
	step_end

Movement_16A495:: @ 816A495
	step_13
	step_1b
	step_28
	step_end

Movement_16A499:: @ 816A499
	step_1b
	step_28
	step_end

PewterCity_Museum_1F_EventScript_16A49C:: @ 816A49C
	msgbox gUnknown_81908CD, 2
	end

PewterCity_Museum_1F_EventScript_16A4A5:: @ 816A4A5
	msgbox gUnknown_81906B4, 2
	end

PewterCity_Museum_1F_EventScript_16A4AE:: @ 816A4AE
	lock
	faceplayer
	checkflag FLAG_GOT_OLD_AMBER
	goto_if TRUE, EventScript_16A4FF
	msgbox gUnknown_8190717
	checkitemspace ITEM_OLD_AMBER, 1
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16A4F5
	setflag FLAG_GOT_OLD_AMBER
	removeobject 4
	additem ITEM_OLD_AMBER, 1
	giveitemfanfaremsg gUnknown_8190866, ITEM_OLD_AMBER, 1, MUS_FAN5
	release
	end

EventScript_16A4F5:: @ 816A4F5
	msgbox gUnknown_81908AE
	release
	end

EventScript_16A4FF:: @ 816A4FF
	msgbox gUnknown_819088E
	release
	end

PewterCity_Museum_1F_EventScript_16A509:: @ 816A509
	msgbox gUnknown_819090A, 2
	end

PewterCity_Museum_1F_EventScript_16A512:: @ 816A512
	lockall
	setvar VAR_0x8004, SPECIES_AERODACTYL
	setvar VAR_0x8005, 10
	setvar VAR_0x8006, 3
	special Special_OpenMuseumFossilPic
	msgbox gUnknown_8190945
	special Special_CloseMuseumFossilPic
	releaseall
	end

PewterCity_Museum_1F_EventScript_16A532:: @ 816A532
	lockall
	setvar VAR_0x8004, SPECIES_KABUTOPS
	setvar VAR_0x8005, 10
	setvar VAR_0x8006, 3
	special Special_OpenMuseumFossilPic
	msgbox gUnknown_8190975
	special Special_CloseMuseumFossilPic
	releaseall
	end
