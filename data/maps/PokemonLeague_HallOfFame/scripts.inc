.set LOCALID_PROF_OAK, 1

PokemonLeague_HallOfFame_MapScripts::
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PokemonLeague_HallOfFame_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PokemonLeague_HallOfFame_OnWarp
	.byte 0

PokemonLeague_HallOfFame_OnWarp::
	map_script_2 VAR_TEMP_1, 0, PokemonLeague_HallOfFame_EventScript_TurnPlayerNorth
	.2byte 0

PokemonLeague_HallOfFame_EventScript_TurnPlayerNorth::
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
	end

PokemonLeague_HallOfFame_OnFrame::
	map_script_2 VAR_TEMP_1, 0, PokemonLeague_HallOfFame_EventScript_EnterRoom
	.2byte 0

PokemonLeague_HallOfFame_EventScript_EnterRoom::
	lockall
	textcolor NPC_TEXT_COLOR_MALE
	applymovement OBJ_EVENT_ID_PLAYER, PokemonLeague_HallOfFame_Movement_EnterRoom
	waitmovement 0
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterLeft
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
	waitmovement 0
	delay 18
	msgbox PokemonLeague_HallOfFame_Text_OakCongratulations
	closemessage
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterUp
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
	waitmovement 0
	delay 20
	dofieldeffect FLDEFF_HALL_OF_FAME_RECORD
	waitfieldeffect FLDEFF_HALL_OF_FAME_RECORD
	delay 40
	setvar VAR_TEMP_1, 1
	call EventScript_SetDefeatedEliteFourFlagsVars
	setrespawn SPAWN_PALLET_TOWN
	fadescreenspeed FADE_TO_BLACK, 24
	special EnterHallOfFame
	waitstate
	releaseall
	end

PokemonLeague_HallOfFame_Movement_EnterRoom::
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end
