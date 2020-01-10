PokemonMansion_B1F_MapScripts:: @ 81622FC
	map_script MAP_SCRIPT_ON_LOAD, PokemonMansion_B1F_OnLoad
	.byte 0

PokemonMansion_B1F_OnLoad:: @ 8162302
	call_if_set FLAG_POKEMON_MANSION_SWITCH_STATE, EventScript_1A7F4C
	end

PokemonMansion_B1F_EventScript_16230C:: @ 816230C
	lockall
	setvar VAR_0x8004, 3
	call EventScript_1A7AE2
	playse SE_KI_GASYAN
	special DrawWholeMapView
	waitse
	releaseall
	end

PokemonMansion_B1F_EventScript_162320:: @ 8162320
	msgbox gUnknown_8177798, 3
	end

PokemonMansion_B1F_EventScript_162329:: @ 8162329
	trainerbattle_single TRAINER_BURGLAR_LEWIS, Text_1776C0, Text_1776D7
	msgbox gUnknown_81776DE, 6
	end

PokemonMansion_B1F_EventScript_162340:: @ 8162340
	trainerbattle_single TRAINER_SCIENTIST_IVAN, Text_177720, Text_177757
	msgbox gUnknown_817776A, 6
	end
