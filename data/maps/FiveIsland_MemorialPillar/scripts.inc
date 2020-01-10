FiveIsland_MemorialPillar_MapScripts:: @ 81689D2
	.byte 0

FiveIsland_MemorialPillar_EventScript_1689D3:: @ 81689D3
	lock
	goto_if_set FLAG_GOT_TM42_AT_MEMORIAL_PILLAR, EventScript_168A18
	goto_if_set FLAG_NO_ROOM_FOR_TM42_AT_MEMORIAL_PILLAR, EventScript_168A22
	msgbox gUnknown_818B02E
	closemessage
	applymovement 1, Movement_FacePlayer
	waitmovement 0
	delay 45
	msgbox gUnknown_818B03C
	applymovement 1, Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox gUnknown_818B05E
	release
	end

EventScript_168A18:: @ 8168A18
	msgbox gUnknown_818B2DA
	release
	end

EventScript_168A22:: @ 8168A22
	msgbox gUnknown_818B282
	giveitem ITEM_TM42
	compare VAR_RESULT, 0
	goto_if_eq EventScript_168AFE
	call EventScript_168AE8
	release
	end

FiveIsland_MemorialPillar_EventScript_168A48:: @ 8168A48
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lockall
	goto_if_set FLAG_GOT_TM42_AT_MEMORIAL_PILLAR, EventScript_168B0B
	goto_if_set FLAG_NO_ROOM_FOR_TM42_AT_MEMORIAL_PILLAR, EventScript_168B0B
	msgbox gUnknown_818B095
	checkitem ITEM_LEMONADE, 1
	compare VAR_RESULT, 1
	goto_if_eq EventScript_168A86
	releaseall
	end

EventScript_168A86:: @ 8168A86
	msgbox gUnknown_818B105, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_168A9B
	releaseall
	end

EventScript_168A9B:: @ 8168A9B
	removeitem ITEM_LEMONADE, 1
	msgbox gUnknown_818B13E
	closemessage
	applymovement 1, Movement_WalkInPlaceFastestRight
	waitmovement 0
	delay 45
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	textcolor 0
	msgbox gUnknown_818B171
	giveitem ITEM_TM42
	compare VAR_RESULT, 0
	goto_if_eq EventScript_168AFE
	call EventScript_168AE8
	releaseall
	end

EventScript_168AE8:: @ 8168AE8
	msgbox gUnknown_818B219
	applymovement 1, Movement_WalkInPlaceFastestUp
	waitmovement 0
	setflag FLAG_GOT_TM42_AT_MEMORIAL_PILLAR
	return

EventScript_168AFE:: @ 8168AFE
	setflag FLAG_NO_ROOM_FOR_TM42_AT_MEMORIAL_PILLAR
	msgbox gUnknown_818B23E
	releaseall
	end

EventScript_168B0B:: @ 8168B0B
	msgbox gUnknown_818B2F8
	releaseall
	end
