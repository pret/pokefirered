# 1 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
TwoIsland_PokemonCenter_1F_MapScripts::
# 3 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, TwoIsland_PokemonCenter_1F_OnTransition
# 4 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 5 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	.byte 0
# 6 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"

# 7 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
TwoIsland_PokemonCenter_1F_OnTransition::
# 8 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_TWO_ISLAND
# 9 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	end
# 10 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"

# 11 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
TwoIsland_PokemonCenter_1F_EventScript_Nurse::
# 12 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	lock
# 13 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	faceplayer
# 14 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 15 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	release
# 16 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	end
# 17 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"

# 18 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
TwoIsland_PokemonCenter_1F_EventScript_GBAKid::
# 19 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	msgbox TwoIsland_PokemonCenter_1F_Text_HaveYouVisitedGameCorner, MSGBOX_NPC
# 20 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	end
# 21 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"

# 22 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
TwoIsland_PokemonCenter_1F_EventScript_BugCatcher::
# 23 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	msgbox TwoIsland_PokemonCenter_1F_Text_OldLadyLivesOutOnCape, MSGBOX_NPC
# 24 "data/maps/TwoIsland_PokemonCenter_1F/scripts.pory"
	end
