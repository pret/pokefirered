LavenderTown_PokemonCenter_1F_MapScripts:: @ 816B0EF
	map_script MAP_SCRIPT_ON_TRANSITION, LavenderTown_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, LavenderTown_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

LavenderTown_PokemonCenter_1F_OnTransition:: @ 816B0FA
	setrespawn SPAWN_LAVENDER_TOWN
	end

LavenderTown_PokemonCenter_1F_EventScript_16B0FE:: @ 816B0FE
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

LavenderTown_PokemonCenter_1F_EventScript_16B107:: @ 816B107
	msgbox gUnknown_8193465, MSGBOX_NPC
	end

LavenderTown_PokemonCenter_1F_EventScript_16B110:: @ 816B110
	msgbox gUnknown_81934DE, MSGBOX_NPC
	end

LavenderTown_PokemonCenter_1F_EventScript_16B119:: @ 816B119
	msgbox gUnknown_819353A, MSGBOX_NPC
	end
