PokemonLeague_LancesRoom_MapScripts:: @ 816292D
	map_script 5, PokemonLeague_LancesRoom_MapScript1_162942
	map_script 1, PokemonLeague_LancesRoom_MapScript2_16294D
	map_script 4, PokemonLeague_LancesRoom_MapScript3_16296E
	map_script 2, PokemonLeague_LancesRoom_MapScript4_16297D
	.byte 0

PokemonLeague_LancesRoom_MapScript1_162942:: @ 8162942
	setvar VAR_0x8004, 3
	call EventScript_1A75D5
	end

PokemonLeague_LancesRoom_MapScript2_16294D:: @ 816294D
	compare_var_to_value VAR_MAP_SCENE_POKEMON_LEAGUE, 4
	call_if 1, EventScript_162962
	checkflag FLAG_DEFEATED_LANCE
	call_if 1, EventScript_162968
	end

EventScript_162962:: @ 8162962
	call EventScript_1629A8
	return

EventScript_162968:: @ 8162968
	call EventScript_1A7589
	return

PokemonLeague_LancesRoom_MapScript3_16296E:: @ 816296E
	map_script_2 VAR_0x4001, 0, EventScript_162978
	.2byte 0

EventScript_162978:: @ 8162978
	turnobject 255, 2
	end

PokemonLeague_LancesRoom_MapScript4_16297D:: @ 816297D
	map_script_2 VAR_MAP_SCENE_POKEMON_LEAGUE, 3, EventScript_162987
	.2byte 0

EventScript_162987:: @ 8162987
	lockall
	applymovement 255, Movement_1629F1
	waitmovement 0
	setflag FLAG_TEMP_2
	call EventScript_1629A8
	playse SE_KI_GASYAN
	special DrawWholeMapView
	waitse
	setvar VAR_MAP_SCENE_POKEMON_LEAGUE, 4
	releaseall
	end

EventScript_1629A8:: @ 81629A8
	setmetatile 5, 14, 669, 1
	setmetatile 6, 14, 670, 1
	setmetatile 7, 14, 671, 1
	setmetatile 5, 15, 677, 1
	setmetatile 6, 15, 678, 1
	setmetatile 7, 15, 679, 1
	setmetatile 6, 16, 785, 0
	setmetatile 7, 16, 785, 0
	return

Movement_1629F1:: @ 81629F1
	step_11
	step_11
	step_12
	step_12
	step_12
	step_12
	step_12
	step_12
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_10
	step_12
	step_12
	step_12
	step_12
	step_12
	step_12
	step_12
	step_12
	step_12
	step_12
	step_12
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

PokemonLeague_LancesRoom_EventScript_162A14:: @ 8162A14
	lock
	faceplayer
	famechecker FAMECHECKER_LANCE, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	checkflag FLAG_DEFEATED_LANCE
	goto_if_eq EventScript_162AA1
	famechecker FAMECHECKER_LANCE, 0
	famechecker FAMECHECKER_LANCE, 1
	checkflag FLAG_SYS_GAME_CLEAR
	call_if 0, EventScript_162A79
	checkflag FLAG_SYS_GAME_CLEAR
	call_if 1, EventScript_162A82
	setflag FLAG_TEMP_3
	setflag FLAG_TEMP_5
	checkflag FLAG_0x844
	call_if 0, EventScript_162A8B
	checkflag FLAG_0x844
	call_if 1, EventScript_162A96
	clearflag FLAG_TEMP_5
	goto EventScript_162AAB

EventScript_162A78:: @ 8162A78
	end

EventScript_162A79:: @ 8162A79
	msgbox gUnknown_8178764
	return

EventScript_162A82:: @ 8162A82
	msgbox gUnknown_81788BD
	return

EventScript_162A8B:: @ 8162A8B
	trainerbattle 3, TRAINER_ELITE_FOUR_LANCE, 0, Text_178A15
	return

EventScript_162A96:: @ 8162A96
	trainerbattle 3, TRAINER_ELITE_FOUR_LANCE_2, 0, Text_178A15
	return

EventScript_162AA1:: @ 8162AA1
	msgbox gUnknown_8178A52
	release
	end

EventScript_162AAB:: @ 8162AAB
	setvar VAR_0x8004, 0
	special sub_8113530
	setflag FLAG_DEFEATED_LANCE
	call EventScript_1A7563
	msgbox gUnknown_8178A52
	closemessage
	release
	end

EventScript_162AC6:: @ 8162AC6
	applymovement 1, Movement_162ADC
	waitmovement 0
	return

EventScript_162AD1:: @ 8162AD1
	applymovement 1, Movement_162ADF
	waitmovement 0
	return

Movement_162ADC:: @ 8162ADC
	step_12
	step_30
	step_end

Movement_162ADF:: @ 8162ADF
	step_13
	step_2f
	step_end
