ViridianCity_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, ViridianCity_OnTransition
	.byte 0

ViridianCity_OnTransition::
	setworldmapflag FLAG_WORLD_MAP_VIRIDIAN_CITY
	call_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0, ViridianCity_EventScript_SetOldManBlockingRoad
	call_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1, ViridianCity_EventScript_SetOldManStandingByRoad
	call_if_ge VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2, ViridianCity_EventScript_SetOldManNormal
	call_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 0, ViridianCity_EventScript_TryUnlockGym
	end

ViridianCity_EventScript_SetOldManNormal::
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OLD_MAN_1
	return

ViridianCity_EventScript_SetOldManStandingByRoad::
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OLD_MAN_1
	setobjectxyperm LOCALID_TUTORIAL_MAN, 19, 8
	setobjectmovementtype LOCALID_TUTORIAL_MAN, MOVEMENT_TYPE_LOOK_AROUND
	return

ViridianCity_EventScript_SetOldManBlockingRoad::
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_OLD_MAN_LYING_DOWN
	setobjectxyperm LOCALID_TUTORIAL_MAN, 19, 12
	setobjectmovementtype LOCALID_TUTORIAL_MAN, MOVEMENT_TYPE_FACE_DOWN
	return

ViridianCity_EventScript_TryUnlockGym::
	goto_if_unset FLAG_BADGE02_GET, EventScript_Return
	goto_if_unset FLAG_BADGE03_GET, EventScript_Return
	goto_if_unset FLAG_BADGE04_GET, EventScript_Return
	goto_if_unset FLAG_BADGE05_GET, EventScript_Return
	goto_if_unset FLAG_BADGE06_GET, EventScript_Return
	goto_if_unset FLAG_BADGE07_GET, EventScript_Return
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 1
	return

ViridianCity_EventScript_GymDoorLocked::
	lockall
	textcolor NPC_TEXT_COLOR_NEUTRAL
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFasterUp
	waitmovement 0
	delay 20
	signmsg
	msgbox ViridianCity_Text_GymDoorsAreLocked
	normalmsg
	closemessage
	applymovement LOCALID_PLAYER, ViridianCity_Movement_JumpDownLedge
	waitmovement 0
	releaseall
	end

ViridianCity_Movement_JumpDownLedge::
	jump_2_down
	step_end

ViridianCity_EventScript_BasuraItem1::
	lock
	faceplayer
	signmsg
	goto_if_set FLAG_HIDDEN_ITEM_CUIDAD_VERDE1, ViridianCity_EventScript_Basura
	giveitem_msg ViridianCity_Text_BasuraItem1, ITEM_POTION
	setflag FLAG_HIDDEN_ITEM_CUIDAD_VERDE1
	normalmsg
	release
	end

ViridianCity_EventScript_BasuraItem2::
	lock
	faceplayer
	signmsg
	goto_if_set FLAG_HIDDEN_ITEM_CUIDAD_VERDE2, ViridianCity_EventScript_Basura
	giveitem_msg ViridianCity_Text_BasuraItem2, ITEM_POKE_BALL
	setflag FLAG_HIDDEN_ITEM_CUIDAD_VERDE2
	normalmsg
	release
	end

ViridianCity_EventScript_BasuraItem3::
	lock
	faceplayer
	signmsg
	goto_if_set FLAG_HIDDEN_ITEM_CUIDAD_VERDE3, ViridianCity_EventScript_Basura
	giveitem_msg ViridianCity_Text_BasuraItem3, ITEM_ANTIDOTE
	setflag FLAG_HIDDEN_ITEM_CUIDAD_VERDE3
	normalmsg
	release
	end

ViridianCity_EventScript_Basura::
	signmsg
	msgbox ViridianCity_Text_Basura, MSGBOX_SIGN
	normalmsg
	release
	end


ViridianCity_EventScript_CitySign::
	msgbox ViridianCity_Text_CitySign, MSGBOX_SIGN
	end
ViridianCity_EventScript_LetreroEscuela::
	msgbox ViridianCity_Text_EventScript_LetreroEscuela, MSGBOX_SIGN
	end

ViridianCity_EventScript_TrainerTips1::
	msgbox ViridianCity_Text_CatchMonsForEasierBattles, MSGBOX_SIGN
	end

ViridianCity_EventScript_TrainerTips2::
	msgbox ViridianCity_Text_MovesLimitedByPP, MSGBOX_SIGN
	end

ViridianCity_EventScript_GymSign::
	msgbox ViridianCity_Text_GymSign, MSGBOX_SIGN
	end

ViridianCity_EventScript_GymDoor::
	msgbox ViridianCity_Text_GymDoorsAreLocked, MSGBOX_SIGN
	end

ViridianCity_EventScript_Boy::
	msgbox ViridianCity_Text_CanCarryMonsAnywhere, MSGBOX_NPC
	end

@ Other old man, not the tutorial old man
ViridianCity_EventScript_OldMan::
	lock
	faceplayer
	goto_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_GYM_DOOR, 1, ViridianCity_EventScript_OldManGymLeaderReturned
	msgbox ViridianCity_Text_GymClosedWonderWhoLeaderIs
	closemessage
	applymovement LOCALID_VIRIDIAN_OLD_MAN, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

ViridianCity_EventScript_OldManGymLeaderReturned::
	msgbox ViridianCity_Text_ViridiansGymLeaderReturned
	release
	end

ViridianCity_EventScript_TutorialOldMan::
	lock
	faceplayer
	goto_if_set FLAG_BADGE01_GET, ViridianCity_EventScript_AskIfTeachyTVHelpful
	goto_if_ge VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2, ViridianCity_EventScript_TutorialCompleted
	goto_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 1, ViridianCity_EventScript_TutorialStart
	goto_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0, ViridianCity_EventScript_TutorialNotReady
	end

ViridianCity_EventScript_AskIfTeachyTVHelpful::
	msgbox ViridianCity_Text_HowsTeachyTVHelping, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, ViridianCity_EventScript_TeachyTVNotHelpful
	msgbox ViridianCity_Text_MyGrandsonOnTheShow
	release
	end

ViridianCity_EventScript_TeachyTVNotHelpful::
	msgbox ViridianCity_Text_TooBusyForTeachyTV
	release
	end

ViridianCity_EventScript_TutorialCompleted::
	msgbox ViridianCity_Text_WeakenMonsFirstToCatch
	release
	end

ViridianCity_EventScript_TutorialStart::
	call ViridianCity_EventScript_DoTutorialBattle
	release
	end

@ Unused
ViridianCity_EventScript_WatchToLearnBasics::
	msgbox ViridianCity_Text_WatchThatToLearnBasics
	release
	end

@ Unused. Starts battle after the post battle text, which is odd.
ViridianCity_EventScript_TutorialUnused::
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	special StartOldManTutorialBattle
	waitstate
	release
	end

ViridianCity_EventScript_TutorialNotReady::
	msgbox ViridianCity_Text_ThisIsPrivateProperty
	closemessage
	release
	end

ViridianCity_EventScript_Youngster::
	lock
	faceplayer
	msgbox ViridianCity_Text_WantToKnowAboutCaterpillarMons, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, YES, ViridianCity_EventScript_YoungsterExplainCaterpillars
	goto_if_eq VAR_RESULT, NO, ViridianCity_EventScript_YoungsterDeclineExplanation
	end

ViridianCity_EventScript_YoungsterExplainCaterpillars::
	msgbox ViridianCity_Text_ExplainCaterpieWeedle
	release
	end

ViridianCity_EventScript_YoungsterDeclineExplanation::
	msgbox ViridianCity_Text_OhOkayThen
	release
	end

ViridianCity_EventScript_Woman::
	lock
	faceplayer
	goto_if_eq VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 0, ViridianCity_EventScript_WomanRoadBlocked
	msgbox ViridianCity_Text_GoShoppingInPewterOccasionally
	release
	end

ViridianCity_EventScript_WomanRoadBlocked::
	msgbox ViridianCity_Text_GrandpaHasntHadCoffeeYet
	closemessage
	applymovement LOCALID_VIRIDIAN_WOMAN, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

ViridianCity_EventScript_DreamEaterTutor::
	goto EventScript_DreamEaterTutor
	end

ViridianCity_EventScript_RoadBlocked::
	lockall
	textcolor NPC_TEXT_COLOR_MALE
	msgbox ViridianCity_Text_ThisIsPrivateProperty
	closemessage
	applymovement LOCALID_PLAYER, ViridianCity_Movement_WalkDown
	waitmovement 0
	releaseall
	end

ViridianCity_Movement_WalkDown::
	walk_down
	step_end

ViridianCity_EventScript_TutorialTriggerLeft::
	lockall
	applymovement LOCALID_TUTORIAL_MAN, Common_Movement_WalkInPlaceFasterLeft
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFasterRight
	waitmovement 0
	call ViridianCity_EventScript_DoTutorialBattle
	release
	end

ViridianCity_EventScript_TutorialTriggerRight::
	lockall
	applymovement LOCALID_TUTORIAL_MAN, Common_Movement_WalkInPlaceFasterRight
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFasterLeft
	waitmovement 0
	call ViridianCity_EventScript_DoTutorialBattle
	release
	end

ViridianCity_EventScript_DoTutorialBattle::
	msgbox ViridianCity_Text_ShowYouHowToCatchMons
	closemessage
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	setvar VAR_MAP_SCENE_VIRIDIAN_CITY_OLD_MAN, 2
	signmsg
	giveitem ITEM_TEACHY_TV
	normalmsg
	msgbox ViridianCity_Text_WatchThatToLearnBasics
	return

ViridianCity_MareepMujer::
	msgbox ViridianCity_Text_Mareep, MSGBOX_NPC
	playmoncry SPECIES_MAREEP, CRY_MODE_ENCOUNTER
	applymovement 17, ViridianCity_Movement_Mareep
	waitmovement 0
	releaseall
	end

ViridianCity_Mareep::
	playmoncry SPECIES_MAREEP, CRY_MODE_ENCOUNTER
	applymovement 17, ViridianCity_Movement_Mareep
	waitmovement 0
	releaseall
	end
	
ViridianCity_Movement_Mareep::
	emote_exclamation_mark
	jump_in_place_down
	step_end

ViridianCity_EntrenadorBuscaLider::
	msgbox ViridianCity_Text_EntrenadorBuscaLider, MSGBOX_NPC
	releaseall
	end

ViridianCity_EntrenadorPequeno1::
	msgbox ViridianCity_Text_EntrenadorPequeno1
	closemessage
	playmoncry SPECIES_SANDSHREW, CRY_MODE_NORMAL
	applymovement 11, ViridianCity_Movement_Sandshrew
	waitmovement 0
	waitmoncry
	end

ViridianCity_Sandshrew::
	playmoncry SPECIES_SANDSHREW, CRY_MODE_NORMAL
	applymovement 11, ViridianCity_Movement_Sandshrew
	waitmovement 0
	waitmoncry
	end

ViridianCity_Nidoran::
	playmoncry SPECIES_NIDORAN_F, CRY_MODE_NORMAL
	applymovement 12, ViridianCity_Movement_Nidoran2
	waitmovement 0
	waitmoncry
	end


ViridianCity_Movement_Sandshrew::
	emote_x
	step_end

ViridianCity_EntrenadorPequeno2::
	playmoncry SPECIES_NIDORAN_F, CRY_MODE_NORMAL
	applymovement 12, ViridianCity_Movement_Nidoran1
	waitmovement 0
	waitmoncry
	end

ViridianCity_Movement_Nidoran1::
	walk_in_place_left
	emote_exclamation_mark
	jump_left
	slide_right
	face_left
	step_end

ViridianCity_Movement_Nidoran2::
	walk_in_place_left
	emote_exclamation_mark
	face_left
	step_end

ViridianCity_InfoEscuela::
	msgbox ViridianCity_Text_InfoEscuela, MSGBOX_NPC
	releaseall
	end