CeladonCity_MapScripts:: @ 8166C8F
	map_script 3, CeladonCity_MapScript1_166C95
	.byte 0

CeladonCity_MapScript1_166C95:: @ 8166C95
	setworldmapflag FLAG_WORLD_MAP_CELADON_CITY
	end

CeladonCity_EventScript_166C99:: @ 8166C99
	msgbox gUnknown_817FEC3, 2
	end

CeladonCity_EventScript_166CA2:: @ 8166CA2
	lock
	msgbox gUnknown_817FF1C
	release
	end

CeladonCity_EventScript_166CAD:: @ 8166CAD
	msgbox gUnknown_817FF4A, 2
	end

CeladonCity_EventScript_166CB6:: @ 8166CB6
	msgbox gUnknown_817FFC5, 2
	end

CeladonCity_EventScript_166CBF:: @ 8166CBF
	goto EventScript_1C4A86
	end

CeladonCity_EventScript_166CC5:: @ 8166CC5
	lock
	faceplayer
	msgbox gUnknown_818001B
	closemessage
	applymovement 2, Movement_1A75E5
	waitmovement 0
	release
	end

CeladonCity_EventScript_166CDC:: @ 8166CDC
	lock
	faceplayer
	waitse
	playmoncry SPECIES_POLIWRATH, 0
	msgbox gUnknown_8180075
	closemessage
	waitmoncry
	applymovement 3, Movement_1A75E5
	waitmovement 0
	release
	end

CeladonCity_EventScript_166CFA:: @ 8166CFA
	msgbox gUnknown_81800C2, 2
	end

CeladonCity_EventScript_166D03:: @ 8166D03
	msgbox gUnknown_818008C, 2
	end

CeladonCity_EventScript_166D0C:: @ 8166D0C
	msgbox gUnknown_8180300, 2
	end

CeladonCity_EventScript_166D15:: @ 8166D15
	msgbox gUnknown_81804E1, 2
	end

CeladonCity_EventScript_166D1E:: @ 8166D1E
	msgbox gUnknown_81800E1, 3
	end

CeladonCity_EventScript_166D27:: @ 8166D27
	msgbox gUnknown_818017A, 3
	end

CeladonCity_EventScript_166D30:: @ 8166D30
	lockall
	famechecker FAMECHECKER_ERIKA, 0
	msgbox gUnknown_81801A2
	releaseall
	end

CeladonCity_EventScript_166D48:: @ 8166D48
	msgbox gUnknown_81801E5, 3
	end

CeladonCity_EventScript_166D51:: @ 8166D51
	msgbox gUnknown_81801F5, 3
	end

CeladonCity_EventScript_166D5A:: @ 8166D5A
	msgbox gUnknown_8180224, 3
	end

CeladonCity_EventScript_166D63:: @ 8166D63
	msgbox gUnknown_81802A4, 3
	end

CeladonCity_EventScript_166D6C:: @ 8166D6C
	msgbox gUnknown_81802CF, 3
	end
