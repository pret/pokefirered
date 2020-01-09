ViridianCity_PokemonCenter_2F_MapScripts:: @ 816A2F3
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

ViridianCity_PokemonCenter_2F_EventScript_16A308:: @ 816A308
	call EventScript_1BB4A3
	end

EventScript_16A30E:: @ 816A30E
	call EventScript_1BB6AB
	end

EventScript_16A314:: @ 816A314
	call EventScript_1BB7DE
	end
