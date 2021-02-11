.set LOCALID_OLD_MAN,      3
.set LOCALID_TUTORIAL_MAN, 4
.set LOCALID_WOMAN,        5

ViridianCity_MapScripts:: @ 81658D3
	map_script MAP_SCRIPT_ON_TRANSITION, ViridianCity_OnTransition
	.byte 0

ViridianCity_OnTransition:: @ 81658D9
	setworldmapflag FLAG_WORLD_MAP_VIRIDIAN_CITY
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0
	call_if_eq ViridianCity_EventScript_SetOldManBlockingRoad
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1
	call_if_eq ViridianCity_EventScript_SetOldManStandingByRoad
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
	call_if_ge ViridianCity_EventScript_SetOldManNormal
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 0
	call_if_eq ViridianCity_EventScript_TryUnlockGym
	end

ViridianCity_EventScript_SetOldManNormal:: @ 8165909
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OLD_MAN_1
	return

ViridianCity_EventScript_SetOldManStandingByRoad:: @ 816590F
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OLD_MAN_1
	setobjectxyperm LOCALID_TUTORIAL_MAN, 21, 8
	setobjectmovementtype LOCALID_TUTORIAL_MAN, MOVEMENT_TYPE_LOOK_AROUND
	return

ViridianCity_EventScript_SetOldManBlockingRoad:: @ 8165920
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OLD_MAN_LYING_DOWN
	setobjectxyperm LOCALID_TUTORIAL_MAN, 21, 11
	setobjectmovementtype LOCALID_TUTORIAL_MAN, MOVEMENT_TYPE_FACE_DOWN
	return

ViridianCity_EventScript_TryUnlockGym:: @ 8165931
	goto_if_unset FLAG_BADGE02_GET, EventScript_Return
	goto_if_unset FLAG_BADGE03_GET, EventScript_Return
	goto_if_unset FLAG_BADGE04_GET, EventScript_Return
	goto_if_unset FLAG_BADGE05_GET, EventScript_Return
	goto_if_unset FLAG_BADGE06_GET, EventScript_Return
	goto_if_unset FLAG_BADGE07_GET, EventScript_Return
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 1
	return

ViridianCity_EventScript_GymDoorLocked:: @ 816596D
	lockall
	textcolor 3
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	msgbox ViridianCity_Text_GymDoorsAreLocked
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, ViridianCity_Movement_JumpDownLedge
	waitmovement 0
	releaseall
	end

ViridianCity_Movement_JumpDownLedge:: @ 8165992
	jump_2_down
	step_end

ViridianCity_EventScript_CitySign:: @ 8165994
	msgbox ViridianCity_Text_CitySign, MSGBOX_SIGN
	end

ViridianCity_EventScript_TrainerTips1:: @ 816599D
	msgbox ViridianCity_Text_CatchMonsForEasierBattles, MSGBOX_SIGN
	end

ViridianCity_EventScript_TrainerTips2:: @ 81659A6
	msgbox ViridianCity_Text_MovesLimitedByPP, MSGBOX_SIGN
	end

ViridianCity_EventScript_GymSign:: @ 81659AF
	msgbox ViridianCity_Text_GymSign, MSGBOX_SIGN
	end

ViridianCity_EventScript_GymDoor:: @ 81659B8
	msgbox ViridianCity_Text_GymDoorsAreLocked, MSGBOX_SIGN
	end

ViridianCity_EventScript_Boy:: @ 81659C1
	msgbox ViridianCity_Text_CanCarryMonsAnywhere, MSGBOX_NPC
	end

@ Other old man, not the tutorial old man
ViridianCity_EventScript_OldMan:: @ 81659CA
	lock
	faceplayer
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 1
	goto_if_eq ViridianCity_EventScript_OldManGymLeaderReturned
	msgbox ViridianCity_Text_GymClosedWonderWhoLeaderIs
	closemessage
	applymovement LOCALID_OLD_MAN, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

ViridianCity_EventScript_OldManGymLeaderReturned:: @ 81659EC
	msgbox ViridianCity_Text_ViridiansGymLeaderReturned
	release
	end

ViridianCity_EventScript_TutorialOldMan:: @ 81659F6
	lock
	faceplayer
	goto_if_set FLAG_BADGE01_GET, ViridianCity_EventScript_AskIfTeachyTVHelpful
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
	goto_if_ge ViridianCity_EventScript_TutorialCompleted
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1
	goto_if_eq ViridianCity_EventScript_TutorialStart
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0
	goto_if_eq ViridianCity_EventScript_TutorialNotReady
	end

ViridianCity_EventScript_AskIfTeachyTVHelpful:: @ 8165A23
	msgbox ViridianCity_Text_HowsTeachyTVHelping, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq ViridianCity_EventScript_TeachyTVNotHelpful
	msgbox ViridianCity_Text_MyGrandsonOnTheShow
	release
	end

ViridianCity_EventScript_TeachyTVNotHelpful:: @ 8165A40
	msgbox ViridianCity_Text_TooBusyForTeachyTV
	release
	end

ViridianCity_EventScript_TutorialCompleted:: @ 8165A4A
	msgbox ViridianCity_Text_WeakenMonsFirstToCatch
	release
	end

ViridianCity_EventScript_TutorialStart:: @ 8165A54
	call ViridianCity_EventScript_DoTutorialBattle
	release
	end

@ Unused
ViridianCity_EventScript_WatchToLearnBasics:: @ 8165A5B
	msgbox ViridianCity_Text_WatchThatToLearnBasics
	release
	end

@ Unused. Starts battle after the post battle text, which is odd.
ViridianCity_EventScript_TutorialUnused:: @ 8165A65
	msgbox ViridianCity_Text_ThatWasEducationalTakeThis
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	special StartOldManTutorialBattle
	waitstate
	release
	end

ViridianCity_EventScript_TutorialNotReady:: @ 8165A84
	msgbox ViridianCity_Text_ThisIsPrivateProperty
	closemessage
	release
	end

ViridianCity_EventScript_Youngster:: @ 8165A8F
	lock
	faceplayer
	msgbox ViridianCity_Text_WantToKnowAboutCaterpillarMons, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq ViridianCity_EventScript_YoungsterExplainCaterpillars
	compare VAR_RESULT, NO
	goto_if_eq ViridianCity_EventScript_YoungsterDeclineExplanation
	end

ViridianCity_EventScript_YoungsterExplainCaterpillars:: @ 8165AB0
	msgbox ViridianCity_Text_ExplainCaterpieWeedle
	release
	end

ViridianCity_EventScript_YoungsterDeclineExplanation:: @ 8165ABA
	msgbox ViridianCity_Text_OhOkayThen
	release
	end

ViridianCity_EventScript_Woman:: @ 8165AC4
	lock
	faceplayer
	compare VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0
	goto_if_eq ViridianCity_EventScript_WomanRoadBlocked
	msgbox ViridianCity_Text_GoShoppingInPewterOccasionally
	release
	end

ViridianCity_EventScript_WomanRoadBlocked:: @ 8165ADB
	msgbox ViridianCity_Text_GrandpaHasntHadCoffeeYet
	closemessage
	applymovement LOCALID_WOMAN, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

ViridianCity_EventScript_DreamEaterTutor:: @ 8165AF0
	goto EventScript_DreamEaterTutor
	end

ViridianCity_EventScript_RoadBlocked:: @ 8165AF6
	lockall
	textcolor 0
	msgbox ViridianCity_Text_ThisIsPrivateProperty
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, ViridianCity_Movement_WalkDown
	waitmovement 0
	releaseall
	end

ViridianCity_Movement_WalkDown:: @ 8165B0E
	walk_down
	step_end

ViridianCity_EventScript_TutorialTriggerLeft:: @ 8165B10
	lockall
	textcolor 0
	applymovement LOCALID_TUTORIAL_MAN, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	call ViridianCity_EventScript_DoTutorialBattle
	release
	end

ViridianCity_EventScript_TutorialTriggerRight:: @ 8165B2E
	lockall
	textcolor 0
	applymovement LOCALID_TUTORIAL_MAN, Movement_WalkInPlaceFastestRight
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	call ViridianCity_EventScript_DoTutorialBattle
	release
	end

ViridianCity_EventScript_DoTutorialBattle:: @ 8165B4C
	msgbox ViridianCity_Text_ShowYouHowToCatchMons
	closemessage
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	special StartOldManTutorialBattle
	waitstate
	lock
	faceplayer
	msgbox ViridianCity_Text_ThatWasEducationalTakeThis
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
	giveitem ITEM_TEACHY_TV
	msgbox ViridianCity_Text_WatchThatToLearnBasics
	return
