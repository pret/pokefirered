Route4_PokemonCenter_2F_MapScripts:: @ 816F8D8
	map_script MAP_SCRIPT_ON_FRAME_TABLE, Route4_PokemonCenter_2F_MapScript1_1BB2A3
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, Route4_PokemonCenter_2F_MapScript2_1BB1ED
	map_script MAP_SCRIPT_ON_LOAD, Route4_PokemonCenter_2F_MapScript3_1BB237
	map_script MAP_SCRIPT_ON_TRANSITION, Route4_PokemonCenter_2F_MapScript4_1BB1B4
	.byte 0

Route4_PokemonCenter_2F_EventScript_16F8ED:: @ 816F8ED
	call EventScript_1BB4A3
	end

EventScript_16F8F3:: @ 816F8F3
	call EventScript_1BB6AB
	end

EventScript_16F8F9:: @ 816F8F9
	call EventScript_1BB7DE
	end
