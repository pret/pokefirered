PokemonMansion_B1F_MapScripts:: @ 81622FC
	map_script 1, PokemonMansion_B1F_MapScript1_162302
	.byte 0

PokemonMansion_B1F_MapScript1_162302:: @ 8162302
	checkflag FLAG_0x26C
	call_if 1, EventScript_1A7F4C
	end

PokemonMansion_B1F_EventScript_16230C:: @ 816230C
	lockall
	setvar VAR_0x8004, 3
	call EventScript_1A7AE2
	playse SE_FU_ZAKU2
	special DrawWholeMapView
	waitse
	releaseall
	end

PokemonMansion_B1F_EventScript_162320:: @ 8162320
	msgbox gUnknown_8177798, 3
	end

PokemonMansion_B1F_EventScript_162329:: @ 8162329
	trainerbattle 0, 219, 0, Text_1776C0, Text_1776D7
	msgbox gUnknown_81776DE, 6
	end

PokemonMansion_B1F_EventScript_162340:: @ 8162340
	trainerbattle 0, 347, 0, Text_177720, Text_177757
	msgbox gUnknown_817776A, 6
	end
