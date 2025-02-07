# 1 "data/maps/Route18/scripts.pory"

# 2 "data/maps/Route18/scripts.pory"
Route18_MapScripts::
# 3 "data/maps/Route18/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, Route18_OnTransition
# 4 "data/maps/Route18/scripts.pory"
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, Route18_OnWarp
# 5 "data/maps/Route18/scripts.pory"
	.byte 0
# 6 "data/maps/Route18/scripts.pory"

# 7 "data/maps/Route18/scripts.pory"
Route18_OnTransition::
# 8 "data/maps/Route18/scripts.pory"
	call_if_eq VAR_MAP_SCENE_ROUTE16, 1, Route18_OnTransitionCyclingRoad
# 9 "data/maps/Route18/scripts.pory"
	end
# 10 "data/maps/Route18/scripts.pory"

# 11 "data/maps/Route18/scripts.pory"
Route18_OnTransitionCyclingRoad::
# 12 "data/maps/Route18/scripts.pory"
	setflag FLAG_SYS_ON_CYCLING_ROAD
# 13 "data/maps/Route18/scripts.pory"
	return
# 14 "data/maps/Route18/scripts.pory"

# 15 "data/maps/Route18/scripts.pory"
Route18_OnWarp::
# 16 "data/maps/Route18/scripts.pory"
	map_script_2 VAR_MAP_SCENE_ROUTE16, 1, Route18_OnWarpCyclingRoad
# 17 "data/maps/Route18/scripts.pory"
	.2byte 0
# 18 "data/maps/Route18/scripts.pory"

# 19 "data/maps/Route18/scripts.pory"
Route18_OnWarpCyclingRoad::
# 20 "data/maps/Route18/scripts.pory"
	special ForcePlayerOntoBike
# 21 "data/maps/Route18/scripts.pory"
	end
# 22 "data/maps/Route18/scripts.pory"

# 23 "data/maps/Route18/scripts.pory"
Route18_EventScript_RouteSign::
# 24 "data/maps/Route18/scripts.pory"
	msgbox Route18_Text_RouteSign, MSGBOX_SIGN
# 25 "data/maps/Route18/scripts.pory"
	end
# 26 "data/maps/Route18/scripts.pory"

# 27 "data/maps/Route18/scripts.pory"
Route18_EventScript_CyclingRoadSign::
# 28 "data/maps/Route18/scripts.pory"
	msgbox Route18_Text_CyclingRoadSign, MSGBOX_SIGN
# 29 "data/maps/Route18/scripts.pory"
	end
