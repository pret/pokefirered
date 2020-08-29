.equ LOCALID_MUSEUM_GUIDE, 2
.equ LOCALID_GYM_GUIDE,    5
.equ LOCALID_AIDE,         7

PewterCity_MapScripts:: @ 8165B8E
	map_script MAP_SCRIPT_ON_TRANSITION, PewterCity_OnTransition
	.byte 0

PewterCity_OnTransition:: @ 8165B94
	setworldmapflag FLAG_WORLD_MAP_PEWTER_CITY
	setvar VAR_MAP_SCENE_PEWTER_CITY_MUSEUM_1F, 0
	end

@ Impossible to speak to this NPC from a facing dir != DIR_EAST normally, so they arent checked
@ Additionally, no movement script exists for facing DIR_SOUTH, which would necessitate walking out of bounds
PewterCity_EventScript_GymGuide:: @ 8165B9D
	lock
	faceplayer
	msgbox PewterCity_Text_BrocksLookingForChallengersFollowMe
	closemessage
	playbgm MUS_FOLLOW_ME, 0
	compare VAR_FACING, DIR_EAST
	call_if_eq PewterCity_EventScript_WalkToGymEast
	msgbox PewterCity_Text_GoTakeOnBrock
	closemessage
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GymGuideExit
	waitmovement 0
	fadedefaultbgm
	removeobject LOCALID_GYM_GUIDE
	clearflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
	release
	end

PewterCity_EventScript_WalkToGymEast:: @ 8165BD3
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWaitForGuideEast
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadEast
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymEast
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymEast
	waitmovement 0
	return

@ Unused
PewterCity_EventScript_WalkToGymWest:: @ 8165BF6
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWaitForGuideWest
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadWest
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymWest
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymWest
	waitmovement 0
	return

@ Unused
PewterCity_EventScript_WalkToGymNorth:: @ 8165C19
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWaitForGuideNorth
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadNorth
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymNorth
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymNorth
	waitmovement 0
	return

.macro walk_to_gym
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
.endm

.macro walk_to_gym_alt
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
.endm

PewterCity_Movement_PlayerWaitForGuideEast:: @ 8165C3C
	delay_16
	delay_16
	delay_4
	walk_in_place_fastest_down
	step_end

PewterCity_Movement_PlayerWalkToGymEast:: @ 8165C41
	walk_down
	walk_to_gym
	step_end

PewterCity_Movement_PlayerWaitForGuideWest:: @ 8165C80
	delay_16
	step_end

PewterCity_Movement_PlayerWalkToGymWest:: @ 8165C82
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_to_gym_alt
	step_end

PewterCity_Movement_PlayerWaitForGuideNorth:: @ 8165CAF
	delay_16
	step_end

PewterCity_Movement_PlayerWalkToGymNorth:: @ 8165CB1
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_to_gym_alt
	step_end

PewterCity_Movement_GuideMoveToLeadEast:: @ 8165CDE
	walk_down
	walk_left
	walk_in_place_fastest_up
	walk_in_place_up
	step_end

PewterCity_Movement_GuideWalkToGymEast:: @ 8165CE3
	walk_to_gym
	walk_right
	walk_in_place_fastest_left
	step_end

PewterCity_Movement_GuideMoveToLeadWest:: @ 8165D23
	walk_in_place_right
	step_end

PewterCity_Movement_GuideWalkToGymWest:: @ 8165D25
	walk_left
	walk_left
	walk_left
	walk_left
	walk_to_gym_alt
	walk_right
	walk_in_place_fastest_left
	step_end

PewterCity_Movement_GuideMoveToLeadNorth:: @ 8165D53
	walk_in_place_down
	step_end

PewterCity_Movement_GuideWalkToGymNorth:: @ 8165D55
	walk_left
	walk_left
	walk_left
	walk_left
	walk_to_gym_alt
	walk_right
	walk_in_place_fastest_left
	step_end

PewterCity_Movement_GymGuideExit:: @ 8165D83
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

PewterCity_EventScript_GymGuideTriggerTop:: @ 8165D8E
	lockall
	setvar VAR_TEMP_1, 0
	goto PewterCity_EventScript_GymGuideTrigger
	end

PewterCity_EventScript_GymGuideTriggerMid:: @ 8165D9A
	lockall
	setvar VAR_TEMP_1, 1
	goto PewterCity_EventScript_GymGuideTrigger
	end

PewterCity_EventScript_GymGuideTriggerBottom:: @ 8165DA6
	lockall
	setvar VAR_TEMP_1, 2
	goto PewterCity_EventScript_GymGuideTrigger
	end

@ This trigger is inaccessible and its corresponding movement script isnt linked
PewterCity_EventScript_GymGuideTriggerRight:: @ 8165DB2
	lockall
	setvar VAR_TEMP_1, 3
	goto PewterCity_EventScript_GymGuideTrigger
	end

PewterCity_EventScript_GymGuideTrigger:: @ 8165DBE
	textcolor 0
	msgbox PewterCity_Text_BrocksLookingForChallengersFollowMe
	closemessage
	playbgm MUS_FOLLOW_ME, 0
	compare VAR_TEMP_1, 0
	call_if_eq PewterCity_EventScript_WalkToGymTop
	compare VAR_TEMP_1, 1
	call_if_eq PewterCity_EventScript_WalkToGymMid
	compare VAR_TEMP_1, 2
	call_if_eq PewterCity_EventScript_WalkToGymBottom
	msgbox PewterCity_Text_GoTakeOnBrock
	closemessage
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GymGuideExit
	waitmovement 0
	fadedefaultbgm
	removeobject LOCALID_GYM_GUIDE
	clearflag FLAG_HIDE_PEWTER_CITY_GYM_GUIDE
	releaseall
	end

PewterCity_EventScript_WalkToGymTop:: @ 8165E0A
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadTop
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymTop
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymTop
	waitmovement 0
	return

PewterCity_EventScript_WalkToGymMid:: @ 8165E26
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadMid
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymMid
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymMid
	waitmovement 0
	return

PewterCity_EventScript_WalkToGymBottom:: @ 8165E42
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideMoveToLeadBottom
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymBottom
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymBottom
	waitmovement 0
	return

@ Unused
PewterCity_EventScript_WalkToGymRight:: @ 8165E5E
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideApproachPlayerRight
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToGymRight
	applymovement LOCALID_GYM_GUIDE, PewterCity_Movement_GuideWalkToGymRight
	waitmovement 0
	return

PewterCity_Movement_PlayerWalkToGymTop:: @ 8165E7A
	walk_left
	walk_to_gym
	step_end

PewterCity_Movement_PlayerWalkToGymMid:: @ 8165EB9
	walk_up
	walk_left
	walk_to_gym
	step_end

PewterCity_Movement_PlayerWalkToGymBottom:: @ 8165EF9
	walk_up
	walk_up
	walk_left
	walk_to_gym
	step_end

PewterCity_Movement_PlayerWalkToGymRight:: @ 8165F3A
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_to_gym_alt
	step_end

PewterCity_Movement_GuideMoveToLeadTop:: @ 8165F6C
	walk_left
	walk_down
	walk_in_place_fastest_right
	walk_in_place_right
	step_end

PewterCity_Movement_GuideMoveToLeadMid:: @ 8165F71
	walk_down
	walk_in_place_down
	step_end

PewterCity_Movement_GuideMoveToLeadBottom:: @ 8165F74
	walk_down
	walk_down
	walk_in_place_down
	step_end

PewterCity_Movement_GuideApproachPlayerRight:: @ 8165F78
	walk_down
	walk_down
	walk_right
	walk_down
	walk_right
	walk_in_place_right
	step_end

PewterCity_Movement_GuideWalkToGymTop:: @ 8165F7F
	walk_to_gym
	walk_right
	walk_in_place_fastest_left
	step_end

PewterCity_Movement_GuideWalkToGymMid:: @ 8165FBF
	walk_left
	walk_to_gym
	walk_right
	walk_in_place_fastest_left
	step_end

PewterCity_Movement_GuideWalkToGymBottom:: @ 8166000
	walk_up
	walk_left
	walk_to_gym
	walk_right
	walk_in_place_fastest_left
	step_end

PewterCity_Movement_GuideWalkToGymRight:: @ 8166042
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_to_gym_alt
	walk_right
	walk_in_place_fastest_left
	step_end

PewterCity_EventScript_Lass:: @ 8166075
	msgbox PewterCity_Text_ClefairyCameFromMoon, MSGBOX_NPC
	end

PewterCity_EventScript_MuseumGuide:: @ 816607E
	lock
	faceplayer
	msgbox PewterCity_Text_DidYouCheckOutMuseum, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PewterCity_EventScript_CheckedOutMuseum
	msgbox PewterCity_Text_ReallyYouHaveToGo
	closemessage
	delay 10
	playbgm MUS_FOLLOW_ME, 0
	compare VAR_FACING, DIR_NORTH
	call_if_eq PewterCity_EventScript_LeadToMuseumNorth
	compare VAR_FACING, DIR_SOUTH
	call_if_eq PewterCity_EventScript_LeadToMuseumSouth
	compare VAR_FACING, DIR_WEST
	call_if_eq PewterCity_EventScript_LeadToMuseumWest
	compare VAR_FACING, DIR_EAST
	call_if_eq PewterCity_EventScript_LeadToMuseumEast
	msgbox PewterCity_Text_ThisIsTheMuseum
	closemessage
	delay 10
	applymovement LOCALID_MUSEUM_GUIDE, PewterCity_Movement_MuseumGuideExit
	waitmovement 0
	fadedefaultbgm
	removeobject LOCALID_MUSEUM_GUIDE
	clearflag FLAG_HIDE_PEWTER_MUSEUM_GUIDE
	release
	end

PewterCity_EventScript_LeadToMuseumNorth:: @ 81660EE
	applymovement LOCALID_MUSEUM_GUIDE, PewterCity_Movement_GuideWalkToMuseumNorth
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToMuseumNorth
	waitmovement 0
	return

PewterCity_EventScript_LeadToMuseumSouth:: @ 8166100
	applymovement LOCALID_MUSEUM_GUIDE, PewterCity_Movement_GuideWalkToMuseumSouth
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToMuseumSouth
	waitmovement 0
	return

PewterCity_EventScript_LeadToMuseumWest:: @ 8166112
	applymovement LOCALID_MUSEUM_GUIDE, PewterCity_Movement_GuideWalkToMuseumWest
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToMuseumWest
	waitmovement 0
	return

PewterCity_EventScript_LeadToMuseumEast:: @ 8166124
	applymovement LOCALID_MUSEUM_GUIDE, PewterCity_Movement_GuideWalkToMuseumEast
	applymovement OBJ_EVENT_ID_PLAYER, PewterCity_Movement_PlayerWalkToMuseumEast
	waitmovement 0
	return

PewterCity_EventScript_CheckedOutMuseum:: @ 8166136
	msgbox PewterCity_Text_WerentThoseFossilsAmazing
	release
	end

.macro walk_to_museum
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
.endm

.macro walk_to_museum_south
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
.endm

PewterCity_Movement_PlayerWalkToMuseumNorth:: @ 8166140
	walk_up
	walk_to_museum
	delay_8
	walk_in_place_fastest_up
	step_end

PewterCity_Movement_GuideWalkToMuseumNorth:: @ 816615C
	walk_to_museum
	walk_left
	walk_in_place_fastest_up
	step_end

PewterCity_Movement_PlayerWalkToMuseumSouth:: @ 8166177
	delay_16
	delay_16
	walk_left
	walk_to_museum_south
	delay_8
	walk_in_place_fastest_up
	step_end

PewterCity_Movement_GuideWalkToMuseumSouth:: @ 8166193
	walk_left
	walk_up
	walk_to_museum_south
	walk_left
	walk_in_place_fastest_up
	step_end

PewterCity_Movement_PlayerWalkToMuseumWest:: @ 81661AE
	walk_left
	walk_to_museum
	delay_8
	walk_in_place_fastest_up
	step_end

PewterCity_Movement_GuideWalkToMuseumWest:: @ 81661CA
	walk_to_museum
	walk_left
	walk_in_place_fastest_up
	step_end

PewterCity_Movement_PlayerWalkToMuseumEast:: @ 81661E5
	walk_right
	walk_to_museum
	delay_8
	walk_in_place_fastest_up
	step_end

PewterCity_Movement_GuideWalkToMuseumEast:: @ 8166201
	walk_to_museum
	walk_left
	walk_in_place_fastest_up
	step_end

PewterCity_Movement_MuseumGuideExit:: @ 816621C
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	step_end

PewterCity_EventScript_FatMan:: @ 816622B
	lock
	faceplayer
	famechecker FAMECHECKER_BROCK, 2
	msgbox PewterCity_Text_BrockOnlySeriousTrainerHere
	release
	end

PewterCity_EventScript_BugCatcher:: @ 8166244
	lock
	faceplayer
	msgbox PewterCity_Text_DoYouKnowWhatImDoing, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PewterCity_EventScript_KnowWhatTheyreDoing
	msgbox PewterCity_Text_SprayingRepelToKeepWildMonsOut
	release
	end

PewterCity_EventScript_KnowWhatTheyreDoing:: @ 8166263
	msgbox PewterCity_Text_ThatsRightItsHardWork
	release
	end

PewterCity_EventScript_TrainerTips:: @ 816626D
	msgbox PewterCity_Text_TrainerTipsEarningEXP, MSGBOX_SIGN
	end

PewterCity_EventScript_PoliceNotice:: @ 8166276
	msgbox PewterCity_Text_CallPoliceIfInfoOnThieves, MSGBOX_SIGN
	end

PewterCity_EventScript_MuseumSign:: @ 816627F
	msgbox PewterCity_Text_MuseumOfScience, MSGBOX_SIGN
	end

PewterCity_EventScript_GymSign:: @ 8166288
	lockall
	famechecker FAMECHECKER_BROCK, 0
	msgbox PewterCity_Text_GymSign
	releaseall
	end

PewterCity_EventScript_CitySign:: @ 81662A0
	msgbox PewterCity_Text_CitySign, MSGBOX_SIGN
	end

PewterCity_EventScript_RunningShoesAide:: @ 81662A9
	lock
	faceplayer
	setvar VAR_TEMP_1, 0
	call PewterCity_EventScript_AideGiveRunningShoes
	release
	end

PewterCity_EventScript_RunningShoesAideTriggerTop:: @ 81662B7
	lockall
	setvar VAR_TEMP_1, 1
	call PewterCity_EventScript_AideGiveRunningShoes
	releaseall
	end

PewterCity_EventScript_RunningShoesAideTriggerMid:: @ 81662C4
	lockall
	setvar VAR_TEMP_1, 2
	call PewterCity_EventScript_AideGiveRunningShoes
	releaseall
	end

PewterCity_EventScript_RunningShoesAideTriggerBottom:: @ 81662D1
	lockall
	setvar VAR_TEMP_1, 3
	call PewterCity_EventScript_AideGiveRunningShoes
	releaseall
	end

PewterCity_EventScript_AideGiveRunningShoes:: @ 81662DE
	textcolor 0
	compare VAR_TEMP_1, 1
	call_if_eq PewterCity_EventScript_AideNoticePlayer
	compare VAR_TEMP_1, 2
	call_if_eq PewterCity_EventScript_AideNoticePlayer
	compare VAR_TEMP_1, 3
	call_if_eq PewterCity_EventScript_AideNoticePlayer
	waitse
	playse SE_PIN
	applymovement LOCALID_AIDE, Movement_ExclamationMark
	waitmovement 0
	applymovement LOCALID_AIDE, Movement_Delay48
	waitmovement 0
	msgbox PewterCity_Text_OhPlayer
	compare VAR_TEMP_1, 0
	call_if_eq PewterCity_EventScript_AideApproachPlayer0
	compare VAR_TEMP_1, 1
	call_if_eq PewterCity_EventScript_AideApproachPlayer1
	compare VAR_TEMP_1, 2
	call_if_eq PewterCity_EventScript_AideApproachPlayer2
	compare VAR_TEMP_1, 3
	call_if_eq PewterCity_EventScript_AideApproachPlayer3
	msgbox PewterCity_Text_AskedToDeliverThis
	textcolor 3
	playfanfare MUS_OBTAIN_KEY_ITEM
	message PewterCity_Text_ReceivedRunningShoesFromAide
	waitmessage
	waitfanfare
	msgbox PewterCity_Text_SwitchedShoesWithRunningShoes
	special DisableMsgBoxWalkaway
	signmsg
	msgbox PewterCity_Text_ExplainRunningShoes
	normalmsg
	call EventScript_RestorePrevTextColor
	msgbox PewterCity_Text_MustBeGoingBackToLab
	closemessage
	compare VAR_TEMP_1, 0
	call_if_eq PewterCity_EventScript_AideExit0
	compare VAR_TEMP_1, 1
	call_if_eq PewterCity_EventScript_AideExit1
	compare VAR_TEMP_1, 2
	call_if_eq PewterCity_EventScript_AideExit2
	compare VAR_TEMP_1, 3
	call_if_eq PewterCity_EventScript_AideExit3
	delay 30
	textcolor 3
	msgbox PewterCity_Text_RunningShoesLetterFromMom
	closemessage
	removeobject LOCALID_AIDE
	setflag FLAG_SYS_B_DASH
	setvar VAR_MAP_SCENE_PEWTER_CITY, 2
	return

PewterCity_EventScript_AideNoticePlayer:: @ 81663CA
	applymovement LOCALID_AIDE, Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

@ Aide already at player
PewterCity_EventScript_AideApproachPlayer0:: @ 81663D5
	closemessage
	delay 20
	return

PewterCity_EventScript_AideApproachPlayer1:: @ 81663DA
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PewterCity_EventScript_AideApproachPlayer2:: @ 81663E6
	closemessage
	applymovement LOCALID_AIDE, PewterCity_Movement_AideApproachPlayerMid
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PewterCity_EventScript_AideApproachPlayer3:: @ 81663FC
	closemessage
	applymovement LOCALID_AIDE, PewterCity_Movement_AideApproachPlayerBottom
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PewterCity_EventScript_AideExit0:: @ 8166412
	applymovement LOCALID_AIDE, PewterCity_Movement_AideExit0
	waitmovement 0
	return

PewterCity_EventScript_AideExit1:: @ 816641D
	applymovement LOCALID_AIDE, PewterCity_Movement_AideExit1
	waitmovement 0
	return

PewterCity_EventScript_AideExit2:: @ 8166428
	applymovement LOCALID_AIDE, PewterCity_Movement_AideExit2
	waitmovement 0
	return

PewterCity_EventScript_AideExit3:: @ 8166433
	applymovement LOCALID_AIDE, PewterCity_Movement_AideExit3
	waitmovement 0
	return

PewterCity_Movement_AideApproachPlayerMid:: @ 816643E
	delay_4
	walk_down
	step_end

PewterCity_Movement_AideApproachPlayerBottom:: @ 8166441
	delay_4
	walk_down
	walk_down
	step_end

PewterCity_Movement_AideExit0:: @ 8166445
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

PewterCity_Movement_AideExit1:: @ 8166450
	walk_left
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

PewterCity_Movement_AideExit2:: @ 816645B
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

PewterCity_Movement_AideExit3:: @ 8166465
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

@ Unused
PewterCity_Movement_WalkInPlaceLeft:: @ 816646F
	walk_in_place_left
	step_end
