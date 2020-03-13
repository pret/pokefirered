FiveIsland_MapScripts:: @ 8167E8E
	map_script MAP_SCRIPT_ON_TRANSITION, FiveIsland_OnTransition
	.byte 0

FiveIsland_OnTransition:: @ 8167E94
	setworldmapflag FLAG_WORLD_MAP_FIVE_ISLAND
	end

FiveIsland_EventScript_IslandSign:: @ 8167E98
	msgbox FiveIsland_Text_IslandSign, MSGBOX_SIGN
	end

FiveIsland_EventScript_BugCatcher:: @ 8167EA1
	msgbox FiveIsland_Text_WeirdBuildingInMeadow, MSGBOX_NPC
	end

FiveIsland_EventScript_Fisher:: @ 8167EAA
	msgbox FiveIsland_Text_BeenGettingBusierAroundHere, MSGBOX_NPC
	end
