Route10_PokemonCenter_2F_MapScripts:: @ 816FCFA
	map_script MAP_SCRIPT_ON_FRAME_TABLE, Route10_PokemonCenter_2F_MapScript1_1BB2A3
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, Route10_PokemonCenter_2F_MapScript2_1BB1ED
	map_script MAP_SCRIPT_ON_LOAD, Route10_PokemonCenter_2F_MapScript3_1BB237
	map_script MAP_SCRIPT_ON_TRANSITION, Route10_PokemonCenter_2F_MapScript4_1BB1B4
	.byte 0

Route10_PokemonCenter_2F_EventScript_16FD0F:: @ 816FD0F
	call EventScript_1BB4A3
	end

EventScript_16FD15:: @ 816FD15
	call EventScript_1BB6AB
	end

EventScript_16FD1B:: @ 816FD1B
	call EventScript_1BB7DE
	end
