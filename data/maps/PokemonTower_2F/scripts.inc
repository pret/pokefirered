# 1 "data/maps/PokemonTower_2F/scripts.pory"

# 2 "data/maps/PokemonTower_2F/scripts.pory"
.set LOCALID_RIVAL, 1
# 3 "data/maps/PokemonTower_2F/scripts.pory"

# 4 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_MapScripts::
# 5 "data/maps/PokemonTower_2F/scripts.pory"
	.byte 0
# 6 "data/maps/PokemonTower_2F/scripts.pory"

# 7 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_Channeler::
# 8 "data/maps/PokemonTower_2F/scripts.pory"
	msgbox PokemonTower_2F_Text_SilphScopeCouldUnmaskGhosts, MSGBOX_NPC
# 9 "data/maps/PokemonTower_2F/scripts.pory"
	end
# 10 "data/maps/PokemonTower_2F/scripts.pory"

# 11 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_RivalTriggerRight::
# 12 "data/maps/PokemonTower_2F/scripts.pory"
	lockall
# 13 "data/maps/PokemonTower_2F/scripts.pory"
	setvar VAR_TEMP_1, 0
# 14 "data/maps/PokemonTower_2F/scripts.pory"
	goto PokemonTower_2F_EventScript_Rival
# 15 "data/maps/PokemonTower_2F/scripts.pory"
	end
# 16 "data/maps/PokemonTower_2F/scripts.pory"

# 17 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_RivalTriggerDown::
# 18 "data/maps/PokemonTower_2F/scripts.pory"
	lockall
# 19 "data/maps/PokemonTower_2F/scripts.pory"
	setvar VAR_TEMP_1, 1
# 20 "data/maps/PokemonTower_2F/scripts.pory"
	goto PokemonTower_2F_EventScript_Rival
# 21 "data/maps/PokemonTower_2F/scripts.pory"
	end
# 22 "data/maps/PokemonTower_2F/scripts.pory"

# 23 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_Rival::
# 24 "data/maps/PokemonTower_2F/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 25 "data/maps/PokemonTower_2F/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 26 "data/maps/PokemonTower_2F/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, PokemonTower_2F_EventScript_RivalFacePlayerRight
# 27 "data/maps/PokemonTower_2F/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, PokemonTower_2F_EventScript_RivalFacePlayerDown
# 28 "data/maps/PokemonTower_2F/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_ExclamationMark
# 29 "data/maps/PokemonTower_2F/scripts.pory"
	waitmovement 0
# 30 "data/maps/PokemonTower_2F/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_Delay48
# 31 "data/maps/PokemonTower_2F/scripts.pory"
	waitmovement 0
# 32 "data/maps/PokemonTower_2F/scripts.pory"
	msgbox PokemonTower_2F_Text_RivalIntro
# 33 "data/maps/PokemonTower_2F/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_RIVAL
# 34 "data/maps/PokemonTower_2F/scripts.pory"
	call_if_eq VAR_STARTER_MON, 2, PokemonTower_2F_EventScript_RivalSquirtle
# 35 "data/maps/PokemonTower_2F/scripts.pory"
	call_if_eq VAR_STARTER_MON, 1, PokemonTower_2F_EventScript_RivalBulbasaur
# 36 "data/maps/PokemonTower_2F/scripts.pory"
	call_if_eq VAR_STARTER_MON, 0, PokemonTower_2F_EventScript_RivalCharmander
# 37 "data/maps/PokemonTower_2F/scripts.pory"
	msgbox PokemonTower_2F_Text_RivalPostBattle
# 38 "data/maps/PokemonTower_2F/scripts.pory"
	closemessage
# 39 "data/maps/PokemonTower_2F/scripts.pory"
	playbgm MUS_RIVAL_EXIT, 0
# 40 "data/maps/PokemonTower_2F/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, PokemonTower_2F_EventScript_RivalExitRight
# 41 "data/maps/PokemonTower_2F/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, PokemonTower_2F_EventScript_RivalExitDown
# 42 "data/maps/PokemonTower_2F/scripts.pory"
	playse SE_EXIT
# 43 "data/maps/PokemonTower_2F/scripts.pory"
	delay 25
# 44 "data/maps/PokemonTower_2F/scripts.pory"
	fadedefaultbgm
# 45 "data/maps/PokemonTower_2F/scripts.pory"
	removeobject LOCALID_RIVAL
# 46 "data/maps/PokemonTower_2F/scripts.pory"
	setvar VAR_MAP_SCENE_POKEMON_TOWER_2F, 1
# 47 "data/maps/PokemonTower_2F/scripts.pory"
	releaseall
# 48 "data/maps/PokemonTower_2F/scripts.pory"
	end
# 49 "data/maps/PokemonTower_2F/scripts.pory"

# 50 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_RivalFacePlayerRight::
# 51 "data/maps/PokemonTower_2F/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_WalkInPlaceFasterRight
# 52 "data/maps/PokemonTower_2F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 53 "data/maps/PokemonTower_2F/scripts.pory"
	waitmovement 0
# 54 "data/maps/PokemonTower_2F/scripts.pory"
	return
# 55 "data/maps/PokemonTower_2F/scripts.pory"

# 56 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_RivalFacePlayerDown::
# 57 "data/maps/PokemonTower_2F/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_WalkInPlaceFasterDown
# 58 "data/maps/PokemonTower_2F/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 59 "data/maps/PokemonTower_2F/scripts.pory"
	waitmovement 0
# 60 "data/maps/PokemonTower_2F/scripts.pory"
	return
# 61 "data/maps/PokemonTower_2F/scripts.pory"

# 62 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_RivalSquirtle::
# 63 "data/maps/PokemonTower_2F/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_POKEMON_TOWER_SQUIRTLE, PokemonTower_2F_Text_RivalDefeat
# 64 "data/maps/PokemonTower_2F/scripts.pory"
	return
# 65 "data/maps/PokemonTower_2F/scripts.pory"

# 66 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_RivalBulbasaur::
# 67 "data/maps/PokemonTower_2F/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_POKEMON_TOWER_BULBASAUR, PokemonTower_2F_Text_RivalDefeat
# 68 "data/maps/PokemonTower_2F/scripts.pory"
	return
# 69 "data/maps/PokemonTower_2F/scripts.pory"

# 70 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_RivalCharmander::
# 71 "data/maps/PokemonTower_2F/scripts.pory"
	trainerbattle_no_intro TRAINER_RIVAL_POKEMON_TOWER_CHARMANDER, PokemonTower_2F_Text_RivalDefeat
# 72 "data/maps/PokemonTower_2F/scripts.pory"
	return
# 73 "data/maps/PokemonTower_2F/scripts.pory"

# 74 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_RivalExitRight::
# 75 "data/maps/PokemonTower_2F/scripts.pory"
	applymovement LOCALID_RIVAL, PokemonTower_2F_Movement_RivalExitRight
# 76 "data/maps/PokemonTower_2F/scripts.pory"
	waitmovement 0
# 77 "data/maps/PokemonTower_2F/scripts.pory"
	return
# 78 "data/maps/PokemonTower_2F/scripts.pory"

# 79 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_EventScript_RivalExitDown::
# 80 "data/maps/PokemonTower_2F/scripts.pory"
	applymovement LOCALID_RIVAL, PokemonTower_2F_Movement_RivalExitDown
# 81 "data/maps/PokemonTower_2F/scripts.pory"
	waitmovement 0
# 82 "data/maps/PokemonTower_2F/scripts.pory"
	return
# 83 "data/maps/PokemonTower_2F/scripts.pory"

# 84 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_Movement_RivalExitRight::
# 85 "data/maps/PokemonTower_2F/scripts.pory"
	walk_down
# 86 "data/maps/PokemonTower_2F/scripts.pory"
	walk_right
# 87 "data/maps/PokemonTower_2F/scripts.pory"
	walk_right
# 88 "data/maps/PokemonTower_2F/scripts.pory"
	walk_down
# 89 "data/maps/PokemonTower_2F/scripts.pory"
	walk_down
# 90 "data/maps/PokemonTower_2F/scripts.pory"
	walk_down
# 91 "data/maps/PokemonTower_2F/scripts.pory"
	walk_down
# 92 "data/maps/PokemonTower_2F/scripts.pory"
	walk_in_place_faster_right
# 93 "data/maps/PokemonTower_2F/scripts.pory"
	step_end
# 94 "data/maps/PokemonTower_2F/scripts.pory"

# 95 "data/maps/PokemonTower_2F/scripts.pory"
PokemonTower_2F_Movement_RivalExitDown::
# 96 "data/maps/PokemonTower_2F/scripts.pory"
	walk_right
# 97 "data/maps/PokemonTower_2F/scripts.pory"
	walk_right
# 98 "data/maps/PokemonTower_2F/scripts.pory"
	walk_down
# 99 "data/maps/PokemonTower_2F/scripts.pory"
	walk_down
# 100 "data/maps/PokemonTower_2F/scripts.pory"
	walk_down
# 101 "data/maps/PokemonTower_2F/scripts.pory"
	walk_down
# 102 "data/maps/PokemonTower_2F/scripts.pory"
	walk_down
# 103 "data/maps/PokemonTower_2F/scripts.pory"
	walk_in_place_faster_right
# 104 "data/maps/PokemonTower_2F/scripts.pory"
	step_end
