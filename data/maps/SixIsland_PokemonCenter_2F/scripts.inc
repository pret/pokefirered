SixIsland_PokemonCenter_2F_MapScripts:: @ 8171E20
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

SixIsland_PokemonCenter_2F_EventScript_171E35:: @ 8171E35
	call EventScript_1BB4A3
	end

EventScript_171E3B:: @ 8171E3B
	call EventScript_1BB6AB
	end

EventScript_171E41:: @ 8171E41
	call EventScript_1BB7DE
	end
