# 1 "data/maps/SixIsland/scripts.pory"

# 2 "data/maps/SixIsland/scripts.pory"
SixIsland_MapScripts::
# 3 "data/maps/SixIsland/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SixIsland_OnTransition
# 4 "data/maps/SixIsland/scripts.pory"
	.byte 0
# 5 "data/maps/SixIsland/scripts.pory"

# 6 "data/maps/SixIsland/scripts.pory"
SixIsland_OnTransition::
# 7 "data/maps/SixIsland/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_SIX_ISLAND
# 8 "data/maps/SixIsland/scripts.pory"
	end
# 9 "data/maps/SixIsland/scripts.pory"

# 10 "data/maps/SixIsland/scripts.pory"
SixIsland_EventScript_Hiker::
# 11 "data/maps/SixIsland/scripts.pory"
	msgbox SixIsland_Text_ThatWayToWaterPathRuinValley, MSGBOX_NPC
# 12 "data/maps/SixIsland/scripts.pory"
	end
# 13 "data/maps/SixIsland/scripts.pory"

# 14 "data/maps/SixIsland/scripts.pory"
SixIsland_EventScript_Boy::
# 15 "data/maps/SixIsland/scripts.pory"
	msgbox SixIsland_Text_SkyAtNightIsFantastic, MSGBOX_NPC
# 16 "data/maps/SixIsland/scripts.pory"
	end
# 17 "data/maps/SixIsland/scripts.pory"

# 18 "data/maps/SixIsland/scripts.pory"
SixIsland_EventScript_IslandSign::
# 19 "data/maps/SixIsland/scripts.pory"
	msgbox SixIsland_Text_IslandSign, MSGBOX_SIGN
# 20 "data/maps/SixIsland/scripts.pory"
	end
