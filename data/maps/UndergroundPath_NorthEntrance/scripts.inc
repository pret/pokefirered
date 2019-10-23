UndergroundPath_NorthEntrance_MapScripts:: @ 8160E38
	.byte 0

UndergroundPath_NorthEntrance_EventScript_160E39:: @ 8160E39
	lock
	faceplayer
	setvar VAR_0x8008, 2
	call EventScript_1A8CAD
	checkflag FLAG_DID_MS_NIDO_TRADE
	goto_if TRUE, EventScript_160EAB
	msgbox gUnknown_81A5AD6, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if eq, EventScript_160E93
	call EventScript_1A8CBD
	compare_var_to_value VAR_0x8004, 6
	goto_if ge, EventScript_160E93
	call EventScript_1A8CC9
	compare_var_to_var VAR_RESULT, VAR_0x8009
	goto_if ne, EventScript_160E9D
	call EventScript_1A8CD9
	msgbox gUnknown_81A5B4A
	setflag FLAG_DID_MS_NIDO_TRADE
	release
	end

EventScript_160E93:: @ 8160E93
	msgbox gUnknown_81A5B08
	release
	end

EventScript_160E9D:: @ 8160E9D
	getspeciesname 0, VAR_0x8009
	msgbox gUnknown_81A5B18
	release
	end

EventScript_160EAB:: @ 8160EAB
	msgbox gUnknown_81A5B60
	release
	end
