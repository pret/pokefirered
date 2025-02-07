# 1 "data/maps/ThreeIsland/scripts.pory"

# 2 "data/maps/ThreeIsland/scripts.pory"
.equ LOCALID_ANTIBIKER1, 1
# 3 "data/maps/ThreeIsland/scripts.pory"
.equ LOCALID_ANTIBIKER2, 2
# 4 "data/maps/ThreeIsland/scripts.pory"
.equ LOCALID_PAXTON, 3
# 5 "data/maps/ThreeIsland/scripts.pory"
.equ LOCALID_BIKER1, 5
# 6 "data/maps/ThreeIsland/scripts.pory"
.equ LOCALID_BIKER2, 7
# 7 "data/maps/ThreeIsland/scripts.pory"
.equ LOCALID_BIKER3, 4
# 8 "data/maps/ThreeIsland/scripts.pory"
.equ LOCALID_BIKER4, 6
# 9 "data/maps/ThreeIsland/scripts.pory"
.equ LOCALID_BIKER5, 8
# 10 "data/maps/ThreeIsland/scripts.pory"
.equ LOCALID_BIKER6, 14
# 11 "data/maps/ThreeIsland/scripts.pory"

# 12 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_MapScripts::
# 13 "data/maps/ThreeIsland/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, ThreeIsland_OnTransition
# 14 "data/maps/ThreeIsland/scripts.pory"
	.byte 0
# 15 "data/maps/ThreeIsland/scripts.pory"

# 16 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_OnTransition::
# 17 "data/maps/ThreeIsland/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_THREE_ISLAND
# 18 "data/maps/ThreeIsland/scripts.pory"
	call_if_set FLAG_RESCUED_LOSTELLE, ThreeIsland_EventScript_HideAntiBikers
# 19 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_MAP_SCENE_THREE_ISLAND, 4, ThreeIsland_EventScript_SetAntiBikersMovementAfterBikers
# 20 "data/maps/ThreeIsland/scripts.pory"
	end
# 21 "data/maps/ThreeIsland/scripts.pory"

# 22 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_HideAntiBikers::
# 23 "data/maps/ThreeIsland/scripts.pory"
	setflag FLAG_HIDE_THREE_ISLAND_ANTIBIKERS
# 24 "data/maps/ThreeIsland/scripts.pory"
	return
# 25 "data/maps/ThreeIsland/scripts.pory"

# 26 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_SetAntiBikersMovementAfterBikers::
# 27 "data/maps/ThreeIsland/scripts.pory"
	setobjectmovementtype LOCALID_ANTIBIKER1, MOVEMENT_TYPE_LOOK_AROUND
# 28 "data/maps/ThreeIsland/scripts.pory"
	setobjectmovementtype LOCALID_ANTIBIKER2, MOVEMENT_TYPE_LOOK_AROUND
# 29 "data/maps/ThreeIsland/scripts.pory"
	return
# 30 "data/maps/ThreeIsland/scripts.pory"

# 31 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_Biker::
# 32 "data/maps/ThreeIsland/scripts.pory"
	lock
# 33 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_TEMP_1, 2
# 34 "data/maps/ThreeIsland/scripts.pory"
	call ThreeIsland_EventScript_BikerArgumentScene
# 35 "data/maps/ThreeIsland/scripts.pory"
	release
# 36 "data/maps/ThreeIsland/scripts.pory"
	end
# 37 "data/maps/ThreeIsland/scripts.pory"

# 38 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_AntiBiker1::
# 39 "data/maps/ThreeIsland/scripts.pory"
	lock
# 40 "data/maps/ThreeIsland/scripts.pory"
	goto_if_set FLAG_GOT_FULL_RESTORE_FROM_THREE_ISLAND_DEFENDER, ThreeIsland_EventScript_AntiBiker1GotFullRestore
# 41 "data/maps/ThreeIsland/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_THREE_ISLAND, 4, ThreeIsland_EventScript_GiveFullRestore
# 42 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_TEMP_1, 0
# 43 "data/maps/ThreeIsland/scripts.pory"
	call ThreeIsland_EventScript_BikerArgumentScene
# 44 "data/maps/ThreeIsland/scripts.pory"
	release
# 45 "data/maps/ThreeIsland/scripts.pory"
	end
# 46 "data/maps/ThreeIsland/scripts.pory"

# 47 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_AntiBiker1GotFullRestore::
# 48 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_ANTIBIKER1, Common_Movement_FacePlayer
# 49 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 50 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_YouveGotImpressiveMons
# 51 "data/maps/ThreeIsland/scripts.pory"
	release
# 52 "data/maps/ThreeIsland/scripts.pory"
	end
# 53 "data/maps/ThreeIsland/scripts.pory"

# 54 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_GiveFullRestore::
# 55 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_ANTIBIKER1, Common_Movement_FacePlayer
# 56 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 57 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_ThankYouOhYourMonGotHurt
# 58 "data/maps/ThreeIsland/scripts.pory"
	checkitemspace ITEM_FULL_RESTORE
# 59 "data/maps/ThreeIsland/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, ThreeIsland_EventScript_NoRoomForFullRestore
# 60 "data/maps/ThreeIsland/scripts.pory"
	msgreceiveditem ThreeIsland_Text_GivenFullRestore, ITEM_FULL_RESTORE
# 61 "data/maps/ThreeIsland/scripts.pory"
	additem ITEM_FULL_RESTORE
# 62 "data/maps/ThreeIsland/scripts.pory"
	setflag FLAG_GOT_FULL_RESTORE_FROM_THREE_ISLAND_DEFENDER
# 63 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_YouveGotImpressiveMons
# 64 "data/maps/ThreeIsland/scripts.pory"
	release
# 65 "data/maps/ThreeIsland/scripts.pory"
	end
# 66 "data/maps/ThreeIsland/scripts.pory"

# 67 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_NoRoomForFullRestore::
# 68 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_OhYourBagIsFull
# 69 "data/maps/ThreeIsland/scripts.pory"
	release
# 70 "data/maps/ThreeIsland/scripts.pory"
	end
# 71 "data/maps/ThreeIsland/scripts.pory"

# 72 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_BikerArgumentScene::
# 73 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, ThreeIsland_EventScript_PlayerFaceLeft
# 74 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, ThreeIsland_EventScript_PlayerFaceLeft
# 75 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_ANTIBIKER1, ThreeIsland_Movement_SpeakRight
# 76 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 77 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_GoBackToKanto
# 78 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, ThreeIsland_EventScript_PlayerFaceRight
# 79 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, ThreeIsland_EventScript_PlayerFaceRight
# 80 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, ThreeIsland_EventScript_PlayerFaceBiker
# 81 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER1, ThreeIsland_Movement_SpeakLeft
# 82 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 83 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_BossIsOnHisWay
# 84 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, ThreeIsland_EventScript_PlayerFaceUp
# 85 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, ThreeIsland_EventScript_PlayerFaceUp
# 86 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, ThreeIsland_EventScript_PlayerFaceAntiBiker
# 87 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_ANTIBIKER2, ThreeIsland_Movement_SpeakRight
# 88 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 89 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_GetOffIslandNow
# 90 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, ThreeIsland_EventScript_PlayerFaceRight
# 91 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, ThreeIsland_EventScript_PlayerFaceRight
# 92 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, ThreeIsland_EventScript_PlayerFaceBiker
# 93 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER3, ThreeIsland_Movement_SpeakLeft
# 94 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 95 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_WhosGonnaMakeMe
# 96 "data/maps/ThreeIsland/scripts.pory"
	return
# 97 "data/maps/ThreeIsland/scripts.pory"

# 98 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PlayerFaceUp::
# 99 "data/maps/ThreeIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 100 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 101 "data/maps/ThreeIsland/scripts.pory"
	return
# 102 "data/maps/ThreeIsland/scripts.pory"

# 103 "data/maps/ThreeIsland/scripts.pory"
@ Unused
# 104 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PlayerFaceDown::
# 105 "data/maps/ThreeIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterDown
# 106 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 107 "data/maps/ThreeIsland/scripts.pory"
	return
# 108 "data/maps/ThreeIsland/scripts.pory"

# 109 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PlayerFaceLeft::
# 110 "data/maps/ThreeIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 111 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 112 "data/maps/ThreeIsland/scripts.pory"
	return
# 113 "data/maps/ThreeIsland/scripts.pory"

# 114 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PlayerFaceRight::
# 115 "data/maps/ThreeIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 116 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 117 "data/maps/ThreeIsland/scripts.pory"
	return
# 118 "data/maps/ThreeIsland/scripts.pory"

# 119 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PlayerFaceBiker::
# 120 "data/maps/ThreeIsland/scripts.pory"
	getplayerxy VAR_0x8004, VAR_0x8005
# 121 "data/maps/ThreeIsland/scripts.pory"
	goto_if_ge VAR_0x8004, 9, ThreeIsland_EventScript_PlayerFaceUp
# 122 "data/maps/ThreeIsland/scripts.pory"
	goto ThreeIsland_EventScript_PlayerFaceRight
# 123 "data/maps/ThreeIsland/scripts.pory"
	end
# 124 "data/maps/ThreeIsland/scripts.pory"

# 125 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PlayerFaceAntiBiker::
# 126 "data/maps/ThreeIsland/scripts.pory"
	getplayerxy VAR_0x8004, VAR_0x8005
# 127 "data/maps/ThreeIsland/scripts.pory"
	goto_if_ge VAR_0x8004, 9, ThreeIsland_EventScript_PlayerFaceLeft
# 128 "data/maps/ThreeIsland/scripts.pory"
	goto ThreeIsland_EventScript_PlayerFaceUp
# 129 "data/maps/ThreeIsland/scripts.pory"
	end
# 130 "data/maps/ThreeIsland/scripts.pory"

# 131 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_AntiBiker2::
# 132 "data/maps/ThreeIsland/scripts.pory"
	lock
# 133 "data/maps/ThreeIsland/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_THREE_ISLAND, 4, ThreeIsland_EventScript_AntiBiker2BikersGone
# 134 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_TEMP_1, 1
# 135 "data/maps/ThreeIsland/scripts.pory"
	call ThreeIsland_EventScript_BikerArgumentScene
# 136 "data/maps/ThreeIsland/scripts.pory"
	release
# 137 "data/maps/ThreeIsland/scripts.pory"
	end
# 138 "data/maps/ThreeIsland/scripts.pory"

# 139 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_AntiBiker2BikersGone::
# 140 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_ANTIBIKER2, Common_Movement_FacePlayer
# 141 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 142 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_LostelleWentOffTowardsBondBridge
# 143 "data/maps/ThreeIsland/scripts.pory"
	release
# 144 "data/maps/ThreeIsland/scripts.pory"
	end
# 145 "data/maps/ThreeIsland/scripts.pory"

# 146 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_BikerBossIntroTrigger::
# 147 "data/maps/ThreeIsland/scripts.pory"
	lockall
# 148 "data/maps/ThreeIsland/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 149 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_ANTIBIKER1, ThreeIsland_Movement_SpeakRight
# 150 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 151 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_AreYouBossGoBackToKanto
# 152 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_SpeakLeft
# 153 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 154 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_JustGotHerePal
# 155 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_ANTIBIKER1, ThreeIsland_Movement_SpeakRight
# 156 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 157 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_FollowersRaisingHavoc
# 158 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_SpeakLeft
# 159 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 160 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_OughtToBeThankingUs
# 161 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_ANTIBIKER1, ThreeIsland_Movement_SpeakRight
# 162 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 163 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_YouCowardsToughInPack
# 164 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_MAP_SCENE_THREE_ISLAND, 3
# 165 "data/maps/ThreeIsland/scripts.pory"
	releaseall
# 166 "data/maps/ThreeIsland/scripts.pory"
	end
# 167 "data/maps/ThreeIsland/scripts.pory"

# 168 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_SpeakLeft::
# 169 "data/maps/ThreeIsland/scripts.pory"
	walk_in_place_left
# 170 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 171 "data/maps/ThreeIsland/scripts.pory"

# 172 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_SpeakRight::
# 173 "data/maps/ThreeIsland/scripts.pory"
	walk_in_place_right
# 174 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 175 "data/maps/ThreeIsland/scripts.pory"

# 176 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_BattleBikersTriggerLeft::
# 177 "data/maps/ThreeIsland/scripts.pory"
	lockall
# 178 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_TEMP_1, 0
# 179 "data/maps/ThreeIsland/scripts.pory"
	goto ThreeIsland_EventScript_BattleBikersScene
# 180 "data/maps/ThreeIsland/scripts.pory"
	end
# 181 "data/maps/ThreeIsland/scripts.pory"

# 182 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_BattleBikersTriggerMidLeft::
# 183 "data/maps/ThreeIsland/scripts.pory"
	lockall
# 184 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_TEMP_1, 1
# 185 "data/maps/ThreeIsland/scripts.pory"
	goto ThreeIsland_EventScript_BattleBikersScene
# 186 "data/maps/ThreeIsland/scripts.pory"
	end
# 187 "data/maps/ThreeIsland/scripts.pory"

# 188 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_BattleBikersTriggerMid::
# 189 "data/maps/ThreeIsland/scripts.pory"
	lockall
# 190 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_TEMP_1, 2
# 191 "data/maps/ThreeIsland/scripts.pory"
	goto ThreeIsland_EventScript_BattleBikersScene
# 192 "data/maps/ThreeIsland/scripts.pory"
	end
# 193 "data/maps/ThreeIsland/scripts.pory"

# 194 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_BattleBikersTriggerMidRight::
# 195 "data/maps/ThreeIsland/scripts.pory"
	lockall
# 196 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_TEMP_1, 3
# 197 "data/maps/ThreeIsland/scripts.pory"
	goto ThreeIsland_EventScript_BattleBikersScene
# 198 "data/maps/ThreeIsland/scripts.pory"
	end
# 199 "data/maps/ThreeIsland/scripts.pory"

# 200 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_BattleBikersTriggerRight::
# 201 "data/maps/ThreeIsland/scripts.pory"
	lockall
# 202 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_TEMP_1, 4
# 203 "data/maps/ThreeIsland/scripts.pory"
	goto ThreeIsland_EventScript_BattleBikersScene
# 204 "data/maps/ThreeIsland/scripts.pory"
	end
# 205 "data/maps/ThreeIsland/scripts.pory"

# 206 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_BattleBikersScene::
# 207 "data/maps/ThreeIsland/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 208 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER1, Common_Movement_WalkInPlaceFasterDown
# 209 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 210 "data/maps/ThreeIsland/scripts.pory"
	playse SE_PIN
# 211 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER1, Common_Movement_ExclamationMark
# 212 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 213 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER1, Common_Movement_Delay48
# 214 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 215 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER1, ThreeIsland_Movement_BikerApproach
# 216 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 217 "data/maps/ThreeIsland/scripts.pory"
	playbgm MUS_ENCOUNTER_BOY, 0
# 218 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_WannaMakeSomethingOfYourStaring, MSGBOX_YESNO
# 219 "data/maps/ThreeIsland/scripts.pory"
	goto_if_eq VAR_RESULT, NO, ThreeIsland_EventScript_LeaveBikersAlone
# 220 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_Biker1Intro
# 221 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_BIKER1
# 222 "data/maps/ThreeIsland/scripts.pory"
	trainerbattle_no_intro TRAINER_BIKER_GOON, ThreeIsland_Text_Biker1Defeat
# 223 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER1, ThreeIsland_Movement_BikerSpeak
# 224 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 225 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_Biker1PostBattle
# 226 "data/maps/ThreeIsland/scripts.pory"
	closemessage
# 227 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER2, ThreeIsland_Movement_BikerApproach
# 228 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 229 "data/maps/ThreeIsland/scripts.pory"
	playbgm MUS_ENCOUNTER_BOY, 0
# 230 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_Biker2Intro
# 231 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_BIKER2
# 232 "data/maps/ThreeIsland/scripts.pory"
	trainerbattle_no_intro TRAINER_BIKER_GOON_2, ThreeIsland_Text_Biker2Defeat
# 233 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER2, ThreeIsland_Movement_BikerSpeak
# 234 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 235 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_Biker2PostBattle
# 236 "data/maps/ThreeIsland/scripts.pory"
	closemessage
# 237 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER3, ThreeIsland_Movement_BikerApproach
# 238 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 239 "data/maps/ThreeIsland/scripts.pory"
	playbgm MUS_ENCOUNTER_BOY, 0
# 240 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_Biker3Intro
# 241 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_BIKER3
# 242 "data/maps/ThreeIsland/scripts.pory"
	trainerbattle_no_intro TRAINER_BIKER_GOON_3, ThreeIsland_Text_Biker3Defeat
# 243 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER3, Common_Movement_WalkInPlaceFasterLeft
# 244 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 245 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER4, Common_Movement_WalkInPlaceFasterDown
# 246 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER5, Common_Movement_WalkInPlaceFasterDown
# 247 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 248 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_Biker3PostBattle
# 249 "data/maps/ThreeIsland/scripts.pory"
	closemessage
# 250 "data/maps/ThreeIsland/scripts.pory"
	delay 45
# 251 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 0, ThreeIsland_EventScript_PaxtonApproachLeft
# 252 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 1, ThreeIsland_EventScript_PaxtonApproachMidLeft
# 253 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 2, ThreeIsland_EventScript_PaxtonApproachMid
# 254 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 3, ThreeIsland_EventScript_PaxtonApproachMidRight
# 255 "data/maps/ThreeIsland/scripts.pory"
	call_if_eq VAR_TEMP_1, 4, ThreeIsland_EventScript_PaxtonApproachRight
# 256 "data/maps/ThreeIsland/scripts.pory"
	playbgm MUS_ENCOUNTER_BOY, 0
# 257 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_PaxtonIntro
# 258 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_LAST_TALKED, LOCALID_PAXTON
# 259 "data/maps/ThreeIsland/scripts.pory"
	trainerbattle_no_intro TRAINER_CUE_BALL_PAXTON, ThreeIsland_Text_PaxtonDefeat
# 260 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_PaxtonPostBattle
# 261 "data/maps/ThreeIsland/scripts.pory"
	closemessage
# 262 "data/maps/ThreeIsland/scripts.pory"
	fadescreen FADE_TO_BLACK
# 263 "data/maps/ThreeIsland/scripts.pory"
	removeobject LOCALID_PAXTON
# 264 "data/maps/ThreeIsland/scripts.pory"
	removeobject LOCALID_BIKER1
# 265 "data/maps/ThreeIsland/scripts.pory"
	removeobject LOCALID_BIKER2
# 266 "data/maps/ThreeIsland/scripts.pory"
	removeobject LOCALID_BIKER3
# 267 "data/maps/ThreeIsland/scripts.pory"
	removeobject LOCALID_BIKER4
# 268 "data/maps/ThreeIsland/scripts.pory"
	removeobject LOCALID_BIKER5
# 269 "data/maps/ThreeIsland/scripts.pory"
	removeobject LOCALID_BIKER6
# 270 "data/maps/ThreeIsland/scripts.pory"
	fadescreen FADE_FROM_BLACK
# 271 "data/maps/ThreeIsland/scripts.pory"
	setvar VAR_MAP_SCENE_THREE_ISLAND, 4
# 272 "data/maps/ThreeIsland/scripts.pory"
	releaseall
# 273 "data/maps/ThreeIsland/scripts.pory"
	end
# 274 "data/maps/ThreeIsland/scripts.pory"

# 275 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PaxtonApproachLeft::
# 276 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER3, Common_Movement_WalkInPlaceFasterDown
# 277 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_PaxtonApproachLeft
# 278 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 279 "data/maps/ThreeIsland/scripts.pory"
	return
# 280 "data/maps/ThreeIsland/scripts.pory"

# 281 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PaxtonApproachMidLeft::
# 282 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER3, Common_Movement_WalkInPlaceFasterDown
# 283 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_PaxtonApproachMidLeft
# 284 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 285 "data/maps/ThreeIsland/scripts.pory"
	return
# 286 "data/maps/ThreeIsland/scripts.pory"

# 287 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PaxtonApproachMid::
# 288 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER3, Common_Movement_WalkInPlaceFasterDown
# 289 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_PaxtonApproachMid
# 290 "data/maps/ThreeIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, ThreeIsland_Movement_PlayerFacePaxton
# 291 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 292 "data/maps/ThreeIsland/scripts.pory"
	return
# 293 "data/maps/ThreeIsland/scripts.pory"

# 294 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PaxtonApproachMidRight::
# 295 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER3, Common_Movement_WalkInPlaceFasterDown
# 296 "data/maps/ThreeIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, ThreeIsland_Movement_PlayerFacePaxton
# 297 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_PaxtonApproachMidRight
# 298 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 299 "data/maps/ThreeIsland/scripts.pory"
	return
# 300 "data/maps/ThreeIsland/scripts.pory"

# 301 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_PaxtonApproachRight::
# 302 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER3, Common_Movement_WalkInPlaceFasterDown
# 303 "data/maps/ThreeIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, ThreeIsland_Movement_PlayerFacePaxton
# 304 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_PAXTON, ThreeIsland_Movement_PaxtonApproachRight
# 305 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 306 "data/maps/ThreeIsland/scripts.pory"
	return
# 307 "data/maps/ThreeIsland/scripts.pory"

# 308 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_LeaveBikersAlone::
# 309 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_ThatsSmart
# 310 "data/maps/ThreeIsland/scripts.pory"
	closemessage
# 311 "data/maps/ThreeIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, ThreeIsland_Movement_PlayerLeaveBikers
# 312 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 313 "data/maps/ThreeIsland/scripts.pory"
	applymovement LOCALID_BIKER1, ThreeIsland_Movement_Biker1ReturnToPack
# 314 "data/maps/ThreeIsland/scripts.pory"
	waitmovement 0
# 315 "data/maps/ThreeIsland/scripts.pory"
	fadedefaultbgm
# 316 "data/maps/ThreeIsland/scripts.pory"
	releaseall
# 317 "data/maps/ThreeIsland/scripts.pory"
	end
# 318 "data/maps/ThreeIsland/scripts.pory"

# 319 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_PlayerLeaveBikers::
# 320 "data/maps/ThreeIsland/scripts.pory"
	walk_down
# 321 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 322 "data/maps/ThreeIsland/scripts.pory"

# 323 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_BikerApproach::
# 324 "data/maps/ThreeIsland/scripts.pory"
	walk_down
# 325 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 326 "data/maps/ThreeIsland/scripts.pory"

# 327 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_Biker1ReturnToPack::
# 328 "data/maps/ThreeIsland/scripts.pory"
	walk_up
# 329 "data/maps/ThreeIsland/scripts.pory"
	walk_in_place_faster_left
# 330 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 331 "data/maps/ThreeIsland/scripts.pory"

# 332 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_BikerSpeak::
# 333 "data/maps/ThreeIsland/scripts.pory"
	walk_in_place_down
# 334 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 335 "data/maps/ThreeIsland/scripts.pory"

# 336 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_PaxtonApproachLeft::
# 337 "data/maps/ThreeIsland/scripts.pory"
	walk_down
# 338 "data/maps/ThreeIsland/scripts.pory"
	walk_left
# 339 "data/maps/ThreeIsland/scripts.pory"
	walk_in_place_faster_down
# 340 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 341 "data/maps/ThreeIsland/scripts.pory"

# 342 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_PaxtonApproachMidLeft::
# 343 "data/maps/ThreeIsland/scripts.pory"
	walk_down
# 344 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 345 "data/maps/ThreeIsland/scripts.pory"

# 346 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_PaxtonApproachMid::
# 347 "data/maps/ThreeIsland/scripts.pory"
	walk_down
# 348 "data/maps/ThreeIsland/scripts.pory"
	walk_down
# 349 "data/maps/ThreeIsland/scripts.pory"
	walk_in_place_faster_right
# 350 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 351 "data/maps/ThreeIsland/scripts.pory"

# 352 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_PlayerFacePaxton::
# 353 "data/maps/ThreeIsland/scripts.pory"
	delay_16
# 354 "data/maps/ThreeIsland/scripts.pory"
	delay_16
# 355 "data/maps/ThreeIsland/scripts.pory"
	walk_in_place_faster_left
# 356 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 357 "data/maps/ThreeIsland/scripts.pory"

# 358 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_PaxtonApproachMidRight::
# 359 "data/maps/ThreeIsland/scripts.pory"
	walk_down
# 360 "data/maps/ThreeIsland/scripts.pory"
	walk_down
# 361 "data/maps/ThreeIsland/scripts.pory"
	walk_right
# 362 "data/maps/ThreeIsland/scripts.pory"
	walk_in_place_faster_right
# 363 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 364 "data/maps/ThreeIsland/scripts.pory"

# 365 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_Movement_PaxtonApproachRight::
# 366 "data/maps/ThreeIsland/scripts.pory"
	walk_down
# 367 "data/maps/ThreeIsland/scripts.pory"
	walk_down
# 368 "data/maps/ThreeIsland/scripts.pory"
	walk_right
# 369 "data/maps/ThreeIsland/scripts.pory"
	walk_right
# 370 "data/maps/ThreeIsland/scripts.pory"
	walk_in_place_faster_right
# 371 "data/maps/ThreeIsland/scripts.pory"
	step_end
# 372 "data/maps/ThreeIsland/scripts.pory"

# 373 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_Woman::
# 374 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_WouldntWantToSeeBikersHereAgain, MSGBOX_NPC
# 375 "data/maps/ThreeIsland/scripts.pory"
	end
# 376 "data/maps/ThreeIsland/scripts.pory"

# 377 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_LittleBoy::
# 378 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_WhenDodouEvolvesGoingToPlayGame, MSGBOX_NPC
# 379 "data/maps/ThreeIsland/scripts.pory"
	end
# 380 "data/maps/ThreeIsland/scripts.pory"

# 381 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_Doduo::
# 382 "data/maps/ThreeIsland/scripts.pory"
	lock
# 383 "data/maps/ThreeIsland/scripts.pory"
	faceplayer
# 384 "data/maps/ThreeIsland/scripts.pory"
	waitse
# 385 "data/maps/ThreeIsland/scripts.pory"
	playmoncry SPECIES_DODUO, CRY_MODE_NORMAL
# 386 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_Doduo
# 387 "data/maps/ThreeIsland/scripts.pory"
	waitmoncry
# 388 "data/maps/ThreeIsland/scripts.pory"
	release
# 389 "data/maps/ThreeIsland/scripts.pory"
	end
# 390 "data/maps/ThreeIsland/scripts.pory"

# 391 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_IslandSign::
# 392 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_IslandSign, MSGBOX_SIGN
# 393 "data/maps/ThreeIsland/scripts.pory"
	end
# 394 "data/maps/ThreeIsland/scripts.pory"

# 395 "data/maps/ThreeIsland/scripts.pory"
ThreeIsland_EventScript_Biker6::
# 396 "data/maps/ThreeIsland/scripts.pory"
	msgbox ThreeIsland_Text_IslandBelongsToUs, MSGBOX_NPC
# 397 "data/maps/ThreeIsland/scripts.pory"
	end
