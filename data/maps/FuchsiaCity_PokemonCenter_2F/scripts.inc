FuchsiaCity_PokemonCenter_2F_MapScripts:: @ 816D724
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

@ The below 3 are unused and leftover from RS
FuchsiaCity_PokemonCenter_2F_EventScript_Colosseum:: @ 816D739
	call CableClub_EventScript_Colosseum
	end

FuchsiaCity_PokemonCenter_2F_EventScript_TradeCenter:: @ 816D73F
	call CableClub_EventScript_TradeCenter
	end

FuchsiaCity_PokemonCenter_2F_EventScript_RecordCorner:: @ 816D745
	call CableClub_EventScript_RecordCorner
	end
