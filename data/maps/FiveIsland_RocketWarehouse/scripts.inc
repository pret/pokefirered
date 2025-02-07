# 1 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 2 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
.equ LOCALID_GRUNT1, 5
# 3 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
.equ LOCALID_GRUNT2, 1
# 4 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
.equ LOCALID_GRUNT3, 2
# 5 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
.equ LOCALID_ADMIN1, 3
# 6 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
.equ LOCALID_ADMIN2, 4
# 7 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 8 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
.equ PLAYER_X_POS, VAR_0x8004
# 9 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
.equ PLAYER_Y_POS, VAR_0x8005
# 10 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 11 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_MapScripts::
# 12 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, FiveIsland_RocketWarehouse_OnLoad
# 13 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, FiveIsland_RocketWarehouse_OnTransition
# 14 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	.byte 0
# 15 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 16 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_OnTransition::
# 17 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_FIVE_ISLAND_ROCKET_WAREHOUSE
# 18 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 19 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 20 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_OnLoad::
# 21 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_defeated TRAINER_TEAM_ROCKET_ADMIN, FiveIsland_RocketWarehouse_EventScript_SetArrowsForReEntry
# 22 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 23 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 24 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_SetArrowsForReEntry::
# 25 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	setmetatile 26, 20, METATILE_SilphCo_Arrow_Up, 0
# 26 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	setmetatile 27, 20, METATILE_SilphCo_Arrow_Up, 0
# 27 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	return
# 28 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 29 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_Cage::
# 30 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	lockall
# 31 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	goto_if_set FLAG_DEFEATED_ROCKETS_IN_WAREHOUSE, FiveIsland_RocketWarehouse_EventScript_CageUnlocked
# 32 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_ManyMonsLockedInPen
# 33 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	releaseall
# 34 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 35 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 36 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_CageUnlocked::
# 37 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_PenUnlockedMonsFled
# 38 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	releaseall
# 39 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 40 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 41 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_Computer::
# 42 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_ReportWithGraphsAndText, MSGBOX_SIGN
# 43 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 44 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 45 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_Admin2Trigger::
# 46 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	lockall
# 47 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	applymovement LOCALID_ADMIN2, Common_Movement_WalkInPlaceFasterLeft
# 48 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	waitmovement 0
# 49 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	setvar VAR_MAP_SCENE_ROCKET_WAREHOUSE, 1
# 50 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	releaseall
# 51 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 52 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 53 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_Gideon::
# 54 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	trainerbattle_single TRAINER_SCIENTIST_GIDEON, FiveIsland_RocketWarehouse_Text_GideonIntro, FiveIsland_RocketWarehouse_Text_GideonDefeat, FiveIsland_RocketWarehouse_EventScript_DefeatedGideon
# 55 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, FiveIsland_RocketWarehouse_EventScript_MentionGiovannisKid
# 56 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_GetLostLeaveMeBe, MSGBOX_AUTOCLOSE
# 57 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 58 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 59 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_MentionGiovannisKid::
# 60 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	famechecker FAMECHECKER_GIOVANNI, 5
# 61 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_GiovannisKidHasRedHair, MSGBOX_AUTOCLOSE
# 62 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 63 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 64 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_DefeatedGideon::
# 65 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_GideonPostBattle
# 66 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	setflag FLAG_RECOVERED_SAPPHIRE
# 67 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	giveitem ITEM_SAPPHIRE
# 68 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	release
# 69 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 70 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 71 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_Grunt2::
# 72 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_47, FiveIsland_RocketWarehouse_Text_Grunt2Intro, FiveIsland_RocketWarehouse_Text_Grunt2Defeat
# 73 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
# 74 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 75 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 76 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_Grunt3::
# 77 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_48, FiveIsland_RocketWarehouse_Text_Grunt3Intro, FiveIsland_RocketWarehouse_Text_Grunt3Defeat
# 78 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_Grunt3PostBattle, MSGBOX_AUTOCLOSE
# 79 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 80 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 81 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_Admin2::
# 82 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_ADMIN_2, FiveIsland_RocketWarehouse_Text_Admin2Intro, FiveIsland_RocketWarehouse_Text_Admin2Defeat, FiveIsland_RocketWarehouse_EventScript_DefeatedAdmin2
# 83 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_Admin2PostBattle, MSGBOX_AUTOCLOSE
# 84 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 85 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 86 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_DefeatedAdmin2::
# 87 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	getplayerxy PLAYER_X_POS, PLAYER_Y_POS
# 88 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_le PLAYER_X_POS, 24, FiveIsland_RocketWarehouse_EventScript_PlayerFaceAdmin2
# 89 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_Admin2PostBattle
# 90 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	closemessage
# 91 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	fadescreen FADE_TO_BLACK
# 92 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	removeobject LOCALID_GRUNT2
# 93 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	removeobject LOCALID_GRUNT3
# 94 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	removeobject LOCALID_ADMIN2
# 95 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	removeobject LOCALID_ADMIN1
# 96 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	setflag FLAG_HIDE_FIVE_ISLAND_ROCKETS
# 97 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	fadescreen FADE_FROM_BLACK
# 98 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	setvar VAR_MAP_SCENE_ROCKET_WAREHOUSE, 1
# 99 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	setflag FLAG_DEFEATED_ROCKETS_IN_WAREHOUSE
# 100 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	release
# 101 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 102 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 103 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_PlayerFaceAdmin2::
# 104 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 105 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	waitmovement 0
# 106 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	return
# 107 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 108 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_Grunt1::
# 109 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_42, FiveIsland_RocketWarehouse_Text_Grunt1Intro, FiveIsland_RocketWarehouse_Text_Grunt1Defeat
# 110 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_Grunt1PostBattle, MSGBOX_AUTOCLOSE
# 111 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 112 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 113 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_Admin1::
# 114 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_ADMIN, FiveIsland_RocketWarehouse_Text_Admin1Intro, FiveIsland_RocketWarehouse_Text_Admin1Defeat, FiveIsland_RocketWarehouse_EventScript_DefeatedAdmin1
# 115 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_MadeItSoYouCanComeBackThrough, MSGBOX_AUTOCLOSE
# 116 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 117 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 118 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_DefeatedAdmin1::
# 119 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	getplayerxy PLAYER_X_POS, PLAYER_Y_POS
# 120 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	specialvar VAR_RESULT, GetPlayerFacingDirection
# 121 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_eq VAR_RESULT, DIR_NORTH, FiveIsland_RocketWarehouse_EventScript_PlayerFaceAdmin1
# 122 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_Admin1PostBattle
# 123 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	closemessage
# 124 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_le PLAYER_X_POS, 24, FiveIsland_RocketWarehouse_EventScript_AdminWalkToSwitchFar
# 125 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_eq PLAYER_X_POS, 25, FiveIsland_RocketWarehouse_EventScript_AdminWalkToSwitch
# 126 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_eq PLAYER_X_POS, 26, FiveIsland_RocketWarehouse_EventScript_AdminFaceSwitch
# 127 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_eq PLAYER_X_POS, 27, FiveIsland_RocketWarehouse_EventScript_AdminFaceSwitch
# 128 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	playse SE_PIN
# 129 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call FiveIsland_RocketWarehouse_EventScript_SetArrowsForReEntry
# 130 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	special DrawWholeMapView
# 131 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	waitse
# 132 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_le PLAYER_X_POS, 24, FiveIsland_RocketWarehouse_EventScript_AdminFacePlayerLeft
# 133 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_eq PLAYER_X_POS, 25, FiveIsland_RocketWarehouse_EventScript_AdminFacePlayerLeft
# 134 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_eq PLAYER_X_POS, 26, FiveIsland_RocketWarehouse_EventScript_AdminFacePlayerLeft
# 135 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	call_if_eq PLAYER_X_POS, 27, FiveIsland_RocketWarehouse_EventScript_AdminFacePlayerDown
# 136 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	msgbox FiveIsland_RocketWarehouse_Text_MadeItSoYouCanComeBackThrough
# 137 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	release
# 138 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	end
# 139 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 140 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_PlayerFaceAdmin1::
# 141 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	goto_if_eq PLAYER_X_POS, 27, EventScript_Return
# 142 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 143 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	waitmovement 0
# 144 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	return
# 145 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 146 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_AdminWalkToSwitchFar::
# 147 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	applymovement LOCALID_ADMIN1, FiveIsland_RocketWarehouse_Movement_AdminWalkToSwitchFar
# 148 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	waitmovement 0
# 149 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	return
# 150 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 151 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_AdminWalkToSwitch::
# 152 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	applymovement LOCALID_ADMIN1, FiveIsland_RocketWarehouse_Movement_AdminWalkToSwitch
# 153 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	waitmovement 0
# 154 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	return
# 155 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 156 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_AdminFaceSwitch::
# 157 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	applymovement LOCALID_ADMIN1, Common_Movement_WalkInPlaceFasterUp
# 158 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	waitmovement 0
# 159 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	return
# 160 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 161 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_AdminFacePlayerLeft::
# 162 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	applymovement LOCALID_ADMIN1, Common_Movement_WalkInPlaceFasterLeft
# 163 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	waitmovement 0
# 164 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	return
# 165 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 166 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_EventScript_AdminFacePlayerDown::
# 167 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	applymovement LOCALID_ADMIN1, Common_Movement_WalkInPlaceFasterDown
# 168 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	waitmovement 0
# 169 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	return
# 170 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 171 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_Movement_AdminWalkToSwitchFar::
# 172 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	walk_right
# 173 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	walk_right
# 174 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	walk_in_place_faster_up
# 175 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	step_end
# 176 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"

# 177 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
FiveIsland_RocketWarehouse_Movement_AdminWalkToSwitch::
# 178 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	walk_right
# 179 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	walk_in_place_faster_up
# 180 "data/maps/FiveIsland_RocketWarehouse/scripts.pory"
	step_end
