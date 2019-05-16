MtMoon_B2F_MapScripts:: @ 8160699
	map_script 3, MtMoon_B2F_MapScript1_16069F
	.byte 0

MtMoon_B2F_MapScript1_16069F:: @ 816069F
	checkflag FLAG_0x232
	call_if 0, EventScript_1606A9
	end

EventScript_1606A9:: @ 81606A9
	clearflag FLAG_0x02F
	clearflag FLAG_0x030
	return

MtMoon_B2F_EventScript_1606B0:: @ 81606B0
	lockall
	applymovement 3, Movement_1A75EB
	waitmovement 0
	call EventScript_1606DD
	releaseall
	end

MtMoon_B2F_EventScript_1606C2:: @ 81606C2
	lock
	faceplayer
	checkflag FLAG_0x232
	goto_if 1, EventScript_160707
	checktrainerflag FLAG_0x0AA
	goto_if 1, EventScript_160711
	call EventScript_1606DD
	release
	end

EventScript_1606DD:: @ 81606DD
	textcolor 0
	message Text_172B64
	waitmessage
	playbgm BGM_FRLG_LEADER_EYE, 0
	waitbuttonpress
	setvar VAR_LAST_TALKED, 3
	trainerbattle 3, 170, 0, Text_172B99
	setvar VAR_0x408B, 1
	msgbox gUnknown_8172BAB
	return

EventScript_160707:: @ 8160707
	msgbox gUnknown_8172BFB
	release
	end

EventScript_160711:: @ 8160711
	msgbox gUnknown_8172BAB
	release
	end

MtMoon_B2F_EventScript_16071B:: @ 816071B
	lock
	faceplayer
	msgbox gUnknown_8172E77, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1607DE
	removeobject 1
	additem ITEM_DOME_FOSSIL, 1
	giveitemfanfaremsg gUnknown_8172ECD, ITEM_DOME_FOSSIL, 1, BGM_FRLG_ME_KEYITEM
	closemessage
	special sub_8112364
	delay 10
	applymovement 3, Movement_16077A
	waitmovement 0
	moveobjectoffscreen 3
	textcolor 0
	playfanfare BGM_FRLG_ME_KEYITEM
	message Text_172BD6
	waitmessage
	waitfanfare
	removeobject 2
	setflag FLAG_0x272
	setflag FLAG_0x232
	release
	end

Movement_16077A:: @ 816077A
	step_13
	step_11
	step_11
	step_11
	step_end

MtMoon_B2F_EventScript_16077F:: @ 816077F
	lock
	faceplayer
	msgbox gUnknown_8172E94, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1607DE
	removeobject 2
	additem ITEM_HELIX_FOSSIL, 1
	giveitemfanfaremsg gUnknown_8172EB2, ITEM_HELIX_FOSSIL, 1, BGM_FRLG_ME_KEYITEM
	closemessage
	special sub_8112364
	delay 10
	applymovement 3, Movement_1607E0
	waitmovement 0
	moveobjectoffscreen 3
	textcolor 0
	playfanfare BGM_FRLG_ME_KEYITEM
	message Text_172BD6
	waitmessage
	waitfanfare
	removeobject 1
	setflag FLAG_0x273
	setflag FLAG_0x232
	release
	end

EventScript_1607DE:: @ 81607DE
	release
	end

Movement_1607E0:: @ 81607E0
	step_11
	step_11
	step_11
	step_end

MtMoon_B2F_EventScript_1607E4:: @ 81607E4
	trainerbattle 0, 351, 0, Text_172C5A, Text_172CB8
	msgbox gUnknown_8172CCB, 6
	end

MtMoon_B2F_EventScript_1607FB:: @ 81607FB
	trainerbattle 0, 352, 0, Text_172CFC, Text_172D46
	msgbox gUnknown_8172D51, 6
	end

MtMoon_B2F_EventScript_160812:: @ 8160812
	trainerbattle 0, 353, 0, Text_172D82, Text_172DAF
	msgbox gUnknown_8172DC1, 6
	end

MtMoon_B2F_EventScript_160829:: @ 8160829
	trainerbattle 0, 354, 0, Text_172DF0, Text_172E3E
	msgbox gUnknown_8172E4B, 6
	end
