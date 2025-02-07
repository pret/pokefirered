# 1 "data/maps/PokemonMansion_B1F/scripts.pory"

# 2 "data/maps/PokemonMansion_B1F/scripts.pory"
PokemonMansion_B1F_MapScripts::
# 3 "data/maps/PokemonMansion_B1F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, PokemonMansion_B1F_OnLoad
# 4 "data/maps/PokemonMansion_B1F/scripts.pory"
	.byte 0
# 5 "data/maps/PokemonMansion_B1F/scripts.pory"

# 6 "data/maps/PokemonMansion_B1F/scripts.pory"
PokemonMansion_B1F_OnLoad::
# 7 "data/maps/PokemonMansion_B1F/scripts.pory"
	call_if_set FLAG_POKEMON_MANSION_SWITCH_STATE, PokemonMansion_EventScript_PressSwitch_B1F
# 8 "data/maps/PokemonMansion_B1F/scripts.pory"
	end
# 9 "data/maps/PokemonMansion_B1F/scripts.pory"

# 10 "data/maps/PokemonMansion_B1F/scripts.pory"
PokemonMansion_B1F_EventScript_Statue::
# 11 "data/maps/PokemonMansion_B1F/scripts.pory"
	lockall
# 12 "data/maps/PokemonMansion_B1F/scripts.pory"
	setvar VAR_0x8004, 3
# 13 "data/maps/PokemonMansion_B1F/scripts.pory"
	call PokemonMansion_EventScript_SecretSwitch
# 14 "data/maps/PokemonMansion_B1F/scripts.pory"
	playse SE_UNLOCK
# 15 "data/maps/PokemonMansion_B1F/scripts.pory"
	special DrawWholeMapView
# 16 "data/maps/PokemonMansion_B1F/scripts.pory"
	waitse
# 17 "data/maps/PokemonMansion_B1F/scripts.pory"
	releaseall
# 18 "data/maps/PokemonMansion_B1F/scripts.pory"
	end
# 19 "data/maps/PokemonMansion_B1F/scripts.pory"

# 20 "data/maps/PokemonMansion_B1F/scripts.pory"
PokemonMansion_B1F_EventScript_DiarySep1st::
# 21 "data/maps/PokemonMansion_B1F/scripts.pory"
	msgbox PokemonMansion_B1F_Text_MewtwoIsFarTooPowerful, MSGBOX_SIGN
# 22 "data/maps/PokemonMansion_B1F/scripts.pory"
	end
# 23 "data/maps/PokemonMansion_B1F/scripts.pory"

# 24 "data/maps/PokemonMansion_B1F/scripts.pory"
PokemonMansion_B1F_EventScript_Lewis::
# 25 "data/maps/PokemonMansion_B1F/scripts.pory"
	trainerbattle_single TRAINER_BURGLAR_LEWIS, PokemonMansion_B1F_Text_LewisIntro, PokemonMansion_B1F_Text_LewisDefeat
# 26 "data/maps/PokemonMansion_B1F/scripts.pory"
	msgbox PokemonMansion_B1F_Text_LewisPostBattle, MSGBOX_AUTOCLOSE
# 27 "data/maps/PokemonMansion_B1F/scripts.pory"
	end
# 28 "data/maps/PokemonMansion_B1F/scripts.pory"

# 29 "data/maps/PokemonMansion_B1F/scripts.pory"
PokemonMansion_B1F_EventScript_Ivan::
# 30 "data/maps/PokemonMansion_B1F/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_IVAN, PokemonMansion_B1F_Text_IvanIntro, PokemonMansion_B1F_Text_IvanDefeat
# 31 "data/maps/PokemonMansion_B1F/scripts.pory"
	msgbox PokemonMansion_B1F_Text_IvanPostBattle, MSGBOX_AUTOCLOSE
# 32 "data/maps/PokemonMansion_B1F/scripts.pory"
	end
