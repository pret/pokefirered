PokemonTower_1F_MapScripts:: @ 8163235
	map_script 3, PokemonTower_1F_MapScript1_16323B
	.byte 0

PokemonTower_1F_MapScript1_16323B:: @ 816323B
	setworldmapflag 2226
	end

PokemonTower_1F_EventScript_16323F:: @ 816323F
	loadword 0, gUnknown_8179CAB
	callstd 2
	end

PokemonTower_1F_EventScript_163248:: @ 8163248
	loadword 0, gUnknown_8179C8C
	callstd 2
	end

PokemonTower_1F_EventScript_163251:: @ 8163251
	loadword 0, gUnknown_8179C41
	callstd 2
	end

PokemonTower_1F_EventScript_16325A:: @ 816325A
	lock
	faceplayer
	checkplayergender
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_163272
	loadword 0, gUnknown_8179BFC
	callstd 4
	release
	end

EventScript_163272:: @ 8163272
	loadword 0, gUnknown_8179BB8
	callstd 4
	release
	end

PokemonTower_1F_EventScript_16327C:: @ 816327C
	loadword 0, gUnknown_8179B7A
	callstd 2
	end
