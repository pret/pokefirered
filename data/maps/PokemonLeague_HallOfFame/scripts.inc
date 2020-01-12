PokemonLeague_HallOfFame_MapScripts:: @ 8162D4C
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PokemonLeague_HallOfFame_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PokemonLeague_HallOfFame_OnWarp
	.byte 0

PokemonLeague_HallOfFame_OnWarp:: @ 8162D57
	map_script_2 VAR_TEMP_1, 0, EventScript_162D61
	.2byte 0

EventScript_162D61:: @ 8162D61
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
	end

PokemonLeague_HallOfFame_OnFrame:: @ 8162D66
	map_script_2 VAR_TEMP_1, 0, EventScript_162D70
	.2byte 0

EventScript_162D70:: @ 8162D70
	lockall
	textcolor 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_162DCD
	waitmovement 0
	applymovement 1, Movement_WalkInPlaceFastestLeft
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	delay 18
	msgbox gUnknown_817922F
	closemessage
	applymovement 1, Movement_WalkInPlaceFastestUp
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	dofieldeffect 62
	waitfieldeffect 62
	delay 40
	setvar VAR_TEMP_1, 1
	call EventScript_1A651A
	setrespawn SPAWN_PALLET_TOWN
	fadescreenspeed FADE_TO_BLACK, 24
	special Special_HallOfFame
	waitstate
	releaseall
	end

Movement_162DCD:: @ 8162DCD
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end
