PokemonLeague_ChampionsRoom_MapScripts:: @ 8162AE2
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PokemonLeague_ChampionsRoom_OnWarp
	map_script MAP_SCRIPT_ON_RESUME, PokemonLeague_ChampionsRoom_OnResume
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PokemonLeague_ChampionsRoom_OnFrame
	.byte 0

PokemonLeague_ChampionsRoom_OnResume:: @ 8162AF2
	setvar VAR_0x8004, 4
	call EventScript_1A75D5
	compare VAR_STARTER_MON, 2
	call_if eq, EventScript_162B1E
	compare VAR_STARTER_MON, 1
	call_if eq, EventScript_162B31
	compare VAR_STARTER_MON, 0
	call_if eq, EventScript_162B44
	end

EventScript_162B1E:: @ 8162B1E
	checktrainerflag TRAINER_CHAMPION_FIRST_SQUIRTLE
	goto_if eq, EventScript_162B57
	checktrainerflag TRAINER_CHAMPION_REMATCH_SQUIRTLE
	goto_if eq, EventScript_162B57
	return

EventScript_162B31:: @ 8162B31
	checktrainerflag TRAINER_CHAMPION_FIRST_BULBASAUR
	goto_if eq, EventScript_162B57
	checktrainerflag TRAINER_CHAMPION_REMATCH_BULBASAUR
	goto_if eq, EventScript_162B57
	return

EventScript_162B44:: @ 8162B44
	checktrainerflag TRAINER_CHAMPION_FIRST_CHARMANDER
	goto_if eq, EventScript_162B57
	checktrainerflag TRAINER_CHAMPION_REMATCH_CHARMANDER
	goto_if eq, EventScript_162B57
	return

EventScript_162B57:: @ 8162B57
	setvar VAR_TEMP_1, 1
	return

PokemonLeague_ChampionsRoom_OnWarp:: @ 8162B5D
	map_script_2 VAR_TEMP_1, 0, EventScript_162B67
	.2byte 0

EventScript_162B67:: @ 8162B67
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
	end

PokemonLeague_ChampionsRoom_OnFrame:: @ 8162B6C
	map_script_2 VAR_TEMP_1, 0, EventScript_162B76
	.2byte 0

EventScript_162B76:: @ 8162B76
	lockall
	textcolor 0
	setflag FLAG_TEMP_2
	applymovement OBJ_EVENT_ID_PLAYER, Movement_162D07
	waitmovement 0
	delay 20
	checkflag FLAG_SYS_GAME_CLEAR
	call_if FALSE, EventScript_162CB3
	checkflag FLAG_SYS_GAME_CLEAR
	call_if TRUE, EventScript_162CBC
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_162C68
	setflag FLAG_TEMP_3
	setflag FLAG_TEMP_5
	savebgm MUS_WIN_GYM
	checkflag FLAG_SYS_CAN_LINK_WITH_RS
	call_if FALSE, EventScript_162C6F
	checkflag FLAG_SYS_CAN_LINK_WITH_RS
	call_if TRUE, EventScript_162C91
	setflag FLAG_TEMP_4
	clearflag FLAG_TEMP_5
	setflag FLAG_DEFEATED_CHAMP
	setflag FLAG_TEMP_4
	msgbox gUnknown_8178F2F
	playbgm MUS_SLOWMASARA, 0
	addobject 2
	msgbox gUnknown_8178FC6
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_162D1F
	applymovement 1, Movement_162D41
	applymovement 2, Movement_162D2A
	waitmovement 0
	delay 25
	specialvar VAR_RESULT, ScrSpecial_GetStarter
	getspeciesname 0, VAR_RESULT
	msgbox gUnknown_8178FCF
	applymovement 2, Movement_WalkInPlaceFastestRight
	applymovement 1, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox gUnknown_817908F
	closemessage
	applymovement 2, Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 20
	msgbox gUnknown_81791A3
	closemessage
	delay 13
	applymovement 2, Movement_162D37
	applymovement OBJ_EVENT_ID_PLAYER, Movement_162D12
	waitmovement 0
	setvar VAR_TEMP_1, 1
	warp MAP_POKEMON_LEAGUE_HALL_OF_FAME, 255, 5, 12
	waitstate
	releaseall
	end

EventScript_162C68:: @ 8162C68
	call EventScript_162B57
	releaseall
	end

EventScript_162C6F:: @ 8162C6F
	compare VAR_STARTER_MON, 2
	call_if eq, EventScript_162CC5
	compare VAR_STARTER_MON, 1
	call_if eq, EventScript_162CD0
	compare VAR_STARTER_MON, 0
	call_if eq, EventScript_162CDB
	return

EventScript_162C91:: @ 8162C91
	compare VAR_STARTER_MON, 2
	call_if eq, EventScript_162CE6
	compare VAR_STARTER_MON, 1
	call_if eq, EventScript_162CF1
	compare VAR_STARTER_MON, 0
	call_if eq, EventScript_162CFC
	return

EventScript_162CB3:: @ 8162CB3
	msgbox gUnknown_8178B6C
	return

EventScript_162CBC:: @ 8162CBC
	msgbox gUnknown_8178CD4
	return

EventScript_162CC5:: @ 8162CC5
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_CHAMPION_FIRST_SQUIRTLE, 0, Text_178E3F
	return

EventScript_162CD0:: @ 8162CD0
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_CHAMPION_FIRST_BULBASAUR, 0, Text_178E3F
	return

EventScript_162CDB:: @ 8162CDB
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_CHAMPION_FIRST_CHARMANDER, 0, Text_178E3F
	return

EventScript_162CE6:: @ 8162CE6
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_CHAMPION_REMATCH_SQUIRTLE, 0, Text_178E3F
	return

EventScript_162CF1:: @ 8162CF1
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_CHAMPION_REMATCH_BULBASAUR, 0, Text_178E3F
	return

EventScript_162CFC:: @ 8162CFC
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_CHAMPION_REMATCH_CHARMANDER, 0, Text_178E3F
	return

Movement_162D07:: @ 8162D07
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

Movement_162D12:: @ 8162D12
	delay_16
	walk_left
	walk_up
	walk_up
	walk_up
	walk_right
	walk_up
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	step_end

Movement_162D1F:: @ 8162D1F
	delay_8
	walk_in_place_fastest_down
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_left
	step_end

Movement_162D2A:: @ 8162D2A
	delay_16
	delay_16
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_up
	walk_up
	walk_in_place_fastest_down
	delay_16
	step_end

Movement_162D37:: @ 8162D37
	walk_up
	walk_up
	walk_right
	walk_up
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	step_end

Movement_162D41:: @ 8162D41
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_left
	step_end
