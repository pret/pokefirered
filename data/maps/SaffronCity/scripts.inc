SaffronCity_MapScripts:: @ 816735F
	map_script 3, SaffronCity_MapScript1_167365
	.byte 0

SaffronCity_MapScript1_167365:: @ 8167365
	setworldmapflag FLAG_WORLD_MAP_SAFFRON_CITY
	checkflag FLAG_0x23C
	call_if 0, EventScript_167372
	end

EventScript_167372:: @ 8167372
	setobjectxyperm 6, 33, 31
	return

SaffronCity_EventScript_16737A:: @ 816737A
	msgbox gUnknown_8181003, 2
	end

SaffronCity_EventScript_167383:: @ 8167383
	msgbox gUnknown_818101F, 2
	end

SaffronCity_EventScript_16738C:: @ 816738C
	msgbox gUnknown_818105A, 2
	end

SaffronCity_EventScript_167395:: @ 8167395
	msgbox gUnknown_8181087, 2
	end

SaffronCity_EventScript_16739E:: @ 816739E
	msgbox gUnknown_81810A7, 2
	end

SaffronCity_EventScript_1673A7:: @ 81673A7
	msgbox gUnknown_81810D5, 2
	end

SaffronCity_EventScript_1673B0:: @ 81673B0
	msgbox gUnknown_81810F5, 2
	end

SaffronCity_EventScript_1673B9:: @ 81673B9
	lock
	checkflag FLAG_0x23C
	goto_if_eq EventScript_1673D7
	applymovement 6, Movement_1A75E1
	waitmovement 0
	msgbox gUnknown_81812CA
	release
	end

EventScript_1673D7:: @ 81673D7
	textcolor 3
	msgbox gUnknown_8181302
	release
	end

SaffronCity_EventScript_1673E3:: @ 81673E3
	msgbox gUnknown_8181159, 2
	end

SaffronCity_EventScript_1673EC:: @ 81673EC
	msgbox gUnknown_8181189, 2
	end

SaffronCity_EventScript_1673F5:: @ 81673F5
	msgbox gUnknown_81811BF, 2
	end

SaffronCity_EventScript_1673FE:: @ 81673FE
	msgbox gUnknown_8181225, 2
	end

SaffronCity_EventScript_167407:: @ 8167407
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PIDGEOT, 0
	msgbox gUnknown_8181286
	waitmoncry
	release
	end

SaffronCity_EventScript_16741A:: @ 816741A
	msgbox gUnknown_8181299, 2
	end

SaffronCity_EventScript_167423:: @ 8167423
	msgbox gUnknown_8181326, 3
	end

SaffronCity_EventScript_16742C:: @ 816742C
	msgbox gUnknown_8181354, 3
	end

SaffronCity_EventScript_167435:: @ 8167435
	lockall
	setvar VAR_0x8004, 7
	setvar VAR_0x8005, 0
	special SetFlavorTextFlagFromSpecialVars
	msgbox gUnknown_8181362
	releaseall
	end

SaffronCity_EventScript_16744D:: @ 816744D
	msgbox gUnknown_81813AA, 3
	end

SaffronCity_EventScript_167456:: @ 8167456
	msgbox gUnknown_8181452, 3
	end

SaffronCity_EventScript_16745F:: @ 816745F
	msgbox gUnknown_81814B9, 3
	end

SaffronCity_EventScript_167468:: @ 8167468
	msgbox gUnknown_81814D3, 3
	end

SaffronCity_EventScript_167471:: @ 8167471
	msgbox gUnknown_81814E7, 3
	end

SaffronCity_EventScript_16747A:: @ 816747A
	msgbox gUnknown_8181519, 3
	end
