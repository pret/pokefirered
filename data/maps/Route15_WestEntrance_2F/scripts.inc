Route15_WestEntrance_2F_MapScripts:: @ 8170092
	.byte 0

Route15_WestEntrance_2F_EventScript_170093:: @ 8170093
	lockall
	msgbox gUnknown_819F79C
	drawmonpic SPECIES_ARTICUNO, 10, 3
	delay 20
	waitbuttonpress
	erasemonpic
	setvar VAR_0x8004, 144
	special sub_80CBDCC
	releaseall
	end

Route15_WestEntrance_2F_EventScript_1700B0:: @ 81700B0
	msgbox gUnknown_819F7F8, 3
	end

Route15_WestEntrance_2F_EventScript_1700B9:: @ 81700B9
	lock
	faceplayer
	call EventScript_170145
	checkflag FLAG_0x256
	goto_if 1, EventScript_17013B
	msgbox gUnknown_819F5AB, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1A7AD1
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, sub_80CA3D8
	getnumberstring 2, VAR_0x8006
	call EventScript_170145
	compare_var_to_value VAR_0x8006, 50
	goto_if 0, EventScript_1A7ABD
	msgbox gUnknown_819F6AA
	checkitemspace ITEM_EXP_SHARE, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1A7AC7
	additem ITEM_EXP_SHARE, 1
	giveitemfanfaremsg gUnknown_819F6FD, ITEM_EXP_SHARE
	setflag FLAG_0x256
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
