# 1 "data/maps/PokemonTower_5F/scripts.pory"

# 2 "data/maps/PokemonTower_5F/scripts.pory"
PokemonTower_5F_MapScripts::
# 3 "data/maps/PokemonTower_5F/scripts.pory"
	.byte 0
# 4 "data/maps/PokemonTower_5F/scripts.pory"

# 5 "data/maps/PokemonTower_5F/scripts.pory"
PokemonTower_5F_EventScript_Channeler::
# 6 "data/maps/PokemonTower_5F/scripts.pory"
	msgbox PokemonTower_5F_Text_RestHereInPurifiedSpace, MSGBOX_NPC
# 7 "data/maps/PokemonTower_5F/scripts.pory"
	end
# 8 "data/maps/PokemonTower_5F/scripts.pory"

# 9 "data/maps/PokemonTower_5F/scripts.pory"
PokemonTower_5F_EventScript_PurifiedZone::
# 10 "data/maps/PokemonTower_5F/scripts.pory"
	lockall
# 11 "data/maps/PokemonTower_5F/scripts.pory"
	fadescreen FADE_TO_WHITE
# 12 "data/maps/PokemonTower_5F/scripts.pory"
	special HealPlayerParty
# 13 "data/maps/PokemonTower_5F/scripts.pory"
	fadescreen FADE_FROM_WHITE
# 14 "data/maps/PokemonTower_5F/scripts.pory"
	msgbox PokemonTower_5F_Text_PurifiedZoneMonsFullyHealed
# 15 "data/maps/PokemonTower_5F/scripts.pory"
	setvar VAR_TEMP_1, 1
# 16 "data/maps/PokemonTower_5F/scripts.pory"
	releaseall
# 17 "data/maps/PokemonTower_5F/scripts.pory"
	end
# 18 "data/maps/PokemonTower_5F/scripts.pory"

# 19 "data/maps/PokemonTower_5F/scripts.pory"
PokemonTower_5F_EventScript_ExitPurifiedZone::
# 20 "data/maps/PokemonTower_5F/scripts.pory"
	lockall
# 21 "data/maps/PokemonTower_5F/scripts.pory"
	setvar VAR_TEMP_1, 0
# 22 "data/maps/PokemonTower_5F/scripts.pory"
	releaseall
# 23 "data/maps/PokemonTower_5F/scripts.pory"
	end
# 24 "data/maps/PokemonTower_5F/scripts.pory"

# 25 "data/maps/PokemonTower_5F/scripts.pory"
PokemonTower_5F_EventScript_Tammy::
# 26 "data/maps/PokemonTower_5F/scripts.pory"
	trainerbattle_single TRAINER_CHANNELER_TAMMY, PokemonTower_5F_Text_TammyIntro, PokemonTower_5F_Text_TammyDefeat
# 27 "data/maps/PokemonTower_5F/scripts.pory"
	msgbox PokemonTower_5F_Text_TammyPostBattle, MSGBOX_AUTOCLOSE
# 28 "data/maps/PokemonTower_5F/scripts.pory"
	end
# 29 "data/maps/PokemonTower_5F/scripts.pory"

# 30 "data/maps/PokemonTower_5F/scripts.pory"
PokemonTower_5F_EventScript_Ruth::
# 31 "data/maps/PokemonTower_5F/scripts.pory"
	trainerbattle_single TRAINER_CHANNELER_RUTH, PokemonTower_5F_Text_RuthIntro, PokemonTower_5F_Text_RuthDefeat
# 32 "data/maps/PokemonTower_5F/scripts.pory"
	msgbox PokemonTower_5F_Text_RuthPostBattle, MSGBOX_AUTOCLOSE
# 33 "data/maps/PokemonTower_5F/scripts.pory"
	end
# 34 "data/maps/PokemonTower_5F/scripts.pory"

# 35 "data/maps/PokemonTower_5F/scripts.pory"
PokemonTower_5F_EventScript_Karina::
# 36 "data/maps/PokemonTower_5F/scripts.pory"
	trainerbattle_single TRAINER_CHANNELER_KARINA, PokemonTower_5F_Text_KarinaIntro, PokemonTower_5F_Text_KarinaDefeat
# 37 "data/maps/PokemonTower_5F/scripts.pory"
	msgbox PokemonTower_5F_Text_KarinaPostBattle, MSGBOX_AUTOCLOSE
# 38 "data/maps/PokemonTower_5F/scripts.pory"
	end
# 39 "data/maps/PokemonTower_5F/scripts.pory"

# 40 "data/maps/PokemonTower_5F/scripts.pory"
PokemonTower_5F_EventScript_Janae::
# 41 "data/maps/PokemonTower_5F/scripts.pory"
	trainerbattle_single TRAINER_CHANNELER_JANAE, PokemonTower_5F_Text_JanaeIntro, PokemonTower_5F_Text_JanaeDefeat
# 42 "data/maps/PokemonTower_5F/scripts.pory"
	msgbox PokemonTower_5F_Text_JanaePostBattle, MSGBOX_AUTOCLOSE
# 43 "data/maps/PokemonTower_5F/scripts.pory"
	end
