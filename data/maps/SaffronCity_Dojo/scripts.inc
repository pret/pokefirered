SaffronCity_Dojo_MapScripts:: @ 816EBDB
	.byte 0

SaffronCity_Dojo_EventScript_16EBDC:: @ 816EBDC
	lockall
	setvar VAR_MAP_SCENE_SAFFRON_CITY_DOJO, 1
	applymovement 5, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	releaseall
	end

SaffronCity_Dojo_EventScript_16EBEE:: @ 816EBEE
	lockall
	setvar VAR_MAP_SCENE_SAFFRON_CITY_DOJO, 1
	applymovement 5, Movement_WalkInPlaceFastestRight
	waitmovement 0
	releaseall
	end

SaffronCity_Dojo_EventScript_16EC00:: @ 816EC00
	lock
	faceplayer
	checkflag FLAG_GOT_HITMON_FROM_DOJO
	goto_if TRUE, EventScript_16EC3C
	drawmonpic SPECIES_HITMONLEE, 10, 3
	setvar VAR_TEMP_1, SPECIES_HITMONLEE
	applymovement 5, Movement_WalkInPlaceFastestUp
	waitmovement 0
	textcolor 0
	msgbox gUnknown_819B44E, MSGBOX_YESNO
	call EventScript_1A6675
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16EC82
	erasemonpic
	release
	end

EventScript_16EC3C:: @ 816EC3C
	msgbox gUnknown_819B4E1
	release
	end

SaffronCity_Dojo_EventScript_16EC46:: @ 816EC46
	lock
	faceplayer
	checkflag FLAG_GOT_HITMON_FROM_DOJO
	goto_if TRUE, EventScript_16EC3C
	drawmonpic SPECIES_HITMONCHAN, 10, 3
	setvar VAR_TEMP_1, SPECIES_HITMONCHAN
	applymovement 5, Movement_WalkInPlaceFastestUp
	waitmovement 0
	textcolor 0
	msgbox gUnknown_819B49E, MSGBOX_YESNO
	call EventScript_1A6675
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16EC82
	erasemonpic
	release
	end

EventScript_16EC82:: @ 816EC82
	erasemonpic
	givemon VAR_TEMP_1, 25, ITEM_NONE, 0, 0, 0
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16ECB5
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16ECEC
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A927C
	release
	end

EventScript_16ECB5:: @ 816ECB5
	removeobject VAR_LAST_TALKED
	getspeciesname 0, VAR_TEMP_1
	playfanfare MUS_FANFA1
	message Text_19B473
	waitmessage
	waitfanfare
	setflag FLAG_GOT_HITMON_FROM_DOJO
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16ED29
	call EventScript_1A8C27
	call EventScript_1A74EB
	goto EventScript_16ED29
	end

EventScript_16ECEC:: @ 816ECEC
	removeobject VAR_LAST_TALKED
	getspeciesname 0, VAR_TEMP_1
	playfanfare MUS_FANFA1
	message Text_19B473
	waitmessage
	waitfanfare
	setflag FLAG_GOT_HITMON_FROM_DOJO
	msgbox gUnknown_81A56A7, MSGBOX_YESNO
	compare VAR_RESULT, 0
	goto_if eq, EventScript_16ED1E
	call EventScript_1A8C33
	goto EventScript_16ED1E
	end

EventScript_16ED1E:: @ 816ED1E
	call EventScript_1A8C3C
	goto EventScript_16ED29
	end

EventScript_16ED29:: @ 816ED29
	release
	end

SaffronCity_Dojo_EventScript_16ED2B:: @ 816ED2B
	msgbox gUnknown_819B52E, 3
	end

SaffronCity_Dojo_EventScript_16ED34:: @ 816ED34
	msgbox gUnknown_819B4F8, 3
	end

SaffronCity_Dojo_EventScript_16ED3D:: @ 816ED3D
	msgbox gUnknown_819B50F, 3
	end

SaffronCity_Dojo_EventScript_16ED46:: @ 816ED46
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BLACK_BELT_HITOSHI, 0, Text_19B3DF, Text_19B40F
	msgbox gUnknown_819B41F, 6
	end

SaffronCity_Dojo_EventScript_16ED5D:: @ 816ED5D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BLACK_BELT_HIDEKI, 0, Text_19B2E0, Text_19B2FD
	msgbox gUnknown_819B30F, 6
	end

SaffronCity_Dojo_EventScript_16ED74:: @ 816ED74
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BLACK_BELT_AARON, 0, Text_19B341, Text_19B396
	msgbox gUnknown_819B3AC, 6
	end

SaffronCity_Dojo_EventScript_16ED8B:: @ 816ED8B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BLACK_BELT_MIKE, 0, Text_19B275, Text_19B292
	msgbox gUnknown_819B29D, 6
	end

SaffronCity_Dojo_EventScript_16EDA2:: @ 816EDA2
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT, TRAINER_BLACK_BELT_KOICHI, 0, Text_19B12C, Text_19B193, EventScript_16EDD0
	checkflag FLAG_GOT_HITMON_FROM_DOJO
	goto_if TRUE, EventScript_16EDC6
	msgbox gUnknown_819B1A7, 6
	end

EventScript_16EDC6:: @ 816EDC6
	msgbox gUnknown_819B24C
	release
	end

EventScript_16EDD0:: @ 816EDD0
	setvar VAR_MAP_SCENE_SAFFRON_CITY_DOJO, 1
	release
	end
