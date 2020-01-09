VermilionCity_PokemonCenter_2F_MapScripts:: @ 816B457
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

VermilionCity_PokemonCenter_2F_EventScript_16B46C:: @ 816B46C
	call EventScript_1BB4A3
	end

EventScript_16B472:: @ 816B472
	call EventScript_1BB6AB
	end

EventScript_16B478:: @ 816B478
	call EventScript_1BB7DE
	end
