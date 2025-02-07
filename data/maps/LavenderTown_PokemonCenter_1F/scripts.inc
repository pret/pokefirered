# 1 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
LavenderTown_PokemonCenter_1F_MapScripts::
# 3 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, LavenderTown_PokemonCenter_1F_OnTransition
# 4 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 5 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	.byte 0
# 6 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"

# 7 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
LavenderTown_PokemonCenter_1F_OnTransition::
# 8 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_LAVENDER_TOWN
# 9 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	end
# 10 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"

# 11 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
LavenderTown_PokemonCenter_1F_EventScript_Nurse::
# 12 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	lock
# 13 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	faceplayer
# 14 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 15 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	release
# 16 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	end
# 17 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"

# 18 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
LavenderTown_PokemonCenter_1F_EventScript_Gentleman::
# 19 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	msgbox LavenderTown_PokemonCenter_1F_Text_RocketsDoAnythingForMoney, MSGBOX_NPC
# 20 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	end
# 21 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"

# 22 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
LavenderTown_PokemonCenter_1F_EventScript_Lass::
# 23 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	msgbox LavenderTown_PokemonCenter_1F_Text_CubonesMotherKilledByRockets, MSGBOX_NPC
# 24 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	end
# 25 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"

# 26 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
LavenderTown_PokemonCenter_1F_EventScript_Youngster::
# 27 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	msgbox LavenderTown_PokemonCenter_1F_Text_PeoplePayForCuboneSkulls, MSGBOX_NPC
# 28 "data/maps/LavenderTown_PokemonCenter_1F/scripts.pory"
	end
