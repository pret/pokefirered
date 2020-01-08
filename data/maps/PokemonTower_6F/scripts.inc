PokemonTower_6F_MapScripts:: @ 81634B7
	.byte 0

PokemonTower_6F_EventScript_1634B8:: @ 81634B8
	lockall
	textcolor 2
	msgbox gUnknown_817A2F8
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	setwildbattle SPECIES_MAROWAK, 30, ITEM_NONE
	special ScrSpecial_StartMarowakBattle
	waitstate
	special sub_8112364
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1634F5
	applymovement 255, Movement_163512
	waitmovement 0
	releaseall
	end

EventScript_1634F5:: @ 81634F5
	message Text_17A30C
	waitmessage
	waitse
	playmoncry SPECIES_MAROWAK, 0
	waitbuttonpress
	waitmoncry
	msgbox gUnknown_817A342
	setvar VAR_MAP_SCENE_POKEMON_TOWER_6F, 1
	releaseall
	end

Movement_163512:: @ 8163512
	step_11
	step_end

PokemonTower_6F_EventScript_163514:: @ 8163514
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CHANNELER_ANGELICA, 0, Text_17A243, Text_17A253
	msgbox gUnknown_817A25A, 6
	end

PokemonTower_6F_EventScript_16352B:: @ 816352B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CHANNELER_EMILIA, 0, Text_17A272, Text_17A27F
	msgbox gUnknown_817A293, 6
	end

PokemonTower_6F_EventScript_163542:: @ 8163542
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CHANNELER_JENNIFER, 0, Text_17A2C8, Text_17A2DC
	msgbox gUnknown_817A2E2, 6
	end
