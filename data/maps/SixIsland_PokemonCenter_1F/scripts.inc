SixIsland_PokemonCenter_1F_MapScripts:: @ 8171D6A
	map_script MAP_SCRIPT_ON_TRANSITION, SixIsland_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, SixIsland_PokemonCenter_1F_MapScript2_1BC05C
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SixIsland_PokemonCenter_1F_OnFrame
	.byte 0

SixIsland_PokemonCenter_1F_OnTransition:: @ 8171D7A
	setrespawn SPAWN_SIX_ISLAND
	compare VAR_MAP_SCENE_SIX_ISLAND_POKEMON_CENTER_1F, 0
	call_if eq, EventScript_171D89
	end

EventScript_171D89:: @ 8171D89
	clearflag FLAG_HIDE_SIX_ISLAND_POKECENTER_RIVAL
	return

SixIsland_PokemonCenter_1F_OnFrame:: @ 8171D8D
	map_script_2 VAR_MAP_SCENE_SIX_ISLAND_POKEMON_CENTER_1F, 0, EventScript_171D97
	.2byte 0

EventScript_171D97:: @ 8171D97
	lockall
	textcolor 0
	applymovement 2, Movement_1A75ED
	waitmovement 0
	playbgm MUS_RIVAL1, 0
	applymovement 2, Movement_1A75DB
	waitmovement 0
	applymovement 2, Movement_1A75DD
	waitmovement 0
	delay 25
	applymovement 2, Movement_171DF9
	waitmovement 0
	msgbox gUnknown_81A3F30
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_171E02
	applymovement 2, Movement_171DFE
	waitmovement 0
	fadedefaultbgm
	playse SE_KAIDAN
	delay 35
	removeobject 2
	setvar VAR_MAP_SCENE_SIX_ISLAND_POKEMON_CENTER_1F, 1
	setvar VAR_MAP_SCENE_FOUR_ISLAND, 1
	releaseall
	end

Movement_171DF9:: @ 8171DF9
	step_13
	step_13
	step_10
	step_10
	step_end

Movement_171DFE:: @ 8171DFE
	step_1c
	step_1a
	step_10
	step_end

Movement_171E02:: @ 8171E02
	step_12
	step_30
	step_end

SixIsland_PokemonCenter_1F_EventScript_171E05:: @ 8171E05
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

SixIsland_PokemonCenter_1F_EventScript_171E0E:: @ 8171E0E
	msgbox gUnknown_81A3E02, 2
	end

SixIsland_PokemonCenter_1F_EventScript_171E17:: @ 8171E17
	msgbox gUnknown_81A3E87, 2
	end
