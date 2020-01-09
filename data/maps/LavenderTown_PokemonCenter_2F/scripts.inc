LavenderTown_PokemonCenter_2F_MapScripts:: @ 816B122
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

LavenderTown_PokemonCenter_2F_EventScript_16B137:: @ 816B137
	call EventScript_1BB4A3
	end

EventScript_16B13D:: @ 816B13D
	call EventScript_1BB6AB
	end

EventScript_16B143:: @ 816B143
	call EventScript_1BB7DE
	end
