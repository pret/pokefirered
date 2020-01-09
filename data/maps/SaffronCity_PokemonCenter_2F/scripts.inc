SaffronCity_PokemonCenter_2F_MapScripts:: @ 816F037
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SaffronCity_PokemonCenter_2F_MapScript1_1BB2A3
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, SaffronCity_PokemonCenter_2F_MapScript2_1BB1ED
	map_script MAP_SCRIPT_ON_LOAD, SaffronCity_PokemonCenter_2F_MapScript3_1BB237
	map_script MAP_SCRIPT_ON_TRANSITION, SaffronCity_PokemonCenter_2F_MapScript4_1BB1B4
	.byte 0

SaffronCity_PokemonCenter_2F_EventScript_16F04C:: @ 816F04C
	call EventScript_1BB4A3
	end

EventScript_16F052:: @ 816F052
	call EventScript_1BB6AB
	end

EventScript_16F058:: @ 816F058
	call EventScript_1BB7DE
	end
