# 1 "data/maps/ThreeIsland_House1/scripts.pory"

# 2 "data/maps/ThreeIsland_House1/scripts.pory"
ThreeIsland_House1_MapScripts::
# 3 "data/maps/ThreeIsland_House1/scripts.pory"
	.byte 0
# 4 "data/maps/ThreeIsland_House1/scripts.pory"

# 5 "data/maps/ThreeIsland_House1/scripts.pory"
ThreeIsland_House1_EventScript_Lostelle::
# 6 "data/maps/ThreeIsland_House1/scripts.pory"
	lock
# 7 "data/maps/ThreeIsland_House1/scripts.pory"
	faceplayer
# 8 "data/maps/ThreeIsland_House1/scripts.pory"
	special BufferBigGuyOrBigGirlString
# 9 "data/maps/ThreeIsland_House1/scripts.pory"
	msgbox ThreeIsland_House1_Text_YoureAlwaysSoCool
# 10 "data/maps/ThreeIsland_House1/scripts.pory"
	release
# 11 "data/maps/ThreeIsland_House1/scripts.pory"
	end
# 12 "data/maps/ThreeIsland_House1/scripts.pory"

# 13 "data/maps/ThreeIsland_House1/scripts.pory"
ThreeIsland_House1_EventScript_DisplayCase::
# 14 "data/maps/ThreeIsland_House1/scripts.pory"
	msgbox ThreeIsland_House1_Text_RareRocksGemsDisplayed, MSGBOX_SIGN
# 15 "data/maps/ThreeIsland_House1/scripts.pory"
	end
