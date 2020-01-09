PewterCity_PokemonCenter_2F_MapScripts:: @ 816A7B5
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PewterCity_PokemonCenter_2F_MapScript1_1BB2A3
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PewterCity_PokemonCenter_2F_MapScript2_1BB1ED
	map_script MAP_SCRIPT_ON_LOAD, PewterCity_PokemonCenter_2F_MapScript3_1BB237
	map_script MAP_SCRIPT_ON_TRANSITION, PewterCity_PokemonCenter_2F_MapScript4_1BB1B4
	.byte 0

PewterCity_PokemonCenter_2F_EventScript_16A7CA:: @ 816A7CA
	call EventScript_1BB4A3
	end

EventScript_16A7D0:: @ 816A7D0
	call EventScript_1BB6AB
	end

EventScript_16A7D6:: @ 816A7D6
	call EventScript_1BB7DE
	end
