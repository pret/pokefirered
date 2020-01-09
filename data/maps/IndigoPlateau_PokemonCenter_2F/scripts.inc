IndigoPlateau_PokemonCenter_2F_MapScripts:: @ 816EB0F
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

IndigoPlateau_PokemonCenter_2F_EventScript_16EB24:: @ 816EB24
	call EventScript_1BB4A3
	end

EventScript_16EB2A:: @ 816EB2A
	call EventScript_1BB6AB
	end

EventScript_16EB30:: @ 816EB30
	call EventScript_1BB7DE
	end
