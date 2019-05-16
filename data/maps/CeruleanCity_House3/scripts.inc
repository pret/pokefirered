CeruleanCity_House3_MapScripts:: @ 816A9A7
	.byte 0

CeruleanCity_House3_EventScript_16A9A8:: @ 816A9A8
	msgbox gUnknown_8191F80, 2
	end

CeruleanCity_House3_EventScript_16A9B1:: @ 816A9B1
	lock
	faceplayer
	setvar VAR_0x8008, 1
	call EventScript_1A8CAD
	checkflag FLAG_0x24A
	goto_if_eq EventScript_16AA23
	msgbox gUnknown_81A59FE, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_16AA0B
	call EventScript_1A8CBD
	compare_var_to_value VAR_0x8004, 6
	goto_if 4, EventScript_16AA0B
	call EventScript_1A8CC9
	compare_var_to_var VAR_RESULT, VAR_0x8009
	goto_if 5, EventScript_16AA15
	call EventScript_1A8CD9
	msgbox gUnknown_81A5A9D
	setflag FLAG_0x24A
	release
	end

EventScript_16AA0B:: @ 816AA0B
	msgbox gUnknown_81A5A4E
	release
	end

EventScript_16AA15:: @ 816AA15
	getspeciesname 0, VAR_0x8009
	msgbox gUnknown_81A5A6A
	release
	end

EventScript_16AA23:: @ 816AA23
	msgbox gUnknown_81A5AA5
	release
	end
