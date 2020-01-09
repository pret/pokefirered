SaffronCity_PokemonCenter_2F_MapScripts:: @ 816F037
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

SaffronCity_PokemonCenter_2F_EventScript_16F04C:: @ 816F04C
	call EventScript_1BB4A3
	end

EventScript_16F052:: @ 816F052
	call EventScript_1BB6AB
	end

EventScript_16F058:: @ 816F058
	call EventScript_1BB7DE
	end
