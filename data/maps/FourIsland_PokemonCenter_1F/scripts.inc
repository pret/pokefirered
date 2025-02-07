# 1 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
FourIsland_PokemonCenter_1F_MapScripts::
# 3 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, FourIsland_PokemonCenter_1F_OnTransition
# 4 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 5 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	.byte 0
# 6 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"

# 7 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
FourIsland_PokemonCenter_1F_OnTransition::
# 8 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_FOUR_ISLAND
# 9 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	end
# 10 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"

# 11 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
FourIsland_PokemonCenter_1F_EventScript_Nurse::
# 12 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	lock
# 13 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	faceplayer
# 14 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 15 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	release
# 16 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	end
# 17 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"

# 18 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
FourIsland_PokemonCenter_1F_EventScript_Man::
# 19 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	msgbox FourIsland_PokemonCenter_1F_Text_RareIceMonsInCave, MSGBOX_NPC
# 20 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	end
# 21 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"

# 22 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
FourIsland_PokemonCenter_1F_EventScript_Woman::
# 23 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	msgbox FourIsland_PokemonCenter_1F_Text_DayCarePeopleFoundEggBefore, MSGBOX_NPC
# 24 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	end
# 25 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"

# 26 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
FourIsland_PokemonCenter_1F_EventScript_Gentleman::
# 27 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	msgbox FourIsland_PokemonCenter_1F_Text_NewPokemonJournalHasntArrived, MSGBOX_NPC
# 28 "data/maps/FourIsland_PokemonCenter_1F/scripts.pory"
	end
