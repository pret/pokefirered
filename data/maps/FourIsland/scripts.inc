# 1 "data/maps/FourIsland/scripts.pory"

# 2 "data/maps/FourIsland/scripts.pory"
.equ LOCALID_DAYCARE_MAN, 1
# 3 "data/maps/FourIsland/scripts.pory"
.equ LOCALID_RIVAL, 10
# 4 "data/maps/FourIsland/scripts.pory"

# 5 "data/maps/FourIsland/scripts.pory"
FourIsland_MapScripts::
# 6 "data/maps/FourIsland/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, FourIsland_OnTransition
# 7 "data/maps/FourIsland/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, FourIsland_OnFrame
# 8 "data/maps/FourIsland/scripts.pory"
	.byte 0
# 9 "data/maps/FourIsland/scripts.pory"

# 10 "data/maps/FourIsland/scripts.pory"
FourIsland_OnTransition::
# 11 "data/maps/FourIsland/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_FOUR_ISLAND
# 12 "data/maps/FourIsland/scripts.pory"
	call_if_eq VAR_MAP_SCENE_FOUR_ISLAND, 0, FourIsland_EventScript_ShowRival
# 13 "data/maps/FourIsland/scripts.pory"
	call FourIsland_EventScript_TrySetDayCareManPos
# 14 "data/maps/FourIsland/scripts.pory"
	end
# 15 "data/maps/FourIsland/scripts.pory"

# 16 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_ShowRival::
# 17 "data/maps/FourIsland/scripts.pory"
	clearflag FLAG_HIDE_FOUR_ISLAND_RIVAL
# 18 "data/maps/FourIsland/scripts.pory"
	return
# 19 "data/maps/FourIsland/scripts.pory"

# 20 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_TrySetDayCareManPos::
# 21 "data/maps/FourIsland/scripts.pory"
	goto_if_unset FLAG_PENDING_DAYCARE_EGG, FourIsland_EventScript_EndSetDayCareManPos
# 22 "data/maps/FourIsland/scripts.pory"
	setobjectxyperm LOCALID_DAYCARE_MAN, 16, 14
# 23 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_EndSetDayCareManPos::
# 24 "data/maps/FourIsland/scripts.pory"
	return
# 25 "data/maps/FourIsland/scripts.pory"

# 26 "data/maps/FourIsland/scripts.pory"
FourIsland_OnFrame::
# 27 "data/maps/FourIsland/scripts.pory"
	map_script_2 VAR_MAP_SCENE_FOUR_ISLAND, 0, FourIsland_EventScript_RivalScene
# 28 "data/maps/FourIsland/scripts.pory"
	.2byte 0
# 29 "data/maps/FourIsland/scripts.pory"

# 30 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_RivalScene::
# 31 "data/maps/FourIsland/scripts.pory"
	lockall
# 32 "data/maps/FourIsland/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 33 "data/maps/FourIsland/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_WalkInPlaceFasterDown
# 34 "data/maps/FourIsland/scripts.pory"
	waitmovement 0
# 35 "data/maps/FourIsland/scripts.pory"
	playbgm MUS_ENCOUNTER_RIVAL, 0
# 36 "data/maps/FourIsland/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_ExclamationMark
# 37 "data/maps/FourIsland/scripts.pory"
	waitmovement 0
# 38 "data/maps/FourIsland/scripts.pory"
	applymovement LOCALID_RIVAL, Common_Movement_Delay48
# 39 "data/maps/FourIsland/scripts.pory"
	waitmovement 0
# 40 "data/maps/FourIsland/scripts.pory"
	delay 25
# 41 "data/maps/FourIsland/scripts.pory"
	applymovement LOCALID_RIVAL, FourIsland_Movement_RivalApproach
# 42 "data/maps/FourIsland/scripts.pory"
	waitmovement 0
# 43 "data/maps/FourIsland/scripts.pory"
	msgbox FourIsland_Text_RivalAlreadyGotEggBeSmellingYa
# 44 "data/maps/FourIsland/scripts.pory"
	closemessage
# 45 "data/maps/FourIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, FourIsland_Movement_PlayerWatchRivalExit
# 46 "data/maps/FourIsland/scripts.pory"
	applymovement LOCALID_RIVAL, FourIsland_Movement_RivalExit
# 47 "data/maps/FourIsland/scripts.pory"
	waitmovement 0
# 48 "data/maps/FourIsland/scripts.pory"
	fadedefaultbgm
# 49 "data/maps/FourIsland/scripts.pory"
	playse SE_EXIT
# 50 "data/maps/FourIsland/scripts.pory"
	delay 35
# 51 "data/maps/FourIsland/scripts.pory"
	removeobject LOCALID_RIVAL
# 52 "data/maps/FourIsland/scripts.pory"
	setvar VAR_MAP_SCENE_FOUR_ISLAND, 1
# 53 "data/maps/FourIsland/scripts.pory"
	releaseall
# 54 "data/maps/FourIsland/scripts.pory"
	end
# 55 "data/maps/FourIsland/scripts.pory"

# 56 "data/maps/FourIsland/scripts.pory"
FourIsland_Movement_RivalApproach::
# 57 "data/maps/FourIsland/scripts.pory"
	walk_right
# 58 "data/maps/FourIsland/scripts.pory"
	walk_right
# 59 "data/maps/FourIsland/scripts.pory"
	walk_down
# 60 "data/maps/FourIsland/scripts.pory"
	walk_down
# 61 "data/maps/FourIsland/scripts.pory"
	step_end
# 62 "data/maps/FourIsland/scripts.pory"

# 63 "data/maps/FourIsland/scripts.pory"
FourIsland_Movement_RivalExit::
# 64 "data/maps/FourIsland/scripts.pory"
	delay_16
# 65 "data/maps/FourIsland/scripts.pory"
	delay_4
# 66 "data/maps/FourIsland/scripts.pory"
	walk_down
# 67 "data/maps/FourIsland/scripts.pory"
	step_end
# 68 "data/maps/FourIsland/scripts.pory"

# 69 "data/maps/FourIsland/scripts.pory"
FourIsland_Movement_PlayerWatchRivalExit::
# 70 "data/maps/FourIsland/scripts.pory"
	walk_left
# 71 "data/maps/FourIsland/scripts.pory"
	walk_in_place_faster_right
# 72 "data/maps/FourIsland/scripts.pory"
	step_end
# 73 "data/maps/FourIsland/scripts.pory"

# 74 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_DaycareMan::
# 75 "data/maps/FourIsland/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 76 "data/maps/FourIsland/scripts.pory"
	special QuestLog_CutRecording
# 77 "data/maps/FourIsland/scripts.pory"
	lock
# 78 "data/maps/FourIsland/scripts.pory"
	faceplayer
# 79 "data/maps/FourIsland/scripts.pory"
	special GetDaycareMonNicknames
# 80 "data/maps/FourIsland/scripts.pory"
	specialvar VAR_RESULT, GetDaycareState
# 81 "data/maps/FourIsland/scripts.pory"
	goto_if_eq VAR_RESULT, DAYCARE_EGG_WAITING, FourIsland_EventScript_DaycareEggWaiting
# 82 "data/maps/FourIsland/scripts.pory"
	goto_if_eq VAR_RESULT, DAYCARE_ONE_MON, FourIsland_EventScript_CheckOnOneMon
# 83 "data/maps/FourIsland/scripts.pory"
	goto_if_eq VAR_RESULT, DAYCARE_TWO_MONS, FourIsland_EventScript_CheckOnTwoMons
# 84 "data/maps/FourIsland/scripts.pory"
	msgbox DayCare_Text_ImDaycareManSpeakToMyWife
# 85 "data/maps/FourIsland/scripts.pory"
	release
# 86 "data/maps/FourIsland/scripts.pory"
	end
# 87 "data/maps/FourIsland/scripts.pory"

# 88 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_DaycareEggWaiting::
# 89 "data/maps/FourIsland/scripts.pory"
	msgbox DayCare_Text_DoYouWantEgg, MSGBOX_YESNO
# 90 "data/maps/FourIsland/scripts.pory"
	goto_if_eq VAR_RESULT, YES, FourIsland_EventScript_DaycareAcceptEgg
# 91 "data/maps/FourIsland/scripts.pory"
	msgbox DayCare_Text_IWillKeepDoYouWantIt, MSGBOX_YESNO
# 92 "data/maps/FourIsland/scripts.pory"
	goto_if_eq VAR_RESULT, YES, FourIsland_EventScript_DaycareAcceptEgg
# 93 "data/maps/FourIsland/scripts.pory"
	msgbox DayCare_Text_IllKeepIt
# 94 "data/maps/FourIsland/scripts.pory"
	clearflag FLAG_PENDING_DAYCARE_EGG
# 95 "data/maps/FourIsland/scripts.pory"
	special RejectEggFromDayCare
# 96 "data/maps/FourIsland/scripts.pory"
	release
# 97 "data/maps/FourIsland/scripts.pory"
	end
# 98 "data/maps/FourIsland/scripts.pory"

# 99 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_DaycareAcceptEgg::
# 100 "data/maps/FourIsland/scripts.pory"
	specialvar VAR_RESULT, CalculatePlayerPartyCount
# 101 "data/maps/FourIsland/scripts.pory"
	goto_if_ne VAR_RESULT, PARTY_SIZE, FourIsland_EventScript_DaycareReceivedEgg
# 102 "data/maps/FourIsland/scripts.pory"
	msgbox DayCare_Text_YouHaveNoRoomForIt
# 103 "data/maps/FourIsland/scripts.pory"
	release
# 104 "data/maps/FourIsland/scripts.pory"
	end
# 105 "data/maps/FourIsland/scripts.pory"

# 106 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_DaycareReceivedEgg::
# 107 "data/maps/FourIsland/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 108 "data/maps/FourIsland/scripts.pory"
	message DayCare_Text_ReceivedEgg
# 109 "data/maps/FourIsland/scripts.pory"
	call EventScript_RestorePrevTextColor
# 110 "data/maps/FourIsland/scripts.pory"
	playfanfare MUS_LEVEL_UP
# 111 "data/maps/FourIsland/scripts.pory"
	waitfanfare
# 112 "data/maps/FourIsland/scripts.pory"
	waitbuttonpress
# 113 "data/maps/FourIsland/scripts.pory"
	msgbox DayCare_Text_TakeGoodCareOfIt
# 114 "data/maps/FourIsland/scripts.pory"
	special GiveEggFromDaycare
# 115 "data/maps/FourIsland/scripts.pory"
	clearflag FLAG_PENDING_DAYCARE_EGG
# 116 "data/maps/FourIsland/scripts.pory"
	release
# 117 "data/maps/FourIsland/scripts.pory"
	end
# 118 "data/maps/FourIsland/scripts.pory"

# 119 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_CheckOnOneMon::
# 120 "data/maps/FourIsland/scripts.pory"
	special GetDaycareMonNicknames
# 121 "data/maps/FourIsland/scripts.pory"
	msgbox DayCare_Text_YourMonIsDoingFine
# 122 "data/maps/FourIsland/scripts.pory"
	release
# 123 "data/maps/FourIsland/scripts.pory"
	end
# 124 "data/maps/FourIsland/scripts.pory"

# 125 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_CheckOnTwoMons::
# 126 "data/maps/FourIsland/scripts.pory"
	special GetDaycareMonNicknames
# 127 "data/maps/FourIsland/scripts.pory"
	msgbox DayCare_Text_YourMonsAreDoingFine
# 128 "data/maps/FourIsland/scripts.pory"
	special SetDaycareCompatibilityString
# 129 "data/maps/FourIsland/scripts.pory"
	special ShowFieldMessageStringVar4
# 130 "data/maps/FourIsland/scripts.pory"
	waitmessage
# 131 "data/maps/FourIsland/scripts.pory"
	waitbuttonpress
# 132 "data/maps/FourIsland/scripts.pory"
	release
# 133 "data/maps/FourIsland/scripts.pory"
	end
# 134 "data/maps/FourIsland/scripts.pory"

# 135 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_OldWoman::
# 136 "data/maps/FourIsland/scripts.pory"
	lock
# 137 "data/maps/FourIsland/scripts.pory"
	faceplayer
# 138 "data/maps/FourIsland/scripts.pory"
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, FourIsland_EventScript_OldWomanLoreleiLeft
# 139 "data/maps/FourIsland/scripts.pory"
	msgbox FourIsland_Text_LoreleiHasReturned
# 140 "data/maps/FourIsland/scripts.pory"
	release
# 141 "data/maps/FourIsland/scripts.pory"
	end
# 142 "data/maps/FourIsland/scripts.pory"

# 143 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_OldWomanLoreleiLeft::
# 144 "data/maps/FourIsland/scripts.pory"
	famechecker FAMECHECKER_LORELEI, 5
# 145 "data/maps/FourIsland/scripts.pory"
	msgbox FourIsland_Text_LoreleiMetLaprasAsChild
# 146 "data/maps/FourIsland/scripts.pory"
	release
# 147 "data/maps/FourIsland/scripts.pory"
	end
# 148 "data/maps/FourIsland/scripts.pory"

# 149 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_LittleGirl::
# 150 "data/maps/FourIsland/scripts.pory"
	lock
# 151 "data/maps/FourIsland/scripts.pory"
	faceplayer
# 152 "data/maps/FourIsland/scripts.pory"
	famechecker FAMECHECKER_LORELEI, 4
# 153 "data/maps/FourIsland/scripts.pory"
	msgbox FourIsland_Text_LoreleiHasLotsOfStuffedDolls
# 154 "data/maps/FourIsland/scripts.pory"
	release
# 155 "data/maps/FourIsland/scripts.pory"
	end
# 156 "data/maps/FourIsland/scripts.pory"

# 157 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_FatMan::
# 158 "data/maps/FourIsland/scripts.pory"
	msgbox FourIsland_Text_MadeSlushieUsingIcefallCaveIce, MSGBOX_NPC
# 159 "data/maps/FourIsland/scripts.pory"
	end
# 160 "data/maps/FourIsland/scripts.pory"

# 161 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_IslandSign::
# 162 "data/maps/FourIsland/scripts.pory"
	msgbox FourIsland_Text_IslandSign, MSGBOX_SIGN
# 163 "data/maps/FourIsland/scripts.pory"
	end
# 164 "data/maps/FourIsland/scripts.pory"

# 165 "data/maps/FourIsland/scripts.pory"
FourIsland_EventScript_LoreleisHouseSign::
# 166 "data/maps/FourIsland/scripts.pory"
	msgbox FourIsland_Text_LoreleisHouse, MSGBOX_SIGN
# 167 "data/maps/FourIsland/scripts.pory"
	end
