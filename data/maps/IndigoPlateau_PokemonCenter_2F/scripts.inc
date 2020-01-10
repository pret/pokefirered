IndigoPlateau_PokemonCenter_2F_MapScripts:: @ 816EB0F
	map_script MAP_SCRIPT_ON_FRAME_TABLE, CableClub_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, CableClub_OnWarp
	map_script MAP_SCRIPT_ON_LOAD, CableClub_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, CableClub_OnTransition
	.byte 0

@ The below 3 are unused and leftover from RS
IndigoPlateau_PokemonCenter_2F_EventScript_Colosseum:: @ 816EB24
	call CableClub_EventScript_Colosseum
	end

IndigoPlateau_PokemonCenter_2F_EventScript_TradeCenter:: @ 816EB2A
	call CableClub_EventScript_TradeCenter
	end

IndigoPlateau_PokemonCenter_2F_EventScript_RecordCorner:: @ 816EB30
	call CableClub_EventScript_RecordCorner
	end
