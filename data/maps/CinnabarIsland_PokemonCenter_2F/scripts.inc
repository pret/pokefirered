CinnabarIsland_PokemonCenter_2F_MapScripts:: @ 816E9E8
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
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
