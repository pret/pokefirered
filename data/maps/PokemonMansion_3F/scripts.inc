PokemonMansion_3F_MapScripts:: @ 81622A1
	map_script MAP_SCRIPT_ON_LOAD, PokemonMansion_3F_OnLoad
	.byte 0

PokemonMansion_3F_OnLoad:: @ 81622A7
	call_if_set FLAG_POKEMON_MANSION_SWITCH_STATE, EventScript_1A7E72
	end

PokemonMansion_3F_EventScript_1622B1:: @ 81622B1
	lockall
	setvar VAR_0x8004, 2
	call EventScript_1A7AE2
	playse SE_KI_GASYAN
	special DrawWholeMapView
	waitse
	releaseall
	end

PokemonMansion_3F_EventScript_1622C5:: @ 81622C5
	msgbox gUnknown_8177685, MSGBOX_SIGN
	end

PokemonMansion_3F_EventScript_1622CE:: @ 81622CE
	trainerbattle_single TRAINER_BURGLAR_SIMON, Text_1775E7, Text_177602
	msgbox gUnknown_8177608, MSGBOX_AUTOCLOSE
	end

PokemonMansion_3F_EventScript_1622E5:: @ 81622E5
	trainerbattle_single TRAINER_SCIENTIST_BRAYDON, Text_177628, Text_177643
	msgbox gUnknown_8177657, MSGBOX_AUTOCLOSE
	end
