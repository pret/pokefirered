# 1 "data/maps/PokemonMansion_2F/scripts.pory"

# 2 "data/maps/PokemonMansion_2F/scripts.pory"
PokemonMansion_2F_MapScripts::
# 3 "data/maps/PokemonMansion_2F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, PokemonMansion_2F_OnLoad
# 4 "data/maps/PokemonMansion_2F/scripts.pory"
	.byte 0
# 5 "data/maps/PokemonMansion_2F/scripts.pory"

# 6 "data/maps/PokemonMansion_2F/scripts.pory"
PokemonMansion_2F_OnLoad::
# 7 "data/maps/PokemonMansion_2F/scripts.pory"
	call_if_set FLAG_POKEMON_MANSION_SWITCH_STATE, PokemonMansion_EventScript_PressSwitch_2F
# 8 "data/maps/PokemonMansion_2F/scripts.pory"
	end
# 9 "data/maps/PokemonMansion_2F/scripts.pory"

# 10 "data/maps/PokemonMansion_2F/scripts.pory"
PokemonMansion_2F_EventScript_Statue::
# 11 "data/maps/PokemonMansion_2F/scripts.pory"
	lockall
# 12 "data/maps/PokemonMansion_2F/scripts.pory"
	setvar VAR_0x8004, 1
# 13 "data/maps/PokemonMansion_2F/scripts.pory"
	call PokemonMansion_EventScript_SecretSwitch
# 14 "data/maps/PokemonMansion_2F/scripts.pory"
	playse SE_UNLOCK
# 15 "data/maps/PokemonMansion_2F/scripts.pory"
	special DrawWholeMapView
# 16 "data/maps/PokemonMansion_2F/scripts.pory"
	waitse
# 17 "data/maps/PokemonMansion_2F/scripts.pory"
	releaseall
# 18 "data/maps/PokemonMansion_2F/scripts.pory"
	end
# 19 "data/maps/PokemonMansion_2F/scripts.pory"

# 20 "data/maps/PokemonMansion_2F/scripts.pory"
PokemonMansion_2F_EventScript_DiaryJuly5th::
# 21 "data/maps/PokemonMansion_2F/scripts.pory"
	msgbox PokemonMansion_1F_Text_NewMonDiscoveredInGuyanaJungle, MSGBOX_SIGN
# 22 "data/maps/PokemonMansion_2F/scripts.pory"
	end
# 23 "data/maps/PokemonMansion_2F/scripts.pory"

# 24 "data/maps/PokemonMansion_2F/scripts.pory"
PokemonMansion_2F_EventScript_DiaryJuly10th::
# 25 "data/maps/PokemonMansion_2F/scripts.pory"
	msgbox PokemonMansion_1F_Text_ChristenedDiscoveredMonMew, MSGBOX_SIGN
# 26 "data/maps/PokemonMansion_2F/scripts.pory"
	end
# 27 "data/maps/PokemonMansion_2F/scripts.pory"

# 28 "data/maps/PokemonMansion_2F/scripts.pory"
PokemonMansion_2F_EventScript_Arnie::
# 29 "data/maps/PokemonMansion_2F/scripts.pory"
	trainerbattle_single TRAINER_BURGLAR_ARNIE, PokemonMansion_1F_Text_ArnieIntro, PokemonMansion_1F_Text_ArnieDefeat
# 30 "data/maps/PokemonMansion_2F/scripts.pory"
	msgbox PokemonMansion_1F_Text_ArniePostBattle, MSGBOX_AUTOCLOSE
# 31 "data/maps/PokemonMansion_2F/scripts.pory"
	end
