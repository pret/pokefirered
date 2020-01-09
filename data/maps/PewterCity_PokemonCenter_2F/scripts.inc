PewterCity_PokemonCenter_2F_MapScripts:: @ 816A7B5
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

PewterCity_PokemonCenter_2F_EventScript_16A7CA:: @ 816A7CA
	call EventScript_1BB4A3
	end

EventScript_16A7D0:: @ 816A7D0
	call EventScript_1BB6AB
	end

EventScript_16A7D6:: @ 816A7D6
	call EventScript_1BB7DE
	end
