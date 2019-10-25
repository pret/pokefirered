CeruleanCity_House1_MapScripts:: @ 816A7EF
	.byte 0

CeruleanCity_House1_EventScript_16A7F0:: @ 816A7F0
	lock
	faceplayer
	msgbox gUnknown_81918E7
	message Text_191967
	waitmessage
	setvar VAR_0x8004, 0
	special Special_ListMenu
	waitstate
	switch VAR_RESULT
	case 0, EventScript_16A8FB
	case 1, EventScript_16A909
	case 2, EventScript_16A917
	case 3, EventScript_16A925
	case 4, EventScript_16A933
	case 5, EventScript_16A941
	case 6, EventScript_16A94F
	case 7, EventScript_16A95D
	case 8, EventScript_16A96B
	case 127, EventScript_16A96B
	end

EventScript_16A87D:: @ 816A87D
	message Text_191967
	waitmessage
	special Special_ReturnToListMenu
	waitstate
	switch VAR_RESULT
	case 0, EventScript_16A8FB
	case 1, EventScript_16A909
	case 2, EventScript_16A917
	case 3, EventScript_16A925
	case 4, EventScript_16A933
	case 5, EventScript_16A941
	case 6, EventScript_16A94F
	case 7, EventScript_16A95D
	case 8, EventScript_16A96B
	case 127, EventScript_16A96B
	end

EventScript_16A8FB:: @ 816A8FB
	msgbox gUnknown_81919BE
	goto EventScript_16A87D
	end

EventScript_16A909:: @ 816A909
	msgbox gUnknown_8191A31
	goto EventScript_16A87D
	end

EventScript_16A917:: @ 816A917
	msgbox gUnknown_8191AF9
	goto EventScript_16A87D
	end

EventScript_16A925:: @ 816A925
	msgbox gUnknown_8191B69
	goto EventScript_16A87D
	end

EventScript_16A933:: @ 816A933
	msgbox gUnknown_8191C36
	goto EventScript_16A87D
	end

EventScript_16A941:: @ 816A941
	msgbox gUnknown_8191CA9
	goto EventScript_16A87D
	end

EventScript_16A94F:: @ 816A94F
	msgbox gUnknown_8191D78
	goto EventScript_16A87D

EventScript_16A95C:: @ 816A95C
	end

EventScript_16A95D:: @ 816A95D
	msgbox gUnknown_8191DF8
	goto EventScript_16A87D

EventScript_16A96A:: @ 816A96A
	end

EventScript_16A96B:: @ 816A96B
	msgbox gUnknown_819199E
	release
	end
