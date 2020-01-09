FourIsland_PokemonCenter_2F_MapScripts:: @ 8171C1D
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

FourIsland_PokemonCenter_2F_EventScript_171C32:: @ 8171C32
	call EventScript_1BB4A3
	end

EventScript_171C38:: @ 8171C38
	call EventScript_1BB6AB
	end

EventScript_171C3E:: @ 8171C3E
	call EventScript_1BB7DE
	end
