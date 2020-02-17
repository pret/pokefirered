ViridianCity_PokemonCenter_1F_MapScripts:: @ 816A2C0
	map_script MAP_SCRIPT_ON_TRANSITION, ViridianCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

ViridianCity_PokemonCenter_1F_OnTransition:: @ 816A2CB
	setrespawn SPAWN_VIRIDIAN_CITY
	end

ViridianCity_PokemonCenter_1F_EventScript_Nurse:: @ 816A2CF
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

ViridianCity_PokemonCenter_1F_EventScript_Boy:: @ 816A2D8
	msgbox ViridianCity_PokemonCenter_1F_Text_PokeCenterInEveryTown, MSGBOX_NPC
	end

ViridianCity_PokemonCenter_1F_EventScript_Gentleman:: @ 816A2E1
	msgbox ViridianCity_PokemonCenter_1F_Text_FeelFreeToUsePC, MSGBOX_NPC
	end

ViridianCity_PokemonCenter_1F_EventScript_Youngster:: @ 816A2EA
	msgbox ViridianCity_PokemonCenter_1F_Text_PokeCentersHealMons, MSGBOX_NPC
	end
