Route10_PokemonCenter_2F_MapScripts:: @ 816FCFA
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

@ The below 3 are unused and leftover from RS
Route10_PokemonCenter_2F_EventScript_Colosseum:: @ 816FD0F
	call CableClub_EventScript_Colosseum
	end

Route10_PokemonCenter_2F_EventScript_TradeCenter:: @ 816FD15
	call CableClub_EventScript_TradeCenter
	end

Route10_PokemonCenter_2F_EventScript_RecordCorner:: @ 816FD1B
	call CableClub_EventScript_RecordCorner
	end
