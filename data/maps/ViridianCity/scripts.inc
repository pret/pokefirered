# 1 "data/maps/ViridianCity/scripts.pory"

# 2 "data/maps/ViridianCity/scripts.pory"
.set LOCALID_OLD_MAN,      3
# 3 "data/maps/ViridianCity/scripts.pory"
.set LOCALID_TUTORIAL_MAN, 4
# 4 "data/maps/ViridianCity/scripts.pory"
.set LOCALID_WOMAN,        5
# 5 "data/maps/ViridianCity/scripts.pory"

# 6 "data/maps/ViridianCity/scripts.pory"
ViridianCity_MapScripts::
# 7 "data/maps/ViridianCity/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, ViridianCity_OnTransition
# 8 "data/maps/ViridianCity/scripts.pory"
	.byte 0
# 9 "data/maps/ViridianCity/scripts.pory"

# 10 "data/maps/ViridianCity/scripts.pory"
ViridianCity_OnTransition::
# 11 "data/maps/ViridianCity/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_VIRIDIAN_CITY
# 12 "data/maps/ViridianCity/scripts.pory"
	call_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0, ViridianCity_EventScript_SetOldManBlockingRoad
# 13 "data/maps/ViridianCity/scripts.pory"
	call_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1, ViridianCity_EventScript_SetOldManStandingByRoad
# 14 "data/maps/ViridianCity/scripts.pory"
	call_if_ge VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2, ViridianCity_EventScript_SetOldManNormal
# 15 "data/maps/ViridianCity/scripts.pory"
	call_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 0, ViridianCity_EventScript_TryUnlockGym
# 16 "data/maps/ViridianCity/scripts.pory"
	end
# 17 "data/maps/ViridianCity/scripts.pory"

# 18 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_SetOldManNormal::
# 19 "data/maps/ViridianCity/scripts.pory"
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OLD_MAN_1
# 20 "data/maps/ViridianCity/scripts.pory"
	return
# 21 "data/maps/ViridianCity/scripts.pory"

# 22 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_SetOldManStandingByRoad::
# 23 "data/maps/ViridianCity/scripts.pory"
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OLD_MAN_1
# 24 "data/maps/ViridianCity/scripts.pory"
	setobjectxyperm LOCALID_TUTORIAL_MAN, 21, 8
# 25 "data/maps/ViridianCity/scripts.pory"
	setobjectmovementtype LOCALID_TUTORIAL_MAN, MOVEMENT_TYPE_LOOK_AROUND
# 26 "data/maps/ViridianCity/scripts.pory"
	return
# 27 "data/maps/ViridianCity/scripts.pory"

# 28 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_SetOldManBlockingRoad::
# 29 "data/maps/ViridianCity/scripts.pory"
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OLD_MAN_LYING_DOWN
# 30 "data/maps/ViridianCity/scripts.pory"
	setobjectxyperm LOCALID_TUTORIAL_MAN, 21, 11
# 31 "data/maps/ViridianCity/scripts.pory"
	setobjectmovementtype LOCALID_TUTORIAL_MAN, MOVEMENT_TYPE_FACE_DOWN
# 32 "data/maps/ViridianCity/scripts.pory"
	return
# 33 "data/maps/ViridianCity/scripts.pory"

# 34 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TryUnlockGym::
# 35 "data/maps/ViridianCity/scripts.pory"
	goto_if_unset FLAG_BADGE02_GET, EventScript_Return
# 36 "data/maps/ViridianCity/scripts.pory"
	goto_if_unset FLAG_BADGE03_GET, EventScript_Return
# 37 "data/maps/ViridianCity/scripts.pory"
	goto_if_unset FLAG_BADGE04_GET, EventScript_Return
# 38 "data/maps/ViridianCity/scripts.pory"
	goto_if_unset FLAG_BADGE05_GET, EventScript_Return
# 39 "data/maps/ViridianCity/scripts.pory"
	goto_if_unset FLAG_BADGE06_GET, EventScript_Return
# 40 "data/maps/ViridianCity/scripts.pory"
	goto_if_unset FLAG_BADGE07_GET, EventScript_Return
# 41 "data/maps/ViridianCity/scripts.pory"
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 1
# 42 "data/maps/ViridianCity/scripts.pory"
	return
# 43 "data/maps/ViridianCity/scripts.pory"

# 44 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_GymDoorLocked::
# 45 "data/maps/ViridianCity/scripts.pory"
	lockall
# 46 "data/maps/ViridianCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 47 "data/maps/ViridianCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
# 48 "data/maps/ViridianCity/scripts.pory"
	waitmovement 0
# 49 "data/maps/ViridianCity/scripts.pory"
	delay 20
# 50 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_GymDoorsAreLocked
# 51 "data/maps/ViridianCity/scripts.pory"
	closemessage
# 52 "data/maps/ViridianCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, ViridianCity_Movement_JumpDownLedge
# 53 "data/maps/ViridianCity/scripts.pory"
	waitmovement 0
# 54 "data/maps/ViridianCity/scripts.pory"
	releaseall
# 55 "data/maps/ViridianCity/scripts.pory"
	end
# 56 "data/maps/ViridianCity/scripts.pory"

# 57 "data/maps/ViridianCity/scripts.pory"
ViridianCity_Movement_JumpDownLedge::
# 58 "data/maps/ViridianCity/scripts.pory"
	jump_2_down
# 59 "data/maps/ViridianCity/scripts.pory"
	step_end
# 60 "data/maps/ViridianCity/scripts.pory"

# 61 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_CitySign::
# 62 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_CitySign, MSGBOX_SIGN
# 63 "data/maps/ViridianCity/scripts.pory"
	end
# 64 "data/maps/ViridianCity/scripts.pory"

# 65 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TrainerTips1::
# 66 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_CatchMonsForEasierBattles, MSGBOX_SIGN
# 67 "data/maps/ViridianCity/scripts.pory"
	end
# 68 "data/maps/ViridianCity/scripts.pory"

# 69 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TrainerTips2::
# 70 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_MovesLimitedByPP, MSGBOX_SIGN
# 71 "data/maps/ViridianCity/scripts.pory"
	end
# 72 "data/maps/ViridianCity/scripts.pory"

# 73 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_GymSign::
# 74 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_GymSign, MSGBOX_SIGN
# 75 "data/maps/ViridianCity/scripts.pory"
	end
# 76 "data/maps/ViridianCity/scripts.pory"

# 77 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_GymDoor::
# 78 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_GymDoorsAreLocked, MSGBOX_SIGN
# 79 "data/maps/ViridianCity/scripts.pory"
	end
# 80 "data/maps/ViridianCity/scripts.pory"

# 81 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_Boy::
# 82 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_CanCarryMonsAnywhere, MSGBOX_NPC
# 83 "data/maps/ViridianCity/scripts.pory"
	end
# 84 "data/maps/ViridianCity/scripts.pory"

# 85 "data/maps/ViridianCity/scripts.pory"
@ Other old man, not the tutorial old man
# 86 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_OldMan::
# 87 "data/maps/ViridianCity/scripts.pory"
	lock
# 88 "data/maps/ViridianCity/scripts.pory"
	faceplayer
# 89 "data/maps/ViridianCity/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 1, ViridianCity_EventScript_OldManGymLeaderReturned
# 90 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_GymClosedWonderWhoLeaderIs
# 91 "data/maps/ViridianCity/scripts.pory"
	closemessage
# 92 "data/maps/ViridianCity/scripts.pory"
	applymovement LOCALID_OLD_MAN, Common_Movement_FaceOriginalDirection
# 93 "data/maps/ViridianCity/scripts.pory"
	waitmovement 0
# 94 "data/maps/ViridianCity/scripts.pory"
	release
# 95 "data/maps/ViridianCity/scripts.pory"
	end
# 96 "data/maps/ViridianCity/scripts.pory"

# 97 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_OldManGymLeaderReturned::
# 98 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_ViridiansGymLeaderReturned
# 99 "data/maps/ViridianCity/scripts.pory"
	release
# 100 "data/maps/ViridianCity/scripts.pory"
	end
# 101 "data/maps/ViridianCity/scripts.pory"

# 102 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TutorialOldMan::
# 103 "data/maps/ViridianCity/scripts.pory"
	lock
# 104 "data/maps/ViridianCity/scripts.pory"
	faceplayer
# 105 "data/maps/ViridianCity/scripts.pory"
	goto_if_set FLAG_BADGE01_GET, ViridianCity_EventScript_AskIfTeachyTVHelpful
# 106 "data/maps/ViridianCity/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2, ViridianCity_EventScript_TutorialCompleted
# 107 "data/maps/ViridianCity/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1, ViridianCity_EventScript_TutorialStart
# 108 "data/maps/ViridianCity/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0, ViridianCity_EventScript_TutorialNotReady
# 109 "data/maps/ViridianCity/scripts.pory"
	end
# 110 "data/maps/ViridianCity/scripts.pory"

# 111 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_AskIfTeachyTVHelpful::
# 112 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_HowsTeachyTVHelping, MSGBOX_YESNO
# 113 "data/maps/ViridianCity/scripts.pory"
	goto_if_eq VAR_RESULT, NO, ViridianCity_EventScript_TeachyTVNotHelpful
# 114 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_MyGrandsonOnTheShow
# 115 "data/maps/ViridianCity/scripts.pory"
	release
# 116 "data/maps/ViridianCity/scripts.pory"
	end
# 117 "data/maps/ViridianCity/scripts.pory"

# 118 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TeachyTVNotHelpful::
# 119 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_TooBusyForTeachyTV
# 120 "data/maps/ViridianCity/scripts.pory"
	release
# 121 "data/maps/ViridianCity/scripts.pory"
	end
# 122 "data/maps/ViridianCity/scripts.pory"

# 123 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TutorialCompleted::
# 124 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_WeakenMonsFirstToCatch
# 125 "data/maps/ViridianCity/scripts.pory"
	release
# 126 "data/maps/ViridianCity/scripts.pory"
	end
# 127 "data/maps/ViridianCity/scripts.pory"

# 128 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TutorialStart::
# 129 "data/maps/ViridianCity/scripts.pory"
	call ViridianCity_EventScript_DoTutorialBattle
# 130 "data/maps/ViridianCity/scripts.pory"
	release
# 131 "data/maps/ViridianCity/scripts.pory"
	end
# 132 "data/maps/ViridianCity/scripts.pory"

# 133 "data/maps/ViridianCity/scripts.pory"
@ Unused
# 134 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_WatchToLearnBasics::
# 135 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_WatchThatToLearnBasics
# 136 "data/maps/ViridianCity/scripts.pory"
	release
# 137 "data/maps/ViridianCity/scripts.pory"
	end
# 138 "data/maps/ViridianCity/scripts.pory"

# 139 "data/maps/ViridianCity/scripts.pory"
@ Unused. Starts battle after the post battle text, which is odd.
# 140 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TutorialUnused::
# 141 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_ThatWasEducationalTakeThis
# 142 "data/maps/ViridianCity/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 143 "data/maps/ViridianCity/scripts.pory"
	special QuestLog_CutRecording
# 144 "data/maps/ViridianCity/scripts.pory"
	special StartOldManTutorialBattle
# 145 "data/maps/ViridianCity/scripts.pory"
	waitstate
# 146 "data/maps/ViridianCity/scripts.pory"
	release
# 147 "data/maps/ViridianCity/scripts.pory"
	end
# 148 "data/maps/ViridianCity/scripts.pory"

# 149 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TutorialNotReady::
# 150 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_ThisIsPrivateProperty
# 151 "data/maps/ViridianCity/scripts.pory"
	closemessage
# 152 "data/maps/ViridianCity/scripts.pory"
	release
# 153 "data/maps/ViridianCity/scripts.pory"
	end
# 154 "data/maps/ViridianCity/scripts.pory"

# 155 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_Youngster::
# 156 "data/maps/ViridianCity/scripts.pory"
	lock
# 157 "data/maps/ViridianCity/scripts.pory"
	faceplayer
# 158 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_WantToKnowAboutCaterpillarMons, MSGBOX_YESNO
# 159 "data/maps/ViridianCity/scripts.pory"
	goto_if_eq VAR_RESULT, YES, ViridianCity_EventScript_YoungsterExplainCaterpillars
# 160 "data/maps/ViridianCity/scripts.pory"
	goto_if_eq VAR_RESULT, NO, ViridianCity_EventScript_YoungsterDeclineExplanation
# 161 "data/maps/ViridianCity/scripts.pory"
	end
# 162 "data/maps/ViridianCity/scripts.pory"

# 163 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_YoungsterExplainCaterpillars::
# 164 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_ExplainCaterpieWeedle
# 165 "data/maps/ViridianCity/scripts.pory"
	release
# 166 "data/maps/ViridianCity/scripts.pory"
	end
# 167 "data/maps/ViridianCity/scripts.pory"

# 168 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_YoungsterDeclineExplanation::
# 169 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_OhOkayThen
# 170 "data/maps/ViridianCity/scripts.pory"
	release
# 171 "data/maps/ViridianCity/scripts.pory"
	end
# 172 "data/maps/ViridianCity/scripts.pory"

# 173 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_Woman::
# 174 "data/maps/ViridianCity/scripts.pory"
	lock
# 175 "data/maps/ViridianCity/scripts.pory"
	faceplayer
# 176 "data/maps/ViridianCity/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0, ViridianCity_EventScript_WomanRoadBlocked
# 177 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_GoShoppingInPewterOccasionally
# 178 "data/maps/ViridianCity/scripts.pory"
	release
# 179 "data/maps/ViridianCity/scripts.pory"
	end
# 180 "data/maps/ViridianCity/scripts.pory"

# 181 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_WomanRoadBlocked::
# 182 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_GrandpaHasntHadCoffeeYet
# 183 "data/maps/ViridianCity/scripts.pory"
	closemessage
# 184 "data/maps/ViridianCity/scripts.pory"
	applymovement LOCALID_WOMAN, Common_Movement_FaceOriginalDirection
# 185 "data/maps/ViridianCity/scripts.pory"
	waitmovement 0
# 186 "data/maps/ViridianCity/scripts.pory"
	release
# 187 "data/maps/ViridianCity/scripts.pory"
	end
# 188 "data/maps/ViridianCity/scripts.pory"

# 189 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_DreamEaterTutor::
# 190 "data/maps/ViridianCity/scripts.pory"
	goto EventScript_DreamEaterTutor
# 191 "data/maps/ViridianCity/scripts.pory"
	end
# 192 "data/maps/ViridianCity/scripts.pory"

# 193 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_RoadBlocked::
# 194 "data/maps/ViridianCity/scripts.pory"
	lockall
# 195 "data/maps/ViridianCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 196 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_ThisIsPrivateProperty
# 197 "data/maps/ViridianCity/scripts.pory"
	closemessage
# 198 "data/maps/ViridianCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, ViridianCity_Movement_WalkDown
# 199 "data/maps/ViridianCity/scripts.pory"
	waitmovement 0
# 200 "data/maps/ViridianCity/scripts.pory"
	releaseall
# 201 "data/maps/ViridianCity/scripts.pory"
	end
# 202 "data/maps/ViridianCity/scripts.pory"

# 203 "data/maps/ViridianCity/scripts.pory"
ViridianCity_Movement_WalkDown::
# 204 "data/maps/ViridianCity/scripts.pory"
	walk_down
# 205 "data/maps/ViridianCity/scripts.pory"
	step_end
# 206 "data/maps/ViridianCity/scripts.pory"

# 207 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TutorialTriggerLeft::
# 208 "data/maps/ViridianCity/scripts.pory"
	lockall
# 209 "data/maps/ViridianCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 210 "data/maps/ViridianCity/scripts.pory"
	applymovement LOCALID_TUTORIAL_MAN, Common_Movement_WalkInPlaceFasterLeft
# 211 "data/maps/ViridianCity/scripts.pory"
	waitmovement 0
# 212 "data/maps/ViridianCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterRight
# 213 "data/maps/ViridianCity/scripts.pory"
	waitmovement 0
# 214 "data/maps/ViridianCity/scripts.pory"
	call ViridianCity_EventScript_DoTutorialBattle
# 215 "data/maps/ViridianCity/scripts.pory"
	release
# 216 "data/maps/ViridianCity/scripts.pory"
	end
# 217 "data/maps/ViridianCity/scripts.pory"

# 218 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_TutorialTriggerRight::
# 219 "data/maps/ViridianCity/scripts.pory"
	lockall
# 220 "data/maps/ViridianCity/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 221 "data/maps/ViridianCity/scripts.pory"
	applymovement LOCALID_TUTORIAL_MAN, Common_Movement_WalkInPlaceFasterRight
# 222 "data/maps/ViridianCity/scripts.pory"
	waitmovement 0
# 223 "data/maps/ViridianCity/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
# 224 "data/maps/ViridianCity/scripts.pory"
	waitmovement 0
# 225 "data/maps/ViridianCity/scripts.pory"
	call ViridianCity_EventScript_DoTutorialBattle
# 226 "data/maps/ViridianCity/scripts.pory"
	release
# 227 "data/maps/ViridianCity/scripts.pory"
	end
# 228 "data/maps/ViridianCity/scripts.pory"

# 229 "data/maps/ViridianCity/scripts.pory"
ViridianCity_EventScript_DoTutorialBattle::
# 230 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_ShowYouHowToCatchMons
# 231 "data/maps/ViridianCity/scripts.pory"
	closemessage
# 232 "data/maps/ViridianCity/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 233 "data/maps/ViridianCity/scripts.pory"
	special QuestLog_CutRecording
# 234 "data/maps/ViridianCity/scripts.pory"
	special StartOldManTutorialBattle
# 235 "data/maps/ViridianCity/scripts.pory"
	waitstate
# 236 "data/maps/ViridianCity/scripts.pory"
	lock
# 237 "data/maps/ViridianCity/scripts.pory"
	faceplayer
# 238 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_ThatWasEducationalTakeThis
# 239 "data/maps/ViridianCity/scripts.pory"
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
# 240 "data/maps/ViridianCity/scripts.pory"
	giveitem ITEM_TEACHY_TV
# 241 "data/maps/ViridianCity/scripts.pory"
	msgbox ViridianCity_Text_WatchThatToLearnBasics
# 242 "data/maps/ViridianCity/scripts.pory"
	return
