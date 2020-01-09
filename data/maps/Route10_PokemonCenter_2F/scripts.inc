Route10_PokemonCenter_2F_MapScripts:: @ 816FCFA
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
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
