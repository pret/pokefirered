PokemonMansion_1F_MapScripts:: @ 81621F9
	map_script MAP_SCRIPT_ON_LOAD, PokemonMansion_1F_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, PokemonMansion_1F_OnTransition
	.byte 0

PokemonMansion_1F_OnLoad:: @ 8162204
	call_if_set FLAG_POKEMON_MANSION_SWITCH_STATE, EventScript_1A7B7A
	end

PokemonMansion_1F_OnTransition:: @ 816220E
	setworldmapflag FLAG_WORLD_MAP_POKEMON_MANSION_1F
	end

PokemonMansion_1F_EventScript_162212:: @ 8162212
	lockall
	setvar VAR_0x8004, 0
	call EventScript_1A7AE2
	playse SE_KI_GASYAN
	special DrawWholeMapView
	waitse
	releaseall
	end

PokemonMansion_1F_EventScript_162226:: @ 8162226
	trainerbattle_single TRAINER_SCIENTIST_TED, Text_177364, Text_177391
	msgbox gUnknown_8177397, MSGBOX_AUTOCLOSE
	end

PokemonMansion_1F_EventScript_16223D:: @ 816223D
	trainerbattle_single TRAINER_YOUNGSTER_JOHNSON, Text_1773C6, Text_1773FD
	msgbox gUnknown_8177418, MSGBOX_AUTOCLOSE
	end
