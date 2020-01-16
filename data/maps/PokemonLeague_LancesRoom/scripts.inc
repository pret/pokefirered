PokemonLeague_LancesRoom_MapScripts:: @ 816292D
	map_script MAP_SCRIPT_ON_RESUME, PokemonLeague_LancesRoom_OnResume
	map_script MAP_SCRIPT_ON_LOAD, PokemonLeague_LancesRoom_OnLoad
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PokemonLeague_LancesRoom_OnWarp
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PokemonLeague_LancesRoom_OnFrame
	.byte 0

PokemonLeague_LancesRoom_OnResume:: @ 8162942
	setvar VAR_0x8004, 3
	call EventScript_1A75D5
	end

PokemonLeague_LancesRoom_OnLoad:: @ 816294D
	compare VAR_MAP_SCENE_POKEMON_LEAGUE, 4
	call_if_eq EventScript_162962
	call_if_set FLAG_DEFEATED_LANCE, EventScript_162968
	end

EventScript_162962:: @ 8162962
	call EventScript_1629A8
	return

EventScript_162968:: @ 8162968
	call EventScript_1A7589
	return

PokemonLeague_LancesRoom_OnWarp:: @ 816296E
	map_script_2 VAR_TEMP_1, 0, EventScript_162978
	.2byte 0

EventScript_162978:: @ 8162978
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
	end

PokemonLeague_LancesRoom_OnFrame:: @ 816297D
	map_script_2 VAR_MAP_SCENE_POKEMON_LEAGUE, 3, EventScript_162987
	.2byte 0

EventScript_162987:: @ 8162987
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1629F1
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
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

PokemonLeague_LancesRoom_EventScript_162A14:: @ 8162A14
	lock
	faceplayer
	famechecker FAMECHECKER_LANCE, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	goto_if_set FLAG_DEFEATED_LANCE, EventScript_162AA1
	famechecker FAMECHECKER_LANCE, 0
	famechecker FAMECHECKER_LANCE, 1
	call_if_unset FLAG_SYS_GAME_CLEAR, EventScript_162A79
	call_if_set FLAG_SYS_GAME_CLEAR, EventScript_162A82
	setflag FLAG_TEMP_3
	setflag FLAG_TEMP_5
	call_if_unset FLAG_SYS_CAN_LINK_WITH_RS, EventScript_162A8B
	call_if_set FLAG_SYS_CAN_LINK_WITH_RS, EventScript_162A96
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
	trainerbattle_no_intro TRAINER_ELITE_FOUR_LANCE, Text_178A15
	return

EventScript_162A96:: @ 8162A96
	trainerbattle_no_intro TRAINER_ELITE_FOUR_LANCE_2, Text_178A15
	return

EventScript_162AA1:: @ 8162AA1
	msgbox gUnknown_8178A52
	release
	end

EventScript_162AAB:: @ 8162AAB
	setvar VAR_0x8004, 0
	special Special_TryGainNewFanFromCounter
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
	walk_left
	walk_in_place_fastest_right
	step_end

Movement_162ADF:: @ 8162ADF
	walk_right
	walk_in_place_fastest_left
	step_end
