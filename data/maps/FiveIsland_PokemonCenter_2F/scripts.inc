FiveIsland_PokemonCenter_2F_MapScripts:: @ 8171D1B
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

@ The below 3 are unused and leftover from RS
FiveIsland_PokemonCenter_2F_EventScript_Colosseum:: @ 8171D30
	call CableClub_EventScript_Colosseum
	end

FiveIsland_PokemonCenter_2F_EventScript_TradeCenter:: @ 8171D36
	call CableClub_EventScript_TradeCenter
	end

FiveIsland_PokemonCenter_2F_EventScript_RecordCorner:: @ 8171D3C
	call CableClub_EventScript_RecordCorner
	end
