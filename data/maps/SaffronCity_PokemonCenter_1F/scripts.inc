# 1 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
SaffronCity_PokemonCenter_1F_MapScripts::
# 3 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SaffronCity_PokemonCenter_1F_OnTransition
# 4 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 5 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	.byte 0
# 6 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"

# 7 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
SaffronCity_PokemonCenter_1F_OnTransition::
# 8 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_SAFFRON_CITY
# 9 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	end
# 10 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"

# 11 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
SaffronCity_PokemonCenter_1F_EventScript_Nurse::
# 12 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	lock
# 13 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	faceplayer
# 14 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 15 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	release
# 16 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	end
# 17 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"

# 18 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
SaffronCity_PokemonCenter_1F_EventScript_Gentleman::
# 19 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	msgbox SaffronCity_PokemonCenter_1F_Text_SilphCoVictimOfFame, MSGBOX_NPC
# 20 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	end
# 21 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"

# 22 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
SaffronCity_PokemonCenter_1F_EventScript_Woman::
# 23 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	msgbox SaffronCity_PokemonCenter_1F_Text_GrowthRatesDifferBySpecies, MSGBOX_NPC
# 24 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	end
# 25 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"

# 26 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
SaffronCity_PokemonCenter_1F_EventScript_Youngster::
# 27 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	lock
# 28 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	faceplayer
# 29 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_SILPH_CO_11F, 1, SaffronCity_PokemonCenter_1F_EventScript_YoungsterRocketsGone
# 30 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	msgbox SaffronCity_PokemonCenter_1F_Text_GreatIfEliteFourCameBeatRockets
# 31 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	release
# 32 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	end
# 33 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"

# 34 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
SaffronCity_PokemonCenter_1F_EventScript_YoungsterRocketsGone::
# 35 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	msgbox SaffronCity_PokemonCenter_1F_Text_TeamRocketTookOff
# 36 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	release
# 37 "data/maps/SaffronCity_PokemonCenter_1F/scripts.pory"
	end
