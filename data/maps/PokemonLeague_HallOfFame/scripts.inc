# 1 "data/maps/PokemonLeague_HallOfFame/scripts.pory"

# 2 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
.set LOCALID_PROF_OAK, 1
# 3 "data/maps/PokemonLeague_HallOfFame/scripts.pory"

# 4 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
PokemonLeague_HallOfFame_MapScripts::
# 5 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PokemonLeague_HallOfFame_OnFrame
# 6 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PokemonLeague_HallOfFame_OnWarp
# 7 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	.byte 0
# 8 "data/maps/PokemonLeague_HallOfFame/scripts.pory"

# 9 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
PokemonLeague_HallOfFame_OnWarp::
# 10 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	map_script_2 VAR_TEMP_1, 0, PokemonLeague_HallOfFame_EventScript_TurnPlayerNorth
# 11 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	.2byte 0
# 12 "data/maps/PokemonLeague_HallOfFame/scripts.pory"

# 13 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
PokemonLeague_HallOfFame_EventScript_TurnPlayerNorth::
# 14 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
# 15 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	end
# 16 "data/maps/PokemonLeague_HallOfFame/scripts.pory"

# 17 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
PokemonLeague_HallOfFame_OnFrame::
# 18 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	map_script_2 VAR_TEMP_1, 0, PokemonLeague_HallOfFame_EventScript_EnterRoom
# 19 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	.2byte 0
# 20 "data/maps/PokemonLeague_HallOfFame/scripts.pory"

# 21 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
PokemonLeague_HallOfFame_EventScript_EnterRoom::
# 22 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	lockall
# 23 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 24 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, PokemonLeague_HallOfFame_Movement_EnterRoom
# 25 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	waitmovement 0
# 26 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterLeft
# 27 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 28 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	waitmovement 0
# 29 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	delay 18
# 30 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	msgbox PokemonLeague_HallOfFame_Text_OakCongratulations
# 31 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	closemessage
# 32 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	applymovement LOCALID_PROF_OAK, Common_Movement_WalkInPlaceFasterUp
# 33 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 34 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	waitmovement 0
# 35 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	delay 20
# 36 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	dofieldeffect FLDEFF_HALL_OF_FAME_RECORD
# 37 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	waitfieldeffect FLDEFF_HALL_OF_FAME_RECORD
# 38 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	delay 40
# 39 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	setvar VAR_TEMP_1, 1
# 40 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	call EventScript_SetDefeatedEliteFourFlagsVars
# 41 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	setrespawn SPAWN_PALLET_TOWN
# 42 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	fadescreenspeed FADE_TO_BLACK, 24
# 43 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	special EnterHallOfFame
# 44 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	waitstate
# 45 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	releaseall
# 46 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	end
# 47 "data/maps/PokemonLeague_HallOfFame/scripts.pory"

# 48 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
PokemonLeague_HallOfFame_Movement_EnterRoom::
# 49 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	walk_up
# 50 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	walk_up
# 51 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	walk_up
# 52 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	walk_up
# 53 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	walk_up
# 54 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	walk_up
# 55 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	walk_up
# 56 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	walk_up
# 57 "data/maps/PokemonLeague_HallOfFame/scripts.pory"
	step_end
