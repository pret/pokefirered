# 1 "data/maps/PokemonTower_6F/scripts.pory"

# 2 "data/maps/PokemonTower_6F/scripts.pory"
PokemonTower_6F_MapScripts::
# 3 "data/maps/PokemonTower_6F/scripts.pory"
	.byte 0
# 4 "data/maps/PokemonTower_6F/scripts.pory"

# 5 "data/maps/PokemonTower_6F/scripts.pory"
PokemonTower_6F_EventScript_MarowakGhost::
# 6 "data/maps/PokemonTower_6F/scripts.pory"
	lockall
# 7 "data/maps/PokemonTower_6F/scripts.pory"
	textcolor NPC_TEXT_COLOR_MON
# 8 "data/maps/PokemonTower_6F/scripts.pory"
	msgbox PokemonTower_6F_Text_BeGoneIntruders
# 9 "data/maps/PokemonTower_6F/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 10 "data/maps/PokemonTower_6F/scripts.pory"
	setwildbattle SPECIES_MAROWAK, 30
# 11 "data/maps/PokemonTower_6F/scripts.pory"
	special StartMarowakBattle
# 12 "data/maps/PokemonTower_6F/scripts.pory"
	waitstate
# 13 "data/maps/PokemonTower_6F/scripts.pory"
	special QuestLog_CutRecording
# 14 "data/maps/PokemonTower_6F/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, PokemonTower_6F_EventScript_DefeatedMarowakGhost  @ VAR_RESULT set by CB2_EndMarowakBattle
# 15 "data/maps/PokemonTower_6F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PokemonTower_6F_Movement_ForcePlayerUp
# 16 "data/maps/PokemonTower_6F/scripts.pory"
	waitmovement 0
# 17 "data/maps/PokemonTower_6F/scripts.pory"
	releaseall
# 18 "data/maps/PokemonTower_6F/scripts.pory"
	end
# 19 "data/maps/PokemonTower_6F/scripts.pory"

# 20 "data/maps/PokemonTower_6F/scripts.pory"
PokemonTower_6F_EventScript_DefeatedMarowakGhost::
# 21 "data/maps/PokemonTower_6F/scripts.pory"
	message PokemonTower_6F_Text_GhostWasCubonesMother
# 22 "data/maps/PokemonTower_6F/scripts.pory"
	waitmessage
# 23 "data/maps/PokemonTower_6F/scripts.pory"
	waitse
# 24 "data/maps/PokemonTower_6F/scripts.pory"
	playmoncry SPECIES_MAROWAK, CRY_MODE_NORMAL
# 25 "data/maps/PokemonTower_6F/scripts.pory"
	waitbuttonpress
# 26 "data/maps/PokemonTower_6F/scripts.pory"
	waitmoncry
# 27 "data/maps/PokemonTower_6F/scripts.pory"
	msgbox PokemonTower_6F_Text_MothersSpiritWasCalmed
# 28 "data/maps/PokemonTower_6F/scripts.pory"
	setvar VAR_MAP_SCENE_POKEMON_TOWER_6F, 1
# 29 "data/maps/PokemonTower_6F/scripts.pory"
	releaseall
# 30 "data/maps/PokemonTower_6F/scripts.pory"
	end
# 31 "data/maps/PokemonTower_6F/scripts.pory"

# 32 "data/maps/PokemonTower_6F/scripts.pory"
PokemonTower_6F_Movement_ForcePlayerUp::
# 33 "data/maps/PokemonTower_6F/scripts.pory"
	walk_up
# 34 "data/maps/PokemonTower_6F/scripts.pory"
	step_end
# 35 "data/maps/PokemonTower_6F/scripts.pory"

# 36 "data/maps/PokemonTower_6F/scripts.pory"
PokemonTower_6F_EventScript_Angelica::
# 37 "data/maps/PokemonTower_6F/scripts.pory"
	trainerbattle_single TRAINER_CHANNELER_ANGELICA, PokemonTower_6F_Text_AngelicaIntro, PokemonTower_6F_Text_AngelicaDefeat
# 38 "data/maps/PokemonTower_6F/scripts.pory"
	msgbox PokemonTower_6F_Text_AngelicaPostBattle, MSGBOX_AUTOCLOSE
# 39 "data/maps/PokemonTower_6F/scripts.pory"
	end
# 40 "data/maps/PokemonTower_6F/scripts.pory"

# 41 "data/maps/PokemonTower_6F/scripts.pory"
PokemonTower_6F_EventScript_Emilia::
# 42 "data/maps/PokemonTower_6F/scripts.pory"
	trainerbattle_single TRAINER_CHANNELER_EMILIA, PokemonTower_6F_Text_EmiliaIntro, PokemonTower_6F_Text_EmiliaDefeat
# 43 "data/maps/PokemonTower_6F/scripts.pory"
	msgbox PokemonTower_6F_Text_EmiliaPostBattle, MSGBOX_AUTOCLOSE
# 44 "data/maps/PokemonTower_6F/scripts.pory"
	end
# 45 "data/maps/PokemonTower_6F/scripts.pory"

# 46 "data/maps/PokemonTower_6F/scripts.pory"
PokemonTower_6F_EventScript_Jennifer::
# 47 "data/maps/PokemonTower_6F/scripts.pory"
	trainerbattle_single TRAINER_CHANNELER_JENNIFER, PokemonTower_6F_Text_JenniferIntro, PokemonTower_6F_Text_JenniferDefeat
# 48 "data/maps/PokemonTower_6F/scripts.pory"
	msgbox PokemonTower_6F_Text_JenniferPostBattle, MSGBOX_AUTOCLOSE
# 49 "data/maps/PokemonTower_6F/scripts.pory"
	end
