SaffronCity_PokemonCenter_1F_MapScripts:: @ 816EFEC
	map_script MAP_SCRIPT_ON_TRANSITION, SaffronCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

SaffronCity_PokemonCenter_1F_OnTransition:: @ 816EFF7
	setrespawn SPAWN_SAFFRON_CITY
	end

SaffronCity_PokemonCenter_1F_EventScript_Nurse:: @ 816EFFB
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

SaffronCity_PokemonCenter_1F_EventScript_Gentleman:: @ 816F004
	msgbox SaffronCity_PokemonCenter_1F_Text_SilphCoVictimOfFame, MSGBOX_NPC
	end

SaffronCity_PokemonCenter_1F_EventScript_Woman:: @ 816F00D
	msgbox SaffronCity_PokemonCenter_1F_Text_GrowthRatesDifferBySpecies, MSGBOX_NPC
	end

SaffronCity_PokemonCenter_1F_EventScript_Youngster:: @ 816F016
	lock
	faceplayer
	compare VAR_MAP_SCENE_SILPH_CO_11F, 1
	goto_if_eq SaffronCity_PokemonCenter_1F_EventScript_YoungsterRocketsGone
	msgbox SaffronCity_PokemonCenter_1F_Text_GreatIfEliteFourCameBeatRockets
	release
	end

SaffronCity_PokemonCenter_1F_EventScript_YoungsterRocketsGone:: @ 816F02D
	msgbox SaffronCity_PokemonCenter_1F_Text_TeamRocketTookOff
	release
	end
