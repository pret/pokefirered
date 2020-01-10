ViridianCity_PokemonCenter_2F_MapScripts:: @ 816A2F3
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

@ The below 3 are unused and leftover from RS
ViridianCity_PokemonCenter_2F_EventScript_Colosseum:: @ 816A308
	call CableClub_EventScript_Colosseum
	end

ViridianCity_PokemonCenter_2F_EventScript_TradeCenter:: @ 816A30E
	call CableClub_EventScript_TradeCenter
	end

ViridianCity_PokemonCenter_2F_EventScript_RecordCorner:: @ 816A314
	call CableClub_EventScript_RecordCorner
	end
