# 1 "data/maps/OneIsland_Harbor/scripts.pory"

# 2 "data/maps/OneIsland_Harbor/scripts.pory"
OneIsland_Harbor_MapScripts::
# 3 "data/maps/OneIsland_Harbor/scripts.pory"
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, OneIsland_Harbor_OnWarp
# 4 "data/maps/OneIsland_Harbor/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, OneIsland_Harbor_OnFrame
# 5 "data/maps/OneIsland_Harbor/scripts.pory"
	.byte 0
# 6 "data/maps/OneIsland_Harbor/scripts.pory"

# 7 "data/maps/OneIsland_Harbor/scripts.pory"
OneIsland_Harbor_OnWarp::
# 8 "data/maps/OneIsland_Harbor/scripts.pory"
	map_script_2 VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 1, OneIsland_Harbor_EventScript_TurnPlayerNorth
# 9 "data/maps/OneIsland_Harbor/scripts.pory"
	.2byte 0
# 10 "data/maps/OneIsland_Harbor/scripts.pory"

# 11 "data/maps/OneIsland_Harbor/scripts.pory"
OneIsland_Harbor_EventScript_TurnPlayerNorth::
# 12 "data/maps/OneIsland_Harbor/scripts.pory"
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
# 13 "data/maps/OneIsland_Harbor/scripts.pory"
	end
# 14 "data/maps/OneIsland_Harbor/scripts.pory"

# 15 "data/maps/OneIsland_Harbor/scripts.pory"
OneIsland_Harbor_OnFrame::
# 16 "data/maps/OneIsland_Harbor/scripts.pory"
	map_script_2 VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 1, OneIsland_Harbor_EventScript_PlayerEnterHarborFirstTime
# 17 "data/maps/OneIsland_Harbor/scripts.pory"
	.2byte 0
# 18 "data/maps/OneIsland_Harbor/scripts.pory"

# 19 "data/maps/OneIsland_Harbor/scripts.pory"
OneIsland_Harbor_EventScript_PlayerEnterHarborFirstTime::
# 20 "data/maps/OneIsland_Harbor/scripts.pory"
	lockall
# 21 "data/maps/OneIsland_Harbor/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 22 "data/maps/OneIsland_Harbor/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, OneIsland_Harbor_Movement_PlayerExitHarbor
# 23 "data/maps/OneIsland_Harbor/scripts.pory"
	waitmovement 0
# 24 "data/maps/OneIsland_Harbor/scripts.pory"
	setvar VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 2
# 25 "data/maps/OneIsland_Harbor/scripts.pory"
	warp MAP_ONE_ISLAND, 12, 18
# 26 "data/maps/OneIsland_Harbor/scripts.pory"
	waitstate
# 27 "data/maps/OneIsland_Harbor/scripts.pory"
	releaseall
# 28 "data/maps/OneIsland_Harbor/scripts.pory"
	end
# 29 "data/maps/OneIsland_Harbor/scripts.pory"

# 30 "data/maps/OneIsland_Harbor/scripts.pory"
OneIsland_Harbor_Movement_PlayerExitHarbor::
# 31 "data/maps/OneIsland_Harbor/scripts.pory"
	walk_up
# 32 "data/maps/OneIsland_Harbor/scripts.pory"
	walk_up
# 33 "data/maps/OneIsland_Harbor/scripts.pory"
	walk_up
# 34 "data/maps/OneIsland_Harbor/scripts.pory"
	step_end
# 35 "data/maps/OneIsland_Harbor/scripts.pory"

# 36 "data/maps/OneIsland_Harbor/scripts.pory"
OneIsland_Harbor_EventScript_Sailor::
# 37 "data/maps/OneIsland_Harbor/scripts.pory"
	lock
# 38 "data/maps/OneIsland_Harbor/scripts.pory"
	faceplayer
# 39 "data/maps/OneIsland_Harbor/scripts.pory"
	message Text_WhereDoYouWantToSail
# 40 "data/maps/OneIsland_Harbor/scripts.pory"
	waitmessage
# 41 "data/maps/OneIsland_Harbor/scripts.pory"
	setvar VAR_0x8004, SEAGALLOP_ONE_ISLAND
# 42 "data/maps/OneIsland_Harbor/scripts.pory"
	goto EventScript_ChooseDestFromOneIsland
# 43 "data/maps/OneIsland_Harbor/scripts.pory"
	end
