VermilionCity_PokemonCenter_2F_MapScripts:: @ 816B457
	map_script MAP_SCRIPT_ON_FRAME_TABLE, VermilionCity_PokemonCenter_2F_MapScript1_1BB2A3
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, VermilionCity_PokemonCenter_2F_MapScript2_1BB1ED
	map_script MAP_SCRIPT_ON_LOAD, VermilionCity_PokemonCenter_2F_MapScript3_1BB237
	map_script MAP_SCRIPT_ON_TRANSITION, VermilionCity_PokemonCenter_2F_MapScript4_1BB1B4
	.byte 0

VermilionCity_PokemonCenter_2F_EventScript_16B46C:: @ 816B46C
	call EventScript_1BB4A3
	end

EventScript_16B472:: @ 816B472
	call EventScript_1BB6AB
	end

EventScript_16B478:: @ 816B478
	call EventScript_1BB7DE
	end
