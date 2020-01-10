SixIsland_RuinValley_MapScripts:: @ 8168B53
	map_script MAP_SCRIPT_ON_LOAD, SixIsland_RuinValley_OnLoad
	.byte 0

SixIsland_RuinValley_OnLoad:: @ 8168B59
	call_if_set FLAG_USED_CUT_ON_RUIN_VALLEY_BRAILLE, EventScript_168B63
	end

EventScript_168B63:: @ 8168B63
	setmetatile 24, 24, 856, 0
	return

SixIsland_RuinValley_EventScript_168B6D:: @ 8168B6D
	lock
	msgbox gUnknown_818BD47
	applymovement 1, Movement_FacePlayer
	waitmovement 0
	msgbox gUnknown_818BD7A
	applymovement 1, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SixIsland_RuinValley_EventScript_168B94:: @ 8168B94
	lockall
	goto_if_set FLAG_USED_CUT_ON_RUIN_VALLEY_BRAILLE, EventScript_168BC1
	msgbox gUnknown_818BDC0, MSGBOX_YESNO
	compare VAR_RESULT, NO
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
