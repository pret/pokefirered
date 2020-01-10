Route15_WestEntrance_2F_MapScripts:: @ 8170092
	.byte 0

Route15_WestEntrance_2F_EventScript_170093:: @ 8170093
	lockall
	msgbox gUnknown_819F79C
	drawmonpic SPECIES_ARTICUNO, 10, 3
	delay 20
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, SPECIES_ARTICUNO
	special Special_SetSeenMon
	releaseall
	end

Route15_WestEntrance_2F_EventScript_1700B0:: @ 81700B0
	msgbox gUnknown_819F7F8, MSGBOX_SIGN
	end

Route15_WestEntrance_2F_EventScript_1700B9:: @ 81700B9
	lock
	faceplayer
	call EventScript_170145
	goto_if_set FLAG_GOT_EXP_SHARE_FROM_OAKS_AIDE, EventScript_17013B
	msgbox gUnknown_819F5AB, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A7AD1
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, Special_GetPokedexCount
	getnumberstring 2, VAR_0x8006
	call EventScript_170145
	compare VAR_0x8006, 50
	goto_if_lt EventScript_1A7ABD
	msgbox gUnknown_819F6AA
	checkitemspace ITEM_EXP_SHARE, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1A7AC7
	giveitem_msg gUnknown_819F6FD, ITEM_EXP_SHARE
	setflag FLAG_GOT_EXP_SHARE_FROM_OAKS_AIDE
	msgbox gUnknown_819F71F
	release
	end

EventScript_17013B:: @ 817013B
	msgbox gUnknown_819F71F
	release
	end

EventScript_170145:: @ 8170145
	getnumberstring 0, 50
	getitemname 1, ITEM_EXP_SHARE
	return
