# 1 "data/maps/FiveIsland/scripts.pory"

# 2 "data/maps/FiveIsland/scripts.pory"
FiveIsland_MapScripts::
# 3 "data/maps/FiveIsland/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, FiveIsland_OnTransition
# 4 "data/maps/FiveIsland/scripts.pory"
	.byte 0
# 5 "data/maps/FiveIsland/scripts.pory"

# 6 "data/maps/FiveIsland/scripts.pory"
FiveIsland_OnTransition::
# 7 "data/maps/FiveIsland/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_FIVE_ISLAND
# 8 "data/maps/FiveIsland/scripts.pory"
	end
# 9 "data/maps/FiveIsland/scripts.pory"

# 10 "data/maps/FiveIsland/scripts.pory"
FiveIsland_EventScript_IslandSign::
# 11 "data/maps/FiveIsland/scripts.pory"
	msgbox FiveIsland_Text_IslandSign, MSGBOX_SIGN
# 12 "data/maps/FiveIsland/scripts.pory"
	end
# 13 "data/maps/FiveIsland/scripts.pory"

# 14 "data/maps/FiveIsland/scripts.pory"
FiveIsland_EventScript_BugCatcher::
# 15 "data/maps/FiveIsland/scripts.pory"
	msgbox FiveIsland_Text_WeirdBuildingInMeadow, MSGBOX_NPC
# 16 "data/maps/FiveIsland/scripts.pory"
	end
# 17 "data/maps/FiveIsland/scripts.pory"

# 18 "data/maps/FiveIsland/scripts.pory"
FiveIsland_EventScript_Fisher::
# 19 "data/maps/FiveIsland/scripts.pory"
	msgbox FiveIsland_Text_BeenGettingBusierAroundHere, MSGBOX_NPC
# 20 "data/maps/FiveIsland/scripts.pory"
	end
