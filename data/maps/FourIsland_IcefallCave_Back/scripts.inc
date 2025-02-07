# 1 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 2 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
.equ LOCALID_ROCKET1, 1
# 3 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
.equ LOCALID_ROCKET2, 2
# 4 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
.equ LOCALID_LORELEI, 3
# 5 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
.equ LOCALID_ROCKET3, 4
# 6 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 7 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_MapScripts::
# 8 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, FourIsland_IcefallCave_Back_OnTransition
# 9 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	.byte 0
# 10 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 11 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_OnTransition::
# 12 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	call_if_eq VAR_MAP_SCENE_ICEFALL_CAVE_BACK, 1, FourIsland_IcefallCave_Back_EventScript_HideLorelei
# 13 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	end
# 14 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 15 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_EventScript_HideLorelei::
# 16 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	setflag FLAG_HIDE_ICEFALL_CAVE_LORELEI
# 17 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	return
# 18 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 19 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_EventScript_LoreleiRocketsScene::
# 20 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	lockall
# 21 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 22 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	msgbox FourIsland_IcefallCave_Back_Text_LoreleiKeepHandsOffMons
# 23 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_ROCKET1, FourIsland_IcefallCave_Back_Movement_WalkInPlaceDown
# 24 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 25 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 26 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	msgbox FourIsland_IcefallCave_Back_Text_ShutItLadyLeaveUsBe
# 27 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	closemessage
# 28 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	playse SE_PIN
# 29 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_LORELEI, Common_Movement_ExclamationMark
# 30 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 31 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_LORELEI, Common_Movement_WalkInPlaceFasterDown
# 32 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 33 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_LORELEI, Common_Movement_Delay48
# 34 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 35 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 36 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	msgbox FourIsland_IcefallCave_Back_Text_LoreleiPlayerHelpMeKickPoachersOut
# 37 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	closemessage
# 38 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_LORELEI, Common_Movement_WalkInPlaceFasterRight
# 39 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 40 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay 18
# 41 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_LORELEI, Common_Movement_WalkInPlaceFasterDown
# 42 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 43 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay 35
# 44 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_ROCKET3, FourIsland_IcefallCave_Back_Movement_Rocket3FaceLorelei
# 45 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_LORELEI, FourIsland_IcefallCave_Back_Movement_LoreleiToRockets
# 46 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FourIsland_IcefallCave_Back_Movement_PlayerToRockets
# 47 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 48 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_ROCKET2, FourIsland_IcefallCave_Back_Movement_WalkInPlaceDown
# 49 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 50 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	playbgm MUS_ENCOUNTER_ROCKET, 0
# 51 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 52 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	msgbox FourIsland_IcefallCave_Back_Text_GruntIntro
# 53 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_ROCKET3
# 54 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_GRUNT_45, FourIsland_IcefallCave_Back_Text_GruntDefeat
# 55 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_LORELEI, FourIsland_IcefallCave_Back_Movement_WalkInPlaceUp
# 56 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 57 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 58 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	msgbox FourIsland_IcefallCave_Back_Text_LoreleiWhereHaveYouTakenMons
# 59 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 60 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	msgbox FourIsland_IcefallCave_Back_Text_NotTellingYouThat
# 61 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 62 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	message FourIsland_IcefallCave_Back_Text_LoreleiWellDeepFreezeYou
# 63 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmessage
# 64 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitse
# 65 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	playmoncry SPECIES_LAPRAS, CRY_MODE_ENCOUNTER
# 66 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitbuttonpress
# 67 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmoncry
# 68 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_ROCKET1, FourIsland_IcefallCave_Back_Movement_Rocket1ReactToThreat
# 69 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 70 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 71 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	msgbox FourIsland_IcefallCave_Back_Text_OkayRocketWareHouseFiveIsland
# 72 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	closemessage
# 73 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_LORELEI, FourIsland_IcefallCave_Back_Movement_LoreleiWatchRocketsExit
# 74 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FourIsland_IcefallCave_Back_Movement_PlayerWatchRocketsExit
# 75 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_ROCKET1, FourIsland_IcefallCave_Back_Movement_Rocket1Exit
# 76 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_ROCKET2, FourIsland_IcefallCave_Back_Movement_Rocket2Exit
# 77 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_ROCKET3, FourIsland_IcefallCave_Back_Movement_Rocket3Exit
# 78 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 79 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	removeobject LOCALID_ROCKET1
# 80 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	removeobject LOCALID_ROCKET2
# 81 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	removeobject LOCALID_ROCKET3
# 82 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay 50
# 83 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement LOCALID_LORELEI, FourIsland_IcefallCave_Back_Movement_LoreleiWalkToPlayer
# 84 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 85 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 86 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	waitmovement 0
# 87 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 88 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	msgbox FourIsland_IcefallCave_Back_Text_ThankYouThisIsAwful
# 89 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	setflag FLAG_HIDE_RUIN_VALLEY_SCIENTIST
# 90 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	clearflag FLAG_HIDE_LORELEI_IN_HER_HOUSE
# 91 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	setvar VAR_MAP_SCENE_ICEFALL_CAVE_BACK, 1
# 92 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	releaseall
# 93 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	end
# 94 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 95 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_PlayerToRockets::
# 96 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_up
# 97 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_up
# 98 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_right
# 99 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_up
# 100 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 101 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 102 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_PlayerWatchRocketsExit::
# 103 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_16
# 104 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_in_place_faster_left
# 105 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_16
# 106 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_16
# 107 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_in_place_faster_down
# 108 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 109 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 110 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_WalkInPlaceDown::
# 111 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_in_place_down
# 112 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 113 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 114 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_UnusedPushRight::
# 115 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	lock_facing_direction
# 116 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_right
# 117 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	unlock_facing_direction
# 118 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 119 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 120 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_Rocket1ReactToThreat::
# 121 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_in_place_fast_down
# 122 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 123 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 124 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_Rocket1Exit::
# 125 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_right
# 126 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_down
# 127 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 128 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 129 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 130 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 131 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 132 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 133 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 134 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 135 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 136 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_Rocket2Exit::
# 137 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_16
# 138 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_left
# 139 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_down
# 140 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 141 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 142 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 143 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 144 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 145 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 146 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 147 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 148 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 149 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_Rocket3Exit::
# 150 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_16
# 151 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_down
# 152 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_16
# 153 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_down
# 154 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_right
# 155 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_right
# 156 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 157 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 158 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 159 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 160 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_fast_down
# 161 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 162 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 163 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_Rocket3FaceLorelei::
# 164 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_16
# 165 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_8
# 166 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_in_place_faster_right
# 167 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 168 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 169 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_UnusedWalkLeft::
# 170 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_left
# 171 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_left
# 172 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 173 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 174 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_LoreleiToRockets::
# 175 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_left
# 176 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_up
# 177 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 178 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 179 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_WalkInPlaceUp::
# 180 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_in_place_up
# 181 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 182 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 183 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_LoreleiWatchRocketsExit::
# 184 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_8
# 185 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_in_place_faster_right
# 186 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_16
# 187 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	delay_16
# 188 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_in_place_faster_down
# 189 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 190 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 191 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_Movement_LoreleiWalkToPlayer::
# 192 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	walk_right
# 193 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	step_end
# 194 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"

# 195 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
FourIsland_IcefallCave_Back_EventScript_Lorelei::
# 196 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	msgbox FourIsland_IcefallCave_Back_Text_ThankYouThisIsAwful, MSGBOX_NPC
# 197 "data/maps/FourIsland_IcefallCave_Back/scripts.pory"
	end
