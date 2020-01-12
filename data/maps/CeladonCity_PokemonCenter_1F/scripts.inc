CeladonCity_PokemonCenter_1F_MapScripts:: @ 816C5EC
	map_script MAP_SCRIPT_ON_TRANSITION, CeladonCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

CeladonCity_PokemonCenter_1F_OnTransition:: @ 816C5F7
	setrespawn SPAWN_CELADON_CITY
	end

CeladonCity_PokemonCenter_1F_EventScript_16C5FB:: @ 816C5FB
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

CeladonCity_PokemonCenter_1F_EventScript_16C604:: @ 816C604
	msgbox gUnknown_819685B, MSGBOX_NPC
	end

CeladonCity_PokemonCenter_1F_EventScript_16C60D:: @ 816C60D
	msgbox gUnknown_81968C2, MSGBOX_NPC
	end

CeladonCity_PokemonCenter_1F_EventScript_16C616:: @ 816C616
	msgbox gUnknown_8196913, MSGBOX_NPC
	end
