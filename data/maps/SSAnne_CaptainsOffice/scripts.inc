SSAnne_CaptainsOffice_MapScripts:: @ 8160B39
	.byte 0

SSAnne_CaptainsOffice_EventScript_160B3A:: @ 8160B3A
	lock
	checkflag FLAG_0x237
	goto_if 1, EventScript_160BB5
	msgbox gUnknown_8173646
	textcolor 3
	message Text_173676
	waitmessage
	playfanfare MUS_ME_ASA
	waitfanfare
	call EventScript_1A6675
	delay 50
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_81736A6
	additem ITEM_HM01, 1
	giveitemfanfaremsg gUnknown_81737AF, ITEM_HM01, 1, BGM_FRLG_ME_KEYITEM
	msgbox gUnknown_81737D2
	setflag FLAG_0x237
	setvar VAR_MAP_SCENE_VERMILION_CITY, 1
	release
	end

EventScript_160BA0:: @ 8160BA0
	msgbox gUnknown_81738C3
	closemessage
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_160BB5:: @ 8160BB5
	applymovement 1, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_8173831
	release
	end

SSAnne_CaptainsOffice_EventScript_160BC9:: @ 8160BC9
	msgbox gUnknown_81738E6, 3
	end

SSAnne_CaptainsOffice_EventScript_160BD2:: @ 8160BD2
	msgbox gUnknown_8173903, 3
	end
