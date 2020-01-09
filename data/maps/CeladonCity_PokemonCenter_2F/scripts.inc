CeladonCity_PokemonCenter_2F_MapScripts:: @ 816C61F
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

CeladonCity_PokemonCenter_2F_EventScript_16C634:: @ 816C634
	call EventScript_1BB4A3
	end

EventScript_16C63A:: @ 816C63A
	call EventScript_1BB6AB
	end

EventScript_16C640:: @ 816C640
	call EventScript_1BB7DE
	end
