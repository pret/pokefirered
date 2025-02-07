# 1 "data/maps/ThreeIsland_House2/scripts.pory"

# 2 "data/maps/ThreeIsland_House2/scripts.pory"
ThreeIsland_House2_MapScripts::
# 3 "data/maps/ThreeIsland_House2/scripts.pory"
	.byte 0
# 4 "data/maps/ThreeIsland_House2/scripts.pory"

# 5 "data/maps/ThreeIsland_House2/scripts.pory"
ThreeIsland_House2_EventScript_Man::
# 6 "data/maps/ThreeIsland_House2/scripts.pory"
	lock
# 7 "data/maps/ThreeIsland_House2/scripts.pory"
	faceplayer
# 8 "data/maps/ThreeIsland_House2/scripts.pory"
	famechecker FAMECHECKER_SABRINA, 1
# 9 "data/maps/ThreeIsland_House2/scripts.pory"
	msgbox ThreeIsland_House2_Text_IAdmireSabrina
# 10 "data/maps/ThreeIsland_House2/scripts.pory"
	release
# 11 "data/maps/ThreeIsland_House2/scripts.pory"
	end
# 12 "data/maps/ThreeIsland_House2/scripts.pory"

# 13 "data/maps/ThreeIsland_House2/scripts.pory"
ThreeIsland_House2_EventScript_Rocker::
# 14 "data/maps/ThreeIsland_House2/scripts.pory"
	msgbox ThreeIsland_House2_Text_CantMakeThisSpoonBend, MSGBOX_NPC
# 15 "data/maps/ThreeIsland_House2/scripts.pory"
	end
