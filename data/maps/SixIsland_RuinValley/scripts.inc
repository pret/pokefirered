SixIsland_RuinValley_MapScripts:: @ 8168B53
	map_script 1, SixIsland_RuinValley_MapScript1_168B59
	.byte 0

SixIsland_RuinValley_MapScript1_168B59:: @ 8168B59
	checkflag FLAG_0x2E3
	call_if 1, EventScript_168B63
	end

EventScript_168B63:: @ 8168B63
	setmetatile 24, 24, 856, 0
	return

SixIsland_RuinValley_EventScript_168B6D:: @ 8168B6D
	lock
	msgbox gUnknown_818BD47
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_818BD7A
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

SixIsland_RuinValley_EventScript_168B94:: @ 8168B94
	lockall
	checkflag FLAG_0x2E3
	goto_if_eq EventScript_168BC1
	msgbox gUnknown_818BDC0, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_168BCB
	msgbox gUnknown_818BE11
	braillemessage gUnknown_81A929B
	waitbuttonpress
	releaseall
	end

EventScript_168BC1:: @ 8168BC1
	msgbox gUnknown_818BE4B
	releaseall
	end

EventScript_168BCB:: @ 8168BCB
	msgbox gUnknown_818BDF9
	releaseall
	end
