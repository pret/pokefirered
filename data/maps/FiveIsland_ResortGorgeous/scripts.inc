# 1 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"

# 2 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
.equ LOCALID_SELPHY, 8
# 3 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"

# 4 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
FiveIsland_ResortGorgeous_MapScripts::
# 5 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, FiveIsland_ResortGorgeous_OnWarp
# 6 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, FiveIsland_ResortGorgeous_OnFrame
# 7 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	.byte 0
# 8 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"

# 9 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
FiveIsland_ResortGorgeous_OnWarp::
# 10 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	map_script_2 VAR_MAP_SCENE_FIVE_ISLAND_RESORT_GORGEOUS, 1, FiveIsland_ResortGorgeous_EventScript_TurnPlayerNorth
# 11 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	.2byte 0
# 12 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"

# 13 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
FiveIsland_ResortGorgeous_EventScript_TurnPlayerNorth::
# 14 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
# 15 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	end
# 16 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"

# 17 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
FiveIsland_ResortGorgeous_OnFrame::
# 18 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	map_script_2 VAR_MAP_SCENE_FIVE_ISLAND_RESORT_GORGEOUS, 1, FiveIsland_ResortGorgeous_EventScript_SelphyReturnHomeScene
# 19 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	.2byte 0
# 20 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"

# 21 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
FiveIsland_ResortGorgeous_EventScript_SelphyReturnHomeScene::
# 22 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	lockall
# 23 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 24 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_Text_SelphyThanksYouMayGoNow
# 25 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	closemessage
# 26 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	applymovement LOCALID_SELPHY, Common_Movement_WalkInPlaceFasterUp
# 27 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	waitmovement 0
# 28 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	opendoor 39, 8
# 29 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	waitdooranim
# 30 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	applymovement LOCALID_SELPHY, FiveIsland_ResortGorgeous_Movement_SelphyEnterHome
# 31 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	waitmovement 0
# 32 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	closedoor 39, 8
# 33 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	waitdooranim
# 34 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	removeobject LOCALID_SELPHY
# 35 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	clearflag FLAG_HIDE_RESORT_GORGEOUS_INSIDE_SELPHY
# 36 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	setvar VAR_MAP_SCENE_FIVE_ISLAND_RESORT_GORGEOUS, 2
# 37 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	releaseall
# 38 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	end
# 39 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"

# 40 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
FiveIsland_ResortGorgeous_Movement_SelphyEnterHome::
# 41 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	walk_up
# 42 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	set_invisible
# 43 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	step_end
# 44 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"

# 45 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
FiveIsland_ResortGorgeous_EventScript_SelphysHouseSign::
# 46 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	msgbox FiveIsland_ResortGorgeous_Text_SelphysHouse, MSGBOX_SIGN
# 47 "data/maps/FiveIsland_ResortGorgeous/scripts.pory"
	end
