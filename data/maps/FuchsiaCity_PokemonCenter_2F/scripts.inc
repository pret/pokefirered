FuchsiaCity_PokemonCenter_2F_MapScripts:: @ 816D724
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

FuchsiaCity_PokemonCenter_2F_EventScript_16D739:: @ 816D739
	call EventScript_1BB4A3
	end

EventScript_16D73F:: @ 816D73F
	call EventScript_1BB6AB
	end

EventScript_16D745:: @ 816D745
	call EventScript_1BB7DE
	end
