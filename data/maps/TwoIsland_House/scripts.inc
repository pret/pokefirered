TwoIsland_House_MapScripts:: @ 8171618
	.byte 0

TwoIsland_House_EventScript_171619:: @ 8171619
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	clearflag FLAG_0x002
	clearflag FLAG_0x003
	clearflag FLAG_0x004
	checkflag FLAG_0x001
	goto_if 1, EventScript_17164F
	msgbox gUnknown_81A2B88
	setflag FLAG_0x001
	goto EventScript_17164F
	end

EventScript_17164F:: @ 817164F
	checkitem ITEM_BIG_MUSHROOM, 1
	compare_var_to_value VAR_RESULT, 1
	call_if 1, EventScript_1717A8
	checkitem ITEM_TINY_MUSHROOM, 2
	compare_var_to_value VAR_RESULT, 1
	call_if 1, EventScript_1717AC
	checkflag FLAG_0x002
	goto_if 1, EventScript_171687
	checkflag FLAG_0x003
	goto_if 1, EventScript_171696
	goto EventScript_17179E
	end

EventScript_171687:: @ 8171687
	checkflag FLAG_0x003
	call_if 1, EventScript_1717B0
	goto EventScript_1716A5
	end

EventScript_171696:: @ 8171696
	checkflag FLAG_0x002
	call_if 1, EventScript_1717B0
	goto EventScript_1716A5
	end

EventScript_1716A5:: @ 81716A5
	msgbox gUnknown_81A2C63, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_17179E
	goto EventScript_1716BE
	end

EventScript_1716BE:: @ 81716BE
	msgbox gUnknown_81A2CC3
	special sub_80BF93C
	waitstate
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_17179E
	special sub_80BFC14
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_171790
	compare_var_to_value VAR_0x8005, 0
	goto_if 1, EventScript_171782
	goto EventScript_1716F4
	end

EventScript_1716F4:: @ 81716F4
	msgbox gUnknown_81A2CE1
	special sub_80E4634
	waitstate
	compare_var_to_value VAR_0x8004, 0
	goto_if 1, EventScript_1716BE
	checkflag FLAG_0x004
	goto_if 1, EventScript_17175B
	checkflag FLAG_0x002
	goto_if 1, EventScript_171727
	checkflag FLAG_0x003
	goto_if 1, EventScript_171741
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
	multichoice 0, 0, 51, 1
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_171741
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_171727
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
	setflag FLAG_0x002
	return

EventScript_1717AC:: @ 81717AC
	setflag FLAG_0x003
	return

EventScript_1717B0:: @ 81717B0
	setflag FLAG_0x004
	return
