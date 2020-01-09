PokemonTower_2F_MapScripts:: @ 8163285
	.byte 0

PokemonTower_2F_EventScript_163286:: @ 8163286
	msgbox gUnknown_8179EAE, 2
	end

PokemonTower_2F_EventScript_16328F:: @ 816328F
	lockall
	setvar VAR_0x4001, 0
	goto EventScript_1632A7
	end

PokemonTower_2F_EventScript_16329B:: @ 816329B
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_1632A7
	end

EventScript_1632A7:: @ 81632A7
	textcolor 0
	playbgm MUS_RIVAL1, 0
	compare VAR_0x4001, 0
	call_if eq, EventScript_163339
	compare VAR_0x4001, 1
	call_if eq, EventScript_16334B
	applymovement 1, Movement_ExclamationMark
	waitmovement 0
	applymovement 1, Movement_Delay48
	waitmovement 0
	msgbox gUnknown_8179CFF
	setvar VAR_LAST_TALKED, 1
	compare VAR_STARTER_MON, 2
	call_if eq, EventScript_16335D
	compare VAR_STARTER_MON, 1
	call_if eq, EventScript_163368
	compare VAR_STARTER_MON, 0
	call_if eq, EventScript_163373
	msgbox gUnknown_8179DD4
	closemessage
	playbgm MUS_RIVAL2, 0
	compare VAR_0x4001, 0
	call_if eq, EventScript_16337E
	compare VAR_0x4001, 1
	call_if eq, EventScript_163389
	playse SE_KAIDAN
	delay 25
	fadedefaultbgm
	removeobject 1
	setvar VAR_MAP_SCENE_POKEMON_TOWER_2F, 1
	releaseall
	end

EventScript_163339:: @ 8163339
	applymovement 1, Movement_WalkInPlaceFastestRight
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

EventScript_16334B:: @ 816334B
	applymovement 1, Movement_WalkInPlaceFastestDown
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

EventScript_16335D:: @ 816335D
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_RIVAL_POKENON_TOWER_SQUIRTLE, 0, Text_179D73
	return

EventScript_163368:: @ 8163368
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_RIVAL_POKENON_TOWER_BULBASAUR, 0, Text_179D73
	return

EventScript_163373:: @ 8163373
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_RIVAL_POKENON_TOWER_CHARMANDER, 0, Text_179D73
	return

EventScript_16337E:: @ 816337E
	applymovement 1, Movement_163394
	waitmovement 0
	return

EventScript_163389:: @ 8163389
	applymovement 1, Movement_16339D
	waitmovement 0
	return

Movement_163394:: @ 8163394
	walk_down
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_right
	step_end

Movement_16339D:: @ 816339D
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_right
	step_end
