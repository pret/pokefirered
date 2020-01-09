CeruleanCity_PokemonCenter_2F_MapScripts:: @ 816AA79
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CeruleanCity_PokemonCenter_2F_MapScript1_1BB2A3
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CeruleanCity_PokemonCenter_2F_MapScript2_1BB1ED
	map_script MAP_SCRIPT_ON_LOAD, CeruleanCity_PokemonCenter_2F_MapScript3_1BB237
	map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCity_PokemonCenter_2F_MapScript4_1BB1B4
	.byte 0

CeruleanCity_PokemonCenter_2F_EventScript_16AA8E:: @ 816AA8E
	call EventScript_1BB4A3
	end

EventScript_16AA94:: @ 816AA94
	call EventScript_1BB6AB
	end

EventScript_16AA9A:: @ 816AA9A
	call EventScript_1BB7DE
	end
