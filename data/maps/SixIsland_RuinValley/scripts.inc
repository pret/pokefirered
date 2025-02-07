# 1 "data/maps/SixIsland_RuinValley/scripts.pory"

# 2 "data/maps/SixIsland_RuinValley/scripts.pory"
.set LOCALID_SCIENTIST, 1
# 3 "data/maps/SixIsland_RuinValley/scripts.pory"

# 4 "data/maps/SixIsland_RuinValley/scripts.pory"
SixIsland_RuinValley_MapScripts::
# 5 "data/maps/SixIsland_RuinValley/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, SixIsland_RuinValley_OnLoad
# 6 "data/maps/SixIsland_RuinValley/scripts.pory"
	.byte 0
# 7 "data/maps/SixIsland_RuinValley/scripts.pory"

# 8 "data/maps/SixIsland_RuinValley/scripts.pory"
SixIsland_RuinValley_OnLoad::
# 9 "data/maps/SixIsland_RuinValley/scripts.pory"
	call_if_set FLAG_USED_CUT_ON_RUIN_VALLEY_BRAILLE, SixIsland_RuinValley_EventScript_OpenDottedHoleDoor
# 10 "data/maps/SixIsland_RuinValley/scripts.pory"
	end
# 11 "data/maps/SixIsland_RuinValley/scripts.pory"

# 12 "data/maps/SixIsland_RuinValley/scripts.pory"
SixIsland_RuinValley_EventScript_OpenDottedHoleDoor::
# 13 "data/maps/SixIsland_RuinValley/scripts.pory"
	setmetatile 24, 24, METATILE_SeviiIslands67_DottedHoleDoor_Open, 0
# 14 "data/maps/SixIsland_RuinValley/scripts.pory"
	return
# 15 "data/maps/SixIsland_RuinValley/scripts.pory"

# 16 "data/maps/SixIsland_RuinValley/scripts.pory"
SixIsland_RuinValley_EventScript_Scientist::
# 17 "data/maps/SixIsland_RuinValley/scripts.pory"
	lock
# 18 "data/maps/SixIsland_RuinValley/scripts.pory"
	msgbox SixIsland_RuinValley_Text_CantFigureOutHowToGetInside
# 19 "data/maps/SixIsland_RuinValley/scripts.pory"
	applymovement LOCALID_SCIENTIST, Common_Movement_FacePlayer
# 20 "data/maps/SixIsland_RuinValley/scripts.pory"
	waitmovement 0
# 21 "data/maps/SixIsland_RuinValley/scripts.pory"
	msgbox SixIsland_RuinValley_Text_IFoundThisPlace
# 22 "data/maps/SixIsland_RuinValley/scripts.pory"
	applymovement LOCALID_SCIENTIST, Common_Movement_FaceOriginalDirection
# 23 "data/maps/SixIsland_RuinValley/scripts.pory"
	waitmovement 0
# 24 "data/maps/SixIsland_RuinValley/scripts.pory"
	release
# 25 "data/maps/SixIsland_RuinValley/scripts.pory"
	end
# 26 "data/maps/SixIsland_RuinValley/scripts.pory"

# 27 "data/maps/SixIsland_RuinValley/scripts.pory"
SixIsland_RuinValley_EventScript_DottedHoleDoor::
# 28 "data/maps/SixIsland_RuinValley/scripts.pory"
	lockall
# 29 "data/maps/SixIsland_RuinValley/scripts.pory"
	goto_if_set FLAG_USED_CUT_ON_RUIN_VALLEY_BRAILLE, SixIsland_RuinValley_EventScript_DottedHoleDoorOpen
# 30 "data/maps/SixIsland_RuinValley/scripts.pory"
	msgbox SixIsland_RuinValley_Text_CheckDoorMoreThoroughly, MSGBOX_YESNO
# 31 "data/maps/SixIsland_RuinValley/scripts.pory"
	goto_if_eq VAR_RESULT, NO, SixIsland_RuinValley_EventScript_IgnoreDottedHoleDoor
# 32 "data/maps/SixIsland_RuinValley/scripts.pory"
	msgbox SixIsland_RuinValley_Text_SeveralDotsOnTheDoor
# 33 "data/maps/SixIsland_RuinValley/scripts.pory"
	braillemessage Braille_Text_Cut
# 34 "data/maps/SixIsland_RuinValley/scripts.pory"
	waitbuttonpress
# 35 "data/maps/SixIsland_RuinValley/scripts.pory"
	releaseall
# 36 "data/maps/SixIsland_RuinValley/scripts.pory"
	end
# 37 "data/maps/SixIsland_RuinValley/scripts.pory"

# 38 "data/maps/SixIsland_RuinValley/scripts.pory"
SixIsland_RuinValley_EventScript_DottedHoleDoorOpen::
# 39 "data/maps/SixIsland_RuinValley/scripts.pory"
	msgbox SixIsland_RuinValley_Text_DoorIsOpen
# 40 "data/maps/SixIsland_RuinValley/scripts.pory"
	releaseall
# 41 "data/maps/SixIsland_RuinValley/scripts.pory"
	end
# 42 "data/maps/SixIsland_RuinValley/scripts.pory"

# 43 "data/maps/SixIsland_RuinValley/scripts.pory"
SixIsland_RuinValley_EventScript_IgnoreDottedHoleDoor::
# 44 "data/maps/SixIsland_RuinValley/scripts.pory"
	msgbox SixIsland_RuinValley_Text_LeftDoorAlone
# 45 "data/maps/SixIsland_RuinValley/scripts.pory"
	releaseall
# 46 "data/maps/SixIsland_RuinValley/scripts.pory"
	end
