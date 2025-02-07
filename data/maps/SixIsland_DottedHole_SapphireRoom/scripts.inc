# 1 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 2 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
.equ LOCALID_SAPPHIRE, 1
# 3 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
.equ LOCALID_THIEF,    2
# 4 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 5 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_MapScripts::
# 6 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	.byte 0
# 7 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 8 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_Sapphire::
# 9 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	lock
# 10 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	faceplayer
# 11 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 12 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	playfanfare MUS_OBTAIN_KEY_ITEM
# 13 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	message SixIsland_DottedHole_SapphireRoom_Text_FoundSapphire
# 14 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmessage
# 15 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitfanfare
# 16 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	closemessage
# 17 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	setobjectxyperm LOCALID_THIEF, 5, 0
# 18 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	addobject LOCALID_THIEF
# 19 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	playse SE_FALL
# 20 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefFallIn
# 21 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 22 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	playse SE_M_STRENGTH
# 23 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefLeft
# 24 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefLeft
# 25 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefDown
# 26 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefDown
# 27 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	setvar VAR_0x8004, 3
# 28 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	setvar VAR_0x8005, 0
# 29 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	setvar VAR_0x8006, 12
# 30 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	setvar VAR_0x8007, 3
# 31 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	special ShakeScreen
# 32 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	delay 60
# 33 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefLookAtSapphireNorth
# 34 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefLookAtSapphireSouth
# 35 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefLookAtSapphireEast
# 36 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefLookAtSapphireWest
# 37 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 38 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	msgbox SixIsland_DottedHole_SapphireRoom_Text_IWasRightInTailingYou
# 39 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	closemessage
# 40 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefGetSapphireNorth
# 41 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefGetSapphireSouth
# 42 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefGetSapphireEast
# 43 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefGetSapphireWest
# 44 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	removeobject LOCALID_SAPPHIRE
# 45 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefLeft2
# 46 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefLeft2
# 47 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefDown2
# 48 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefDown2
# 49 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	msgbox SixIsland_DottedHole_SapphireRoom_Text_SellToTeamRocketTellPassword
# 50 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	closemessage
# 51 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_NORTH, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefExitNorth
# 52 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_SOUTH, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefExitSouth
# 53 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_EAST, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefExitEast
# 54 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	call_if_eq VAR_FACING, DIR_WEST, SixIsland_DottedHole_SapphireRoom_EventScript_ThiefExitWest
# 55 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	playse SE_EXIT
# 56 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	delay 35
# 57 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	removeobject LOCALID_THIEF
# 58 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	setflag FLAG_LEARNED_YES_NAH_CHANSEY
# 59 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	release
# 60 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	end
# 61 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 62 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
@ Lots of redundant scripts below
# 63 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefLeft2::
# 64 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 65 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 66 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 67 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 68 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefDown2::
# 69 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterDown
# 70 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 71 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 72 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 73 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefLeft::
# 74 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 75 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 76 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 77 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 78 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_PlayerFaceThiefDown::
# 79 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterDown
# 80 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 81 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 82 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 83 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefLookAtSapphireNorth::
# 84 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefLookAtSapphireFromLeft
# 85 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 86 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 87 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 88 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefLookAtSapphireSouth::
# 89 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefLookAtSapphireFromLeft
# 90 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 91 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 92 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 93 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefLookAtSapphireEast::
# 94 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefLookAtSapphireFromBelow
# 95 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 96 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 97 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 98 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefLookAtSapphireWest::
# 99 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefLookAtSapphireFromBelow
# 100 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 101 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 102 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 103 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefGetSapphireNorth::
# 104 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefGetSapphireFromLeft
# 105 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 106 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 107 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 108 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 109 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 110 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefGetSapphireSouth::
# 111 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefGetSapphireFromLeft
# 112 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 113 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterDown
# 114 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 115 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 116 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 117 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefGetSapphireEast::
# 118 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefGetSapphireFromBelow
# 119 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 120 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 121 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 122 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 123 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 124 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefGetSapphireWest::
# 125 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefGetSapphireFromBelow
# 126 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 127 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 128 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 129 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 130 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 131 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefExitNorth::
# 132 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SixIsland_DottedHole_SapphireRoom_Movement_PlayerWatchThiefExit
# 133 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefExitNorth
# 134 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 135 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 136 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 137 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefExitSouth::
# 138 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SixIsland_DottedHole_SapphireRoom_Movement_PlayerWatchThiefExit
# 139 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefExitSouth
# 140 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 141 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 142 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 143 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefExitEast::
# 144 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SixIsland_DottedHole_SapphireRoom_Movement_PlayerWatchThiefExit
# 145 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefExitEastWest
# 146 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 147 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 148 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 149 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_ThiefExitWest::
# 150 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, SixIsland_DottedHole_SapphireRoom_Movement_PlayerWatchThiefExit
# 151 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	applymovement LOCALID_THIEF, SixIsland_DottedHole_SapphireRoom_Movement_ThiefExitEastWest
# 152 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitmovement 0
# 153 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	return
# 154 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 155 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_Movement_ThiefLookAtSapphireFromLeft::
# 156 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_up
# 157 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_up
# 158 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_in_place_faster_right
# 159 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	step_end
# 160 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 161 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_Movement_ThiefLookAtSapphireFromBelow::
# 162 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_right
# 163 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_right
# 164 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_in_place_faster_up
# 165 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	step_end
# 166 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 167 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_Movement_ThiefGetSapphireFromLeft::
# 168 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_right
# 169 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	step_end
# 170 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 171 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_Movement_ThiefGetSapphireFromBelow::
# 172 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_up
# 173 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	step_end
# 174 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 175 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_Movement_ThiefExitNorth::
# 176 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_up
# 177 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 178 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 179 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 180 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_down
# 181 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 182 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 183 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	step_end
# 184 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 185 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_Movement_ThiefExitSouth::
# 186 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_down
# 187 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 188 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 189 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 190 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_up
# 191 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 192 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 193 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	step_end
# 194 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 195 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_Movement_ThiefExitEastWest::
# 196 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 197 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 198 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 199 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_right
# 200 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_fast_up
# 201 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	step_end
# 202 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 203 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_Movement_ThiefFallIn::
# 204 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	face_down
# 205 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	disable_anim
# 206 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	slide_down
# 207 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	slide_down
# 208 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	slide_down
# 209 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	slide_down
# 210 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	slide_down
# 211 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	slide_down
# 212 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	slide_down
# 213 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	slide_down
# 214 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	slide_down
# 215 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	restore_anim
# 216 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	step_end
# 217 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 218 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_Movement_PlayerWatchThiefExit::
# 219 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	delay_16
# 220 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	walk_in_place_faster_right
# 221 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	step_end
# 222 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"

# 223 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
SixIsland_DottedHole_SapphireRoom_EventScript_BrailleMessage::
# 224 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	lockall
# 225 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	setvar VAR_0x8005, 130
# 226 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_LetTheTwo
# 227 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_Glittering
# 228 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_Stones
# 229 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_OneInRed
# 230 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_OneInBlue
# 231 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_ConnectThe
# 232 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_Past
# 233 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_TwoFriends
# 234 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_Sharing
# 235 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_PowerOpen
# 236 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_AWindowTo
# 237 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_ANewWorld
# 238 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_ThatGlows
# 239 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_TheNext
# 240 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage_wait Braille_Text_WorldWaits
# 241 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	braillemessage Braille_Text_ForYou
# 242 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	waitbuttonpress
# 243 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	releaseall
# 244 "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.pory"
	end
