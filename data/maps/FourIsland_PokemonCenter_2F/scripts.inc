FourIsland_PokemonCenter_2F_MapScripts:: @ 8171C1D
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

@ The below 3 are unused and leftover from RS
FourIsland_PokemonCenter_2F_EventScript_Colosseum:: @ 8171C32
	call CableClub_EventScript_Colosseum
	end

FourIsland_PokemonCenter_2F_EventScript_TradeCenter:: @ 8171C38
	call CableClub_EventScript_TradeCenter
	end

FourIsland_PokemonCenter_2F_EventScript_RecordCorner:: @ 8171C3E
	call CableClub_EventScript_RecordCorner
	end
