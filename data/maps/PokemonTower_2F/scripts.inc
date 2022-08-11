.set LOCALID_RIVAL, 1

PokemonTower_2F_MapScripts::
	.byte 0

PokemonTower_2F_EventScript_Channeler::
	msgbox PokemonTower_2F_Text_SilphScopeCouldUnmaskGhosts, MSGBOX_NPC
	end

PokemonTower_2F_EventScript_RivalTriggerRight::
	lockall
	setvar VAR_TEMP_1, 0
	goto PokemonTower_2F_EventScript_Rival
	end

PokemonTower_2F_EventScript_RivalTriggerDown::
	lockall
	setvar VAR_TEMP_1, 1
	goto PokemonTower_2F_EventScript_Rival
	end

PokemonTower_2F_EventScript_Rival::
	textcolor 0
	playbgm MUS_ENCOUNTER_RIVAL, 0
	compare VAR_TEMP_1, 0
	call_if_eq PokemonTower_2F_EventScript_RivalFacePlayerRight
	compare VAR_TEMP_1, 1
	call_if_eq PokemonTower_2F_EventScript_RivalFacePlayerDown
	applymovement LOCALID_RIVAL, Movement_ExclamationMark
	waitmovement 0
	applymovement LOCALID_RIVAL, Movement_Delay48
	waitmovement 0
	msgbox PokemonTower_2F_Text_RivalIntro
	setvar VAR_LAST_TALKED, LOCALID_RIVAL
	compare VAR_STARTER_MON, 2
	call_if_eq PokemonTower_2F_EventScript_RivalSquirtle
	compare VAR_STARTER_MON, 1
	call_if_eq PokemonTower_2F_EventScript_RivalBulbasaur
	compare VAR_STARTER_MON, 0
	call_if_eq PokemonTower_2F_EventScript_RivalCharmander
	msgbox PokemonTower_2F_Text_RivalPostBattle
	closemessage
	playbgm MUS_RIVAL_EXIT, 0
	compare VAR_TEMP_1, 0
	call_if_eq PokemonTower_2F_EventScript_RivalExitRight
	compare VAR_TEMP_1, 1
	call_if_eq PokemonTower_2F_EventScript_RivalExitDown
	playse SE_EXIT
	delay 25
	fadedefaultbgm
	removeobject LOCALID_RIVAL
	setvar VAR_MAP_SCENE_POKEMON_TOWER_2F, 1
	releaseall
	end

PokemonTower_2F_EventScript_RivalFacePlayerRight::
	applymovement LOCALID_RIVAL, Movement_WalkInPlaceFasterRight
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFasterLeft
	waitmovement 0
	return

PokemonTower_2F_EventScript_RivalFacePlayerDown::
	applymovement LOCALID_RIVAL, Movement_WalkInPlaceFasterDown
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFasterUp
	waitmovement 0
	return

PokemonTower_2F_EventScript_RivalSquirtle::
	trainerbattle_no_intro TRAINER_RIVAL_POKENON_TOWER_SQUIRTLE, PokemonTower_2F_Text_RivalDefeat
	return

PokemonTower_2F_EventScript_RivalBulbasaur::
	trainerbattle_no_intro TRAINER_RIVAL_POKENON_TOWER_BULBASAUR, PokemonTower_2F_Text_RivalDefeat
	return

PokemonTower_2F_EventScript_RivalCharmander::
	trainerbattle_no_intro TRAINER_RIVAL_POKENON_TOWER_CHARMANDER, PokemonTower_2F_Text_RivalDefeat
	return

PokemonTower_2F_EventScript_RivalExitRight::
	applymovement LOCALID_RIVAL, PokemonTower_2F_Movement_RivalExitRight
	waitmovement 0
	return

PokemonTower_2F_EventScript_RivalExitDown::
	applymovement LOCALID_RIVAL, PokemonTower_2F_Movement_RivalExitDown
	waitmovement 0
	return

PokemonTower_2F_Movement_RivalExitRight::
	walk_down
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_in_place_faster_right
	step_end

PokemonTower_2F_Movement_RivalExitDown::
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_in_place_faster_right
	step_end
