SSAnne_CaptainsOffice_MapScripts:: @ 8160B39
	.byte 0

SSAnne_CaptainsOffice_EventScript_160B3A:: @ 8160B3A
	lock
	checkflag FLAG_0x237
	goto_if 1, EventScript_160BB5
	loadword 0, gUnknown_8173646
	callstd 4
	textcolor 3
	message Text_173676
	waitmessage
	playfanfare MUS_ME_ASA
	waitfanfare
	call EventScript_1A6675
	delay 50
	applymovement 1, Movement_1A75E1
	waitmovement 0
	loadword 0, gUnknown_81736A6
	callstd 4
	additem ITEM_HM01, 1
	loadword 0, gUnknown_81737AF
	setorcopyvar VAR_0x8000, 339
	setorcopyvar VAR_0x8001, 1
	setorcopyvar VAR_0x8002, 318
	callstd 9
	loadword 0, gUnknown_81737D2
	callstd 4
	setflag FLAG_0x237
	setvar VAR_0x407E, 1
	release
	end

EventScript_160BA0:: @ 8160BA0
	loadword 0, gUnknown_81738C3
	callstd 4
	closemessage
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_160BB5:: @ 8160BB5
	applymovement 1, Movement_1A75E1
	waitmovement 0
	loadword 0, gUnknown_8173831
	callstd 4
	release
	end

SSAnne_CaptainsOffice_EventScript_160BC9:: @ 8160BC9
	loadword 0, gUnknown_81738E6
	callstd 3
	end

SSAnne_CaptainsOffice_EventScript_160BD2:: @ 8160BD2
	loadword 0, gUnknown_8173903
	callstd 3
	end
