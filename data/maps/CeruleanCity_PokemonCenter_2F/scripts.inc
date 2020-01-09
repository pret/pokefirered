CeruleanCity_PokemonCenter_2F_MapScripts:: @ 816AA79
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

CeruleanCity_PokemonCenter_2F_EventScript_16AA8E:: @ 816AA8E
	call EventScript_1BB4A3
	end

EventScript_16AA94:: @ 816AA94
	call EventScript_1BB6AB
	end

EventScript_16AA9A:: @ 816AA9A
	call EventScript_1BB7DE
	end
