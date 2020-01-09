Route4_PokemonCenter_2F_MapScripts:: @ 816F8D8
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

Route4_PokemonCenter_2F_EventScript_16F8ED:: @ 816F8ED
	call EventScript_1BB4A3
	end

EventScript_16F8F3:: @ 816F8F3
	call EventScript_1BB6AB
	end

EventScript_16F8F9:: @ 816F8F9
	call EventScript_1BB7DE
	end
