PokemonLeague_BrunosRoom_MapScripts:: @ 8162685
	map_script MAP_SCRIPT_ON_RESUME, PokemonLeague_BrunosRoom_OnResume
	map_script MAP_SCRIPT_ON_LOAD, PokemonLeague_BrunosRoom_OnLoad
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PokemonLeague_BrunosRoom_OnWarp
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PokemonLeague_BrunosRoom_OnFrame
	.byte 0

PokemonLeague_BrunosRoom_OnResume:: @ 816269A
	setvar VAR_0x8004, 1
	call EventScript_1A75D5
	end

PokemonLeague_BrunosRoom_OnLoad:: @ 81626A5
	checkflag FLAG_DEFEATED_BRUNO
	call_if TRUE, EventScript_1626C0
	compare VAR_MAP_SCENE_POKEMON_LEAGUE, 2
	call_if eq, EventScript_1626BA
	end

EventScript_1626BA:: @ 81626BA
	call EventScript_1A759C
	return

EventScript_1626C0:: @ 81626C0
	call EventScript_1A7538
	return

PokemonLeague_BrunosRoom_OnWarp:: @ 81626C6
	map_script_2 VAR_TEMP_1, 0, EventScript_1626D0
	.2byte 0

EventScript_1626D0:: @ 81626D0
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
	end

PokemonLeague_BrunosRoom_OnFrame:: @ 81626D5
	map_script_2 VAR_MAP_SCENE_POKEMON_LEAGUE, 1, EventScript_1626DF
	.2byte 0

EventScript_1626DF:: @ 81626DF
	lockall
	call EventScript_1A751F
	setvar VAR_MAP_SCENE_POKEMON_LEAGUE, 2
	releaseall
	end

PokemonLeague_BrunosRoom_EventScript_1626EC:: @ 81626EC
	lock
	faceplayer
	famechecker FAMECHECKER_BRUNO, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	checkflag FLAG_DEFEATED_BRUNO
	goto_if TRUE, EventScript_162779
	famechecker FAMECHECKER_BRUNO, 0
	famechecker FAMECHECKER_BRUNO, 1
	checkflag FLAG_SYS_GAME_CLEAR
	call_if FALSE, EventScript_162751
	checkflag FLAG_SYS_GAME_CLEAR
	call_if TRUE, EventScript_16275A
	setflag FLAG_TEMP_3
	setflag FLAG_TEMP_5
	checkflag FLAG_SYS_CAN_LINK_WITH_RS
	call_if FALSE, EventScript_162763
	checkflag FLAG_SYS_CAN_LINK_WITH_RS
	call_if TRUE, EventScript_16276E
	clearflag FLAG_TEMP_5
	goto EventScript_1627B0

EventScript_162750:: @ 8162750
	end

EventScript_162751:: @ 8162751
	msgbox gUnknown_817820F
	return

EventScript_16275A:: @ 816275A
	msgbox gUnknown_817830C
	return

EventScript_162763:: @ 8162763
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_ELITE_FOUR_BRUNO, 0, Text_178409
	return

EventScript_16276E:: @ 816276E
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, TRAINER_ELITE_FOUR_BRUNO_2, 0, Text_178409
	return

EventScript_162779:: @ 8162779
	msgbox gUnknown_8178420
	closemessage
	compare VAR_FACING, DIR_NORTH
	call_if eq, EventScript_1627FA
	compare VAR_FACING, DIR_SOUTH
	call_if eq, EventScript_1627EF
	compare VAR_FACING, DIR_WEST
	call_if eq, EventScript_162805
	compare VAR_FACING, DIR_EAST
	call_if eq, EventScript_162805
	release
	end

EventScript_1627B0:: @ 81627B0
	setflag FLAG_DEFEATED_BRUNO
	call EventScript_1A7506
	msgbox gUnknown_8178420
	closemessage
	compare VAR_FACING, DIR_NORTH
	call_if eq, EventScript_1627FA
	compare VAR_FACING, DIR_SOUTH
	call_if eq, EventScript_1627EF
	compare VAR_FACING, DIR_WEST
	call_if eq, EventScript_162805
	compare VAR_FACING, DIR_EAST
	call_if eq, EventScript_162805
	release
	end

EventScript_1627EF:: @ 81627EF
	applymovement 1, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

EventScript_1627FA:: @ 81627FA
	applymovement 1, Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

EventScript_162805:: @ 8162805
	applymovement 1, Movement_WalkInPlaceFastestDown
	waitmovement 0
	return
