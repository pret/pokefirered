Route18_MapScripts:: @ 81681F6
	map_script MAP_SCRIPT_ON_TRANSITION, Route18_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, Route18_OnWarp
	.byte 0

Route18_OnTransition:: @ 8168201
	compare VAR_MAP_SCENE_ROUTE16, 1
	call_if_eq Route18_OnTransitionCyclingRoad
	end

Route18_OnTransitionCyclingRoad:: @ 816820D
	setflag FLAG_SYS_ON_CYCLING_ROAD
	return

Route18_OnWarp:: @ 8168211
	map_script_2 VAR_MAP_SCENE_ROUTE16, 1, Route18_OnWarpCyclingRoad
	.2byte 0

Route18_OnWarpCyclingRoad:: @ 816821B
	special ForcePlayerOntoBike
	end

Route18_EventScript_RouteSign:: @ 816821F
	msgbox Route18_Text_RouteSign, MSGBOX_SIGN
	end

Route18_EventScript_CyclingRoadSign:: @ 8168228
	msgbox Route18_Text_CyclingRoadSign, MSGBOX_SIGN
	end
