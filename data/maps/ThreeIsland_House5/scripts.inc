# 1 "data/maps/ThreeIsland_House5/scripts.pory"

# 2 "data/maps/ThreeIsland_House5/scripts.pory"
ThreeIsland_House5_MapScripts::
# 3 "data/maps/ThreeIsland_House5/scripts.pory"
	.byte 0
# 4 "data/maps/ThreeIsland_House5/scripts.pory"

# 5 "data/maps/ThreeIsland_House5/scripts.pory"
ThreeIsland_House5_EventScript_LittleGirl::
# 6 "data/maps/ThreeIsland_House5/scripts.pory"
	lock
# 7 "data/maps/ThreeIsland_House5/scripts.pory"
	faceplayer
# 8 "data/maps/ThreeIsland_House5/scripts.pory"
	goto_if_set FLAG_RESCUED_LOSTELLE, ThreeIsland_House5_EventScript_LittleGirlLostelleFound
# 9 "data/maps/ThreeIsland_House5/scripts.pory"
	msgbox ThreeIsland_House5_Text_ImNotLostelle
# 10 "data/maps/ThreeIsland_House5/scripts.pory"
	release
# 11 "data/maps/ThreeIsland_House5/scripts.pory"
	end
# 12 "data/maps/ThreeIsland_House5/scripts.pory"

# 13 "data/maps/ThreeIsland_House5/scripts.pory"
ThreeIsland_House5_EventScript_LittleGirlLostelleFound::
# 14 "data/maps/ThreeIsland_House5/scripts.pory"
	msgbox ThreeIsland_House5_Text_IllGoPlayWithLostelle
# 15 "data/maps/ThreeIsland_House5/scripts.pory"
	release
# 16 "data/maps/ThreeIsland_House5/scripts.pory"
	end
