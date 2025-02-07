# 1 "data/maps/PokemonTower_1F/scripts.pory"

# 2 "data/maps/PokemonTower_1F/scripts.pory"
PokemonTower_1F_MapScripts::
# 3 "data/maps/PokemonTower_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, PokemonTower_1F_OnTransition
# 4 "data/maps/PokemonTower_1F/scripts.pory"
	.byte 0
# 5 "data/maps/PokemonTower_1F/scripts.pory"

# 6 "data/maps/PokemonTower_1F/scripts.pory"
PokemonTower_1F_OnTransition::
# 7 "data/maps/PokemonTower_1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_POKEMON_TOWER_1F
# 8 "data/maps/PokemonTower_1F/scripts.pory"
	end
# 9 "data/maps/PokemonTower_1F/scripts.pory"

# 10 "data/maps/PokemonTower_1F/scripts.pory"
PokemonTower_1F_EventScript_Channeler::
# 11 "data/maps/PokemonTower_1F/scripts.pory"
	msgbox PokemonTower_1F_Text_SenseSpiritsUpToMischief, MSGBOX_NPC
# 12 "data/maps/PokemonTower_1F/scripts.pory"
	end
# 13 "data/maps/PokemonTower_1F/scripts.pory"

# 14 "data/maps/PokemonTower_1F/scripts.pory"
PokemonTower_1F_EventScript_Woman1::
# 15 "data/maps/PokemonTower_1F/scripts.pory"
	msgbox PokemonTower_1F_Text_GrowlitheWhyDidYouDie, MSGBOX_NPC
# 16 "data/maps/PokemonTower_1F/scripts.pory"
	end
# 17 "data/maps/PokemonTower_1F/scripts.pory"

# 18 "data/maps/PokemonTower_1F/scripts.pory"
PokemonTower_1F_EventScript_BaldingMan::
# 19 "data/maps/PokemonTower_1F/scripts.pory"
	msgbox PokemonTower_1F_Text_CameToPrayForDepartedClefairy, MSGBOX_NPC
# 20 "data/maps/PokemonTower_1F/scripts.pory"
	end
# 21 "data/maps/PokemonTower_1F/scripts.pory"

# 22 "data/maps/PokemonTower_1F/scripts.pory"
PokemonTower_1F_EventScript_Woman2::
# 23 "data/maps/PokemonTower_1F/scripts.pory"
	lock
# 24 "data/maps/PokemonTower_1F/scripts.pory"
	faceplayer
# 25 "data/maps/PokemonTower_1F/scripts.pory"
	checkplayergender
# 26 "data/maps/PokemonTower_1F/scripts.pory"
	goto_if_eq VAR_RESULT, MALE, PokemonTower_1F_EventScript_Woman2MalePlayer
# 27 "data/maps/PokemonTower_1F/scripts.pory"
	msgbox PokemonTower_1F_Text_ComeToPayRespectsGirl
# 28 "data/maps/PokemonTower_1F/scripts.pory"
	release
# 29 "data/maps/PokemonTower_1F/scripts.pory"
	end
# 30 "data/maps/PokemonTower_1F/scripts.pory"

# 31 "data/maps/PokemonTower_1F/scripts.pory"
PokemonTower_1F_EventScript_Woman2MalePlayer::
# 32 "data/maps/PokemonTower_1F/scripts.pory"
	msgbox PokemonTower_1F_Text_ComeToPayRespectsSon
# 33 "data/maps/PokemonTower_1F/scripts.pory"
	release
# 34 "data/maps/PokemonTower_1F/scripts.pory"
	end
# 35 "data/maps/PokemonTower_1F/scripts.pory"

# 36 "data/maps/PokemonTower_1F/scripts.pory"
PokemonTower_1F_EventScript_WorkerF::
# 37 "data/maps/PokemonTower_1F/scripts.pory"
	msgbox PokemonTower_1F_Text_ErectedInMemoryOfDeadMons, MSGBOX_NPC
# 38 "data/maps/PokemonTower_1F/scripts.pory"
	end
