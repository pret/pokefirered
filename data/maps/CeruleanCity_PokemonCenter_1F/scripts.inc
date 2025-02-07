# 1 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
CeruleanCity_PokemonCenter_1F_MapScripts::
# 3 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCity_PokemonCenter_1F_OnTransition
# 4 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 5 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	.byte 0
# 6 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"

# 7 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
CeruleanCity_PokemonCenter_1F_OnTransition::
# 8 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_CERULEAN_CITY
# 9 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	end
# 10 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"

# 11 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
CeruleanCity_PokemonCenter_1F_EventScript_Nurse::
# 12 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	lock
# 13 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	faceplayer
# 14 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 15 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	release
# 16 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	end
# 17 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"

# 18 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
CeruleanCity_PokemonCenter_1F_EventScript_Gentleman::
# 19 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	msgbox CeruleanCity_PokemonCenter_1F_Text_EveryoneCallsBillPokemaniac, MSGBOX_NPC
# 20 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	end
# 21 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"

# 22 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
CeruleanCity_PokemonCenter_1F_EventScript_Rocker::
# 23 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	msgbox CeruleanCity_PokemonCenter_1F_Text_BillDoesWhateverForRareMons, MSGBOX_NPC
# 24 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	end
# 25 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"

# 26 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
CeruleanCity_PokemonCenter_1F_EventScript_Youngster::
# 27 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	lock
# 28 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	faceplayer
# 29 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	famechecker FAMECHECKER_BILL, 1
# 30 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	msgbox CeruleanCity_PokemonCenter_1F_Text_BillCollectsRareMons
# 31 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	release
# 32 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	end
# 33 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"

# 34 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
CeruleanCity_PokemonCenter_1F_EventScript_Lass::
# 35 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	msgbox CeruleanCity_PokemonCenter_1F_Text_TryTradingUpstairs, MSGBOX_NPC
# 36 "data/maps/CeruleanCity_PokemonCenter_1F/scripts.pory"
	end
