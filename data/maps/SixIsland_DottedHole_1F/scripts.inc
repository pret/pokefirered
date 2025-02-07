# 1 "data/maps/SixIsland_DottedHole_1F/scripts.pory"

# 2 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
SixIsland_DottedHole_1F_MapScripts::
# 3 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SixIsland_DottedHole_1F_OnTransition
# 4 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	.byte 0
# 5 "data/maps/SixIsland_DottedHole_1F/scripts.pory"

# 6 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
SixIsland_DottedHole_1F_OnTransition::
# 7 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_SIX_ISLAND_DOTTED_HOLE_1F
# 8 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	end
# 9 "data/maps/SixIsland_DottedHole_1F/scripts.pory"

# 10 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
SixIsland_DottedHole_B1F_EventScript_BrailleUp::
# 11 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	lockall
# 12 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	braillemessage Braille_Text_Up
# 13 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	waitbuttonpress
# 14 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	releaseall
# 15 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	end
# 16 "data/maps/SixIsland_DottedHole_1F/scripts.pory"

# 17 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
SixIsland_DottedHole_B4F_EventScript_BrailleDown::
# 18 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	lockall
# 19 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	braillemessage Braille_Text_Down
# 20 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	waitbuttonpress
# 21 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	releaseall
# 22 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	end
# 23 "data/maps/SixIsland_DottedHole_1F/scripts.pory"

# 24 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
SixIsland_DottedHole_B3F_EventScript_BrailleRight::
# 25 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	lockall
# 26 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	braillemessage Braille_Text_Right
# 27 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	waitbuttonpress
# 28 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	releaseall
# 29 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	end
# 30 "data/maps/SixIsland_DottedHole_1F/scripts.pory"

# 31 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
SixIsland_DottedHole_B2F_EventScript_BrailleLeft::
# 32 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	lockall
# 33 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	braillemessage Braille_Text_Left
# 34 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	waitbuttonpress
# 35 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	releaseall
# 36 "data/maps/SixIsland_DottedHole_1F/scripts.pory"
	end
