# 1 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
FuchsiaCity_PokemonCenter_1F_MapScripts::
# 3 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, FuchsiaCity_PokemonCenter_1F_OnTransition
# 4 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 5 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	.byte 0
# 6 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"

# 7 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
FuchsiaCity_PokemonCenter_1F_OnTransition::
# 8 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_FUCHSIA_CITY
# 9 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	end
# 10 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"

# 11 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
FuchsiaCity_PokemonCenter_1F_EventScript_Nurse::
# 12 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	lock
# 13 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	faceplayer
# 14 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 15 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	release
# 16 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	end
# 17 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"

# 18 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
FuchsiaCity_PokemonCenter_1F_EventScript_Man::
# 19 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	msgbox FuchsiaCity_PokemonCenter_1F_Text_CantBecomeGoodTrainerWithOneMon, MSGBOX_NPC
# 20 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	end
# 21 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"

# 22 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
FuchsiaCity_PokemonCenter_1F_EventScript_CooltrainerF::
# 23 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	msgbox FuchsiaCity_PokemonCenter_1F_Text_PokemonLeagueWestOfViridian, MSGBOX_NPC
# 24 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	end
# 25 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"

# 26 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
FuchsiaCity_PokemonCenter_1F_EventScript_Youngster::
# 27 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	msgbox FuchsiaCity_PokemonCenter_1F_Text_VisitSafariZoneForPokedex, MSGBOX_NPC
# 28 "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.pory"
	end
