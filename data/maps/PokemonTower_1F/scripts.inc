PokemonTower_1F_MapScripts:: @ 8163235
	map_script MAP_SCRIPT_ON_TRANSITION, PokemonTower_1F_OnTransition
	.byte 0

PokemonTower_1F_OnTransition:: @ 816323B
	setworldmapflag FLAG_WORLD_MAP_POKEMON_TOWER_1F
	end

PokemonTower_1F_EventScript_16323F:: @ 816323F
	msgbox gUnknown_8179CAB, 2
	end

PokemonTower_1F_EventScript_163248:: @ 8163248
	msgbox gUnknown_8179C8C, 2
	end

PokemonTower_1F_EventScript_163251:: @ 8163251
	msgbox gUnknown_8179C41, 2
	end

PokemonTower_1F_EventScript_16325A:: @ 816325A
	lock
	faceplayer
	checkplayergender
	compare VAR_RESULT, 0
	goto_if eq, EventScript_163272
	msgbox gUnknown_8179BFC
	release
	end

EventScript_163272:: @ 8163272
	msgbox gUnknown_8179BB8
	release
	end

PokemonTower_1F_EventScript_16327C:: @ 816327C
	msgbox gUnknown_8179B7A, 2
	end
