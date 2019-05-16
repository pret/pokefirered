PokemonMansion_3F_MapScripts:: @ 81622A1
	map_script 1, PokemonMansion_3F_MapScript1_1622A7
	.byte 0

PokemonMansion_3F_MapScript1_1622A7:: @ 81622A7
	checkflag FLAG_0x26C
	call_if 1, EventScript_1A7E72
	end

PokemonMansion_3F_EventScript_1622B1:: @ 81622B1
	lockall
	setvar VAR_0x8004, 2
	call EventScript_1A7AE2
	playse SE_FU_ZAKU2
	special DrawWholeMapView
	waitse
	releaseall
	end

PokemonMansion_3F_EventScript_1622C5:: @ 81622C5
	msgbox gUnknown_8177685, 3
	end

PokemonMansion_3F_EventScript_1622CE:: @ 81622CE
	trainerbattle 0, 218, 0, Text_1775E7, Text_177602
	msgbox gUnknown_8177608, 6
	end

PokemonMansion_3F_EventScript_1622E5:: @ 81622E5
	trainerbattle 0, 346, 0, Text_177628, Text_177643
	msgbox gUnknown_8177657, 6
	end
