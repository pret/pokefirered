PokemonLeague_AgathasRoom_MapScripts:: @ 8162810
	map_script MAP_SCRIPT_ON_RESUME, PokemonLeague_AgathasRoom_OnResume
	map_script MAP_SCRIPT_ON_LOAD, PokemonLeague_AgathasRoom_OnLoad
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PokemonLeague_AgathasRoom_OnWarp
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PokemonLeague_AgathasRoom_OnFrame
	.byte 0

PokemonLeague_AgathasRoom_OnResume:: @ 8162825
	setvar VAR_0x8004, 2
	call PokemonLeague_EventScript_DoLightingEffect
	end

PokemonLeague_AgathasRoom_OnLoad:: @ 8162830
	call_if_set FLAG_DEFEATED_AGATHA, PokemonLeague_AgathasRoom_EventScript_SetDoorOpen
	compare VAR_MAP_SCENE_POKEMON_LEAGUE, 3
	call_if_eq PokemonLeague_AgathasRoom_EventScript_CloseEntry
	end

PokemonLeague_AgathasRoom_EventScript_CloseEntry:: @ 8162845
	call PokemonLeague_EventScript_CloseEntry
	return

PokemonLeague_AgathasRoom_EventScript_SetDoorOpen:: @ 816284B
	call PokemonLeague_EventScript_SetDoorOpen
	return

PokemonLeague_AgathasRoom_OnWarp:: @ 8162851
	map_script_2 VAR_TEMP_1, 0, PokemonLeague_AgathasRoom_EventScript_TurnPlayerNorth
	.2byte 0

PokemonLeague_AgathasRoom_EventScript_TurnPlayerNorth:: @ 816285B
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
	end

PokemonLeague_AgathasRoom_OnFrame:: @ 8162860
	map_script_2 VAR_MAP_SCENE_POKEMON_LEAGUE, 2, PokemonLeague_AgathasRoom_EventScript_EnterRoom
	.2byte 0

PokemonLeague_AgathasRoom_EventScript_EnterRoom:: @ 816286A
	lockall
	call PokemonLeague_EventScript_EnterRoom
	setvar VAR_MAP_SCENE_POKEMON_LEAGUE, 3
	releaseall
	end

PokemonLeague_AgathasRoom_EventScript_Agatha:: @ 8162877
	lock
	faceplayer
	famechecker FAMECHECKER_AGATHA, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
	goto_if_set FLAG_DEFEATED_AGATHA, PokemonLeague_AgathasRoom_EventScript_PostBattle
	famechecker FAMECHECKER_AGATHA, 0
	famechecker FAMECHECKER_AGATHA, 4
	famechecker FAMECHECKER_OAK, 4
	call_if_unset FLAG_SYS_GAME_CLEAR, PokemonLeague_AgathasRoom_EventScript_Intro
	call_if_set FLAG_SYS_GAME_CLEAR, PokemonLeague_AgathasRoom_EventScript_RematchIntro
	setflag FLAG_TEMP_3
	setflag FLAG_TEMP_5
	call_if_unset FLAG_SYS_CAN_LINK_WITH_RS, PokemonLeague_AgathasRoom_EventScript_Battle
	call_if_set FLAG_SYS_CAN_LINK_WITH_RS, PokemonLeague_AgathasRoom_EventScript_Rematch
	clearflag FLAG_TEMP_5
	goto PokemonLeague_AgathasRoom_EventScript_DefeatedAgatha
	end

PokemonLeague_AgathasRoom_EventScript_Intro:: @ 81628E9
	msgbox PokemonLeague_AgathasRoom_Text_Intro
	return

PokemonLeague_AgathasRoom_EventScript_RematchIntro:: @ 81628F2
	msgbox PokemonLeague_AgathasRoom_Text_RematchIntro
	return

PokemonLeague_AgathasRoom_EventScript_Battle:: @ 81628FB
	trainerbattle_no_intro TRAINER_ELITE_FOUR_AGATHA, PokemonLeague_AgathasRoom_Text_Defeat
	return

PokemonLeague_AgathasRoom_EventScript_Rematch:: @ 8162906
	trainerbattle_no_intro TRAINER_ELITE_FOUR_AGATHA_2, PokemonLeague_AgathasRoom_Text_Defeat
	return

PokemonLeague_AgathasRoom_EventScript_PostBattle:: @ 8162911
	msgbox PokemonLeague_AgathasRoom_Text_PostBattle
	release
	end

PokemonLeague_AgathasRoom_EventScript_DefeatedAgatha:: @ 816291B
	setflag FLAG_DEFEATED_AGATHA
	call PokemonLeague_EventScript_OpenDoor
	msgbox PokemonLeague_AgathasRoom_Text_PostBattle
	release
	end
