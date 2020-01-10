TwoIsland_House_MapScripts:: @ 8171618
	.byte 0

TwoIsland_House_EventScript_171619:: @ 8171619
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	clearflag FLAG_TEMP_2
	clearflag FLAG_TEMP_3
	clearflag FLAG_TEMP_4
	goto_if_set FLAG_TEMP_1, EventScript_17164F
	msgbox gUnknown_81A2B88
	setflag FLAG_TEMP_1
	goto EventScript_17164F
	end

EventScript_17164F:: @ 817164F
	checkitem ITEM_BIG_MUSHROOM, 1
	compare VAR_RESULT, TRUE
	call_if_eq EventScript_1717A8
	checkitem ITEM_TINY_MUSHROOM, 2
	compare VAR_RESULT, TRUE
	call_if_eq EventScript_1717AC
	goto_if_set FLAG_TEMP_2, EventScript_171687
	goto_if_set FLAG_TEMP_3, EventScript_171696
	goto EventScript_17179E
	end

EventScript_171687:: @ 8171687
	call_if_set FLAG_TEMP_3, EventScript_1717B0
	goto EventScript_1716A5
	end

EventScript_171696:: @ 8171696
	call_if_set FLAG_TEMP_2, EventScript_1717B0
	goto EventScript_1716A5
	end

EventScript_1716A5:: @ 81716A5
	msgbox gUnknown_81A2C63, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_17179E
	goto EventScript_1716BE
	end

EventScript_1716BE:: @ 81716BE
	msgbox gUnknown_81A2CC3
	special SelectMoveTutorMon
	waitstate
	compare VAR_0x8004, 6
	goto_if_ge EventScript_17179E
	special IsSelectedMonEgg
	compare VAR_RESULT, 1
	goto_if_eq EventScript_171790
	compare VAR_0x8005, 0
	goto_if_eq EventScript_171782
	goto EventScript_1716F4
	end

EventScript_1716F4:: @ 81716F4
	msgbox gUnknown_81A2CE1
	special DisplayMoveTutorMenu
	waitstate
	compare VAR_0x8004, 0
	goto_if_eq EventScript_1716BE
	goto_if_set FLAG_TEMP_4, EventScript_17175B
	goto_if_set FLAG_TEMP_2, EventScript_171727
	goto_if_set FLAG_TEMP_3, EventScript_171741
	end

EventScript_171727:: @ 8171727
	removeitem ITEM_BIG_MUSHROOM, 1
	textcolor 3
	msgbox gUnknown_81A2DB3
	call EventScript_1A6675
	goto EventScript_17179E
	end

EventScript_171741:: @ 8171741
	removeitem ITEM_TINY_MUSHROOM, 2
	textcolor 3
	msgbox gUnknown_81A2D85
	call EventScript_1A6675
	goto EventScript_17179E
	end

EventScript_17175B:: @ 817175B
	message Text_1A2D43
	waitmessage
	multichoice 0, 0, MULTICHOICE_MUSHROOMS, TRUE
	switch VAR_RESULT
	case 0, EventScript_171741
	case 1, EventScript_171727
	end

EventScript_171782:: @ 8171782
	msgbox gUnknown_81A2CFC
	goto EventScript_1716BE
	end

EventScript_171790:: @ 8171790
	msgbox gUnknown_81A2E20
	goto EventScript_1716BE
	end

EventScript_17179E:: @ 817179E
	msgbox gUnknown_81A2DE0
	release
	end

EventScript_1717A8:: @ 81717A8
	setflag FLAG_TEMP_2
	return

EventScript_1717AC:: @ 81717AC
	setflag FLAG_TEMP_3
	return

EventScript_1717B0:: @ 81717B0
	setflag FLAG_TEMP_4
	return
