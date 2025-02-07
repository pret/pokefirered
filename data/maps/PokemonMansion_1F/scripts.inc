# 1 "data/maps/PokemonMansion_1F/scripts.pory"

# 2 "data/maps/PokemonMansion_1F/scripts.pory"
PokemonMansion_1F_MapScripts::
# 3 "data/maps/PokemonMansion_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, PokemonMansion_1F_OnLoad
# 4 "data/maps/PokemonMansion_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, PokemonMansion_1F_OnTransition
# 5 "data/maps/PokemonMansion_1F/scripts.pory"
	.byte 0
# 6 "data/maps/PokemonMansion_1F/scripts.pory"

# 7 "data/maps/PokemonMansion_1F/scripts.pory"
PokemonMansion_1F_OnLoad::
# 8 "data/maps/PokemonMansion_1F/scripts.pory"
	call_if_set FLAG_POKEMON_MANSION_SWITCH_STATE, PokemonMansion_EventScript_PressSwitch_1F
# 9 "data/maps/PokemonMansion_1F/scripts.pory"
	end
# 10 "data/maps/PokemonMansion_1F/scripts.pory"

# 11 "data/maps/PokemonMansion_1F/scripts.pory"
PokemonMansion_1F_OnTransition::
# 12 "data/maps/PokemonMansion_1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_POKEMON_MANSION_1F
# 13 "data/maps/PokemonMansion_1F/scripts.pory"
	end
# 14 "data/maps/PokemonMansion_1F/scripts.pory"

# 15 "data/maps/PokemonMansion_1F/scripts.pory"
PokemonMansion_1F_EventScript_Statue::
# 16 "data/maps/PokemonMansion_1F/scripts.pory"
	lockall
# 17 "data/maps/PokemonMansion_1F/scripts.pory"
	setvar VAR_0x8004, 0
# 18 "data/maps/PokemonMansion_1F/scripts.pory"
	call PokemonMansion_EventScript_SecretSwitch
# 19 "data/maps/PokemonMansion_1F/scripts.pory"
	playse SE_UNLOCK
# 20 "data/maps/PokemonMansion_1F/scripts.pory"
	special DrawWholeMapView
# 21 "data/maps/PokemonMansion_1F/scripts.pory"
	waitse
# 22 "data/maps/PokemonMansion_1F/scripts.pory"
	releaseall
# 23 "data/maps/PokemonMansion_1F/scripts.pory"
	end
# 24 "data/maps/PokemonMansion_1F/scripts.pory"

# 25 "data/maps/PokemonMansion_1F/scripts.pory"
PokemonMansion_1F_EventScript_Ted::
# 26 "data/maps/PokemonMansion_1F/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_TED, PokemonMansion_1F_Text_TedIntro, PokemonMansion_1F_Text_TedDefeat
# 27 "data/maps/PokemonMansion_1F/scripts.pory"
	msgbox PokemonMansion_1F_Text_TedPostBattle, MSGBOX_AUTOCLOSE
# 28 "data/maps/PokemonMansion_1F/scripts.pory"
	end
# 29 "data/maps/PokemonMansion_1F/scripts.pory"

# 30 "data/maps/PokemonMansion_1F/scripts.pory"
PokemonMansion_1F_EventScript_Johnson::
# 31 "data/maps/PokemonMansion_1F/scripts.pory"
	trainerbattle_single TRAINER_YOUNGSTER_JOHNSON, PokemonMansion_1F_Text_JohnsonIntro, PokemonMansion_1F_Text_JohnsonDefeat
# 32 "data/maps/PokemonMansion_1F/scripts.pory"
	msgbox PokemonMansion_1F_Text_JohnsonPostBattle, MSGBOX_AUTOCLOSE
# 33 "data/maps/PokemonMansion_1F/scripts.pory"
	end
