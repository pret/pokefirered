PokemonLeague_ChampionsRoom_MapScripts:: @ 8162AE2
	map_script 4, PokemonLeague_ChampionsRoom_MapScript1_162B5D
	map_script 5, PokemonLeague_ChampionsRoom_MapScript2_162AF2
	map_script 2, PokemonLeague_ChampionsRoom_MapScript3_162B6C
	.byte 0

PokemonLeague_ChampionsRoom_MapScript2_162AF2:: @ 8162AF2
	setvar VAR_0x8004, 4
	call EventScript_1A75D5
	compare_var_to_value VAR_STARTER_MON, 2
	call_if eq, EventScript_162B1E
	compare_var_to_value VAR_STARTER_MON, 1
	call_if eq, EventScript_162B31
	compare_var_to_value VAR_STARTER_MON, 0
	call_if eq, EventScript_162B44
	end

EventScript_162B1E:: @ 8162B1E
	checktrainerflag TRAINER_CHAMPION_TERRY
	goto_if_eq EventScript_162B57
	checktrainerflag TRAINER_CHAMPION_TERRY_4
	goto_if_eq EventScript_162B57
	return

EventScript_162B31:: @ 8162B31
	checktrainerflag TRAINER_CHAMPION_TERRY_2
	goto_if_eq EventScript_162B57
	checktrainerflag TRAINER_CHAMPION_TERRY_5
	goto_if_eq EventScript_162B57
	return

EventScript_162B44:: @ 8162B44
	checktrainerflag TRAINER_CHAMPION_TERRY_3
	goto_if_eq EventScript_162B57
	checktrainerflag TRAINER_CHAMPION_TERRY_6
	goto_if_eq EventScript_162B57
	return

EventScript_162B57:: @ 8162B57
	setvar VAR_0x4001, 1
	return

PokemonLeague_ChampionsRoom_MapScript1_162B5D:: @ 8162B5D
	map_script_2 VAR_0x4001, 0, EventScript_162B67
	.2byte 0

EventScript_162B67:: @ 8162B67
	turnobject 255, 2
	end

PokemonLeague_ChampionsRoom_MapScript3_162B6C:: @ 8162B6C
	map_script_2 VAR_0x4001, 0, EventScript_162B76
	.2byte 0

EventScript_162B76:: @ 8162B76
	lockall
	textcolor 0
	setflag FLAG_TEMP_2
	applymovement 255, Movement_162D07
	waitmovement 0
	delay 20
	checkflag FLAG_SYS_GAME_CLEAR
	call_if lt, EventScript_162CB3
	checkflag FLAG_SYS_GAME_CLEAR
	call_if eq, EventScript_162CBC
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_162C68
	setflag FLAG_TEMP_3
	setflag FLAG_TEMP_5
	savebgm MUS_WIN_GYM
	checkflag FLAG_0x844
	call_if lt, EventScript_162C6F
	checkflag FLAG_0x844
	call_if eq, EventScript_162C91
	setflag FLAG_TEMP_4
	clearflag FLAG_TEMP_5
	setflag FLAG_DEFEATED_CHAMP
	setflag FLAG_TEMP_4
	msgbox gUnknown_8178F2F
	playbgm MUS_SLOWMASARA, 0
	addobject 2
	msgbox gUnknown_8178FC6
	closemessage
	applymovement 255, Movement_162D1F
	applymovement 1, Movement_162D41
	applymovement 2, Movement_162D2A
	waitmovement 0
	delay 25
	specialvar VAR_RESULT, ScrSpecial_GetStarter
	getspeciesname 0, VAR_RESULT
	msgbox gUnknown_8178FCF
	applymovement 2, Movement_1A75EB
	applymovement 1, Movement_1A75E7
	waitmovement 0
	msgbox gUnknown_817908F
	closemessage
	applymovement 2, Movement_1A75ED
	waitmovement 0
	delay 20
	msgbox gUnknown_81791A3
	closemessage
	delay 13
	applymovement 2, Movement_162D37
	applymovement 255, Movement_162D12
	waitmovement 0
	setvar VAR_0x4001, 1
	warp MAP_POKEMON_LEAGUE_HALL_OF_FAME, 255, 5, 12
	waitstate
	releaseall
	end

EventScript_162C68:: @ 8162C68
	call EventScript_162B57
	releaseall
	end

EventScript_162C6F:: @ 8162C6F
	compare_var_to_value VAR_STARTER_MON, 2
	call_if eq, EventScript_162CC5
	compare_var_to_value VAR_STARTER_MON, 1
	call_if eq, EventScript_162CD0
	compare_var_to_value VAR_STARTER_MON, 0
	call_if eq, EventScript_162CDB
	return

EventScript_162C91:: @ 8162C91
	compare_var_to_value VAR_STARTER_MON, 2
	call_if eq, EventScript_162CE6
	compare_var_to_value VAR_STARTER_MON, 1
	call_if eq, EventScript_162CF1
	compare_var_to_value VAR_STARTER_MON, 0
	call_if eq, EventScript_162CFC
	return

EventScript_162CB3:: @ 8162CB3
	msgbox gUnknown_8178B6C
	return

EventScript_162CBC:: @ 8162CBC
	msgbox gUnknown_8178CD4
	return

EventScript_162CC5:: @ 8162CC5
	trainerbattle 3, TRAINER_CHAMPION_TERRY, 0, Text_178E3F
	return

EventScript_162CD0:: @ 8162CD0
	trainerbattle 3, TRAINER_CHAMPION_TERRY_2, 0, Text_178E3F
	return

EventScript_162CDB:: @ 8162CDB
	trainerbattle 3, TRAINER_CHAMPION_TERRY_3, 0, Text_178E3F
	return

EventScript_162CE6:: @ 8162CE6
	trainerbattle 3, TRAINER_CHAMPION_TERRY_4, 0, Text_178E3F
	return

EventScript_162CF1:: @ 8162CF1
	trainerbattle 3, TRAINER_CHAMPION_TERRY_5, 0, Text_178E3F
	return

EventScript_162CFC:: @ 8162CFC
	trainerbattle 3, TRAINER_CHAMPION_TERRY_6, 0, Text_178E3F
	return

Movement_162D07:: @ 8162D07
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_162D12:: @ 8162D12
	step_1c
	step_12
	step_11
	step_11
	step_11
	step_13
	step_11
	step_11
	step_11
	step_11
	step_1b
	step_60
	step_end

Movement_162D1F:: @ 8162D1F
	step_1b
	step_2d
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_2f
	step_end

Movement_162D2A:: @ 8162D2A
	step_1c
	step_1c
	step_11
	step_11
	step_11
	step_11
	step_11
	step_12
	step_11
	step_11
	step_2d
	step_1c
	step_end

Movement_162D37:: @ 8162D37
	step_11
	step_11
	step_13
	step_11
	step_11
	step_11
	step_11
	step_1b
	step_60
	step_end

Movement_162D41:: @ 8162D41
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_1c
	step_2f
	step_end
