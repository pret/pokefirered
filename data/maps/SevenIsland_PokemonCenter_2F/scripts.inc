SevenIsland_PokemonCenter_2F_MapScripts:: @ 8170BBC
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SevenIsland_PokemonCenter_2F_MapScript1_1BB2A3
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, SevenIsland_PokemonCenter_2F_MapScript2_1BB1ED
	map_script MAP_SCRIPT_ON_LOAD, SevenIsland_PokemonCenter_2F_MapScript3_1BB237
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_PokemonCenter_2F_MapScript4_1BB1B4
	.byte 0

SevenIsland_PokemonCenter_2F_EventScript_170BD1:: @ 8170BD1
	call EventScript_1BB4A3
	end

EventScript_170BD7:: @ 8170BD7
	call EventScript_1BB6AB
	end

EventScript_170BDD:: @ 8170BDD
	call EventScript_1BB7DE
	end
