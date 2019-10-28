CeruleanCity_House2_MapScripts:: @ 816A975
	.byte 0

CeruleanCity_House2_EventScript_16A976:: @ 816A976
	lock
	faceplayer
	checkflag FLAG_GOT_TM28_FROM_ROCKET
	goto_if TRUE, EventScript_16A98B
	msgbox gUnknown_8191E13
	release
	end

EventScript_16A98B:: @ 816A98B
	msgbox gUnknown_8191ED8
	release
	end

CeruleanCity_House2_EventScript_16A995:: @ 816A995
	msgbox gUnknown_8191F2A, 2
	end

CeruleanCity_House2_EventScript_16A99E:: @ 816A99E
	msgbox gUnknown_8191F64, 3
	end
