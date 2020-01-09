CinnabarIsland_PokemonCenter_2F_MapScripts:: @ 816E9E8
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CinnabarIsland_PokemonCenter_2F_MapScript1_1BB2A3
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CinnabarIsland_PokemonCenter_2F_MapScript2_1BB1ED
	map_script MAP_SCRIPT_ON_LOAD, CinnabarIsland_PokemonCenter_2F_MapScript3_1BB237
	map_script MAP_SCRIPT_ON_TRANSITION, CinnabarIsland_PokemonCenter_2F_MapScript4_1BB1B4
	.byte 0

CinnabarIsland_PokemonCenter_2F_EventScript_16E9FD:: @ 816E9FD
	call EventScript_1BB4A3
	end

EventScript_16EA03:: @ 816EA03
	call EventScript_1BB6AB
	end

EventScript_16EA09:: @ 816EA09
	call EventScript_1BB7DE
	end
