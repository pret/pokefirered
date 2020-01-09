Route18_MapScripts:: @ 81681F6
	map_script MAP_SCRIPT_ON_TRANSITION, Route18_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, Route18_OnWarp
	.byte 0

Route18_OnTransition:: @ 8168201
	compare VAR_MAP_SCENE_ROUTE16, 1
	call_if eq, EventScript_16820D
	end

EventScript_16820D:: @ 816820D
	setflag FLAG_SYS_ON_CYCLING_ROAD
	return

Route18_OnWarp:: @ 8168211
	map_script_2 VAR_MAP_SCENE_ROUTE16, 1, EventScript_16821B
	.2byte 0

EventScript_16821B:: @ 816821B
	special Special_ForcePlayerOntoBike
	end

Route18_EventScript_16821F:: @ 816821F
	msgbox gUnknown_8187757, 3
	end

Route18_EventScript_168228:: @ 8168228
	msgbox gUnknown_818777C, 3
	end
