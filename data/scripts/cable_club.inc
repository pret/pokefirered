CableClub_OnTransition::
	call CableClub_EventScript_HideOrShowMysteryGiftMan
	end

CableClub_EventScript_HideOrShowMysteryGiftMan::
	specialvar VAR_RESULT, ValidateSavedWonderCard
	goto_if_eq VAR_RESULT, FALSE, EventScript_HideMysteryGiftMan
	clearflag FLAG_HIDE_MG_DELIVERYMEN
	return

EventScript_HideMysteryGiftMan::
	setflag FLAG_HIDE_MG_DELIVERYMEN
	return

CableClub_EventScript_MysteryGiftMan::
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	trywondercardscript

@ Unused
EventScript_MysteryGiftThankYou::
	msgbox Text_ThankYouForAccessingMysteryGift, MSGBOX_NPC
	end

CableClub_OnWarp::
	map_script_2 VAR_CABLE_CLUB_STATE, USING_SINGLE_BATTLE, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_DOUBLE_BATTLE, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MULTI_BATTLE, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_TRADE_CENTER, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_UNION_ROOM, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_BERRY_CRUSH, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MINIGAME, EventScript_CheckTurnAttendant
	.2byte 0

EventScript_CheckTurnAttendant::
	goto_if_eq VAR_0x8007, 0, EventScript_CheckTurnAttendantEnd
	turnobject VAR_0x8007, DIR_WEST
EventScript_CheckTurnAttendantEnd:
	end

CableClub_OnLoad::
	goto_if_eq VAR_CABLE_CLUB_STATE, USING_SINGLE_BATTLE, EventScript_OnLoadFromColosseum
	goto_if_eq VAR_CABLE_CLUB_STATE, USING_DOUBLE_BATTLE, EventScript_OnLoadFromColosseum
	goto_if_eq VAR_CABLE_CLUB_STATE, USING_MULTI_BATTLE, EventScript_OnLoadFromColosseum
	goto_if_eq VAR_CABLE_CLUB_STATE, USING_TRADE_CENTER, EventScript_OnLoadFromTradeCenter
	goto_if_eq VAR_CABLE_CLUB_STATE, USING_UNION_ROOM, EventScript_OnLoadFromUnionRoom
	goto_if_eq VAR_CABLE_CLUB_STATE, USING_BERRY_CRUSH, EventScript_OnLoadFromBerryCrush
	goto_if_eq VAR_CABLE_CLUB_STATE, USING_MINIGAME, EventScript_OnLoadFromGameCorner
	end

EventScript_OnLoadFromColosseum::
	call CableClub_EventScript_OpenDirectCornerBarrier
	end

EventScript_OnLoadFromTradeCenter::
	call CableClub_EventScript_OpenDirectCornerBarrier
	end

EventScript_OnLoadFromUnionRoom::
	call CableClub_EventScript_OpenUnionRoomBarrier
	end

EventScript_OnLoadFromBerryCrush::
	call CableClub_EventScript_OpenDirectCornerBarrier
	end

EventScript_OnLoadFromGameCorner::
	call CableClub_EventScript_OpenGameCornerBarrier
	end

CableClub_OnFrame::
	map_script_2 VAR_MAP_SCENE_POKEMON_CENTER_TEALA, 1, CableClub_EventScript_Tutorial
	map_script_2 VAR_CABLE_CLUB_STATE, USING_SINGLE_BATTLE, CableClub_EventScript_ExitLinkRoom
	map_script_2 VAR_CABLE_CLUB_STATE, USING_DOUBLE_BATTLE, CableClub_EventScript_ExitLinkRoom
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MULTI_BATTLE, CableClub_EventScript_ExitLinkRoom
	map_script_2 VAR_CABLE_CLUB_STATE, USING_TRADE_CENTER, CableClub_EventScript_ExitTradeCenter
	map_script_2 VAR_CABLE_CLUB_STATE, USING_UNION_ROOM, CableClub_EventScript_ExitUnionRoom
	map_script_2 VAR_CABLE_CLUB_STATE, USING_BERRY_CRUSH, CableClub_EventScript_ExitLinkRoom
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MINIGAME, CableClub_EventScript_ExitMinigameRoom
	.2byte 0

CableClub_EventScript_ExitLinkRoom::
	lockall
	call CableClub_EventScript_CloseLinkAndExitLinkRoom
	call CableClub_EventScript_CloseDirectCornerBarrier
	special DrawWholeMapView
	playse SE_CLICK
	erasebox 0, 0, 29, 19
	releaseall
	end

CableClub_EventScript_ExitMinigameRoom::
	lockall
	call CableClub_EventScript_CloseLinkAndExitLinkRoom
	call CableClub_EventScript_CloseGameCornerBarrier
	special DrawWholeMapView
	playse SE_CLICK
	erasebox 0, 0, 29, 19
	releaseall
	end

CableClub_EventScript_CloseLinkAndExitLinkRoom::
	special CloseLink
	special HelpSystem_Enable
	special QuestLog_StartRecordingInputsAfterDeferredEvent
	setvar VAR_CABLE_CLUB_STATE, 0
	textcolor NPC_TEXT_COLOR_FEMALE
	goto_if_eq VAR_0x8007, 0, CableClub_EventScript_PlayerExitLinkRoom
	applymovement VAR_0x8007, Movement_AttendantFaceLeft
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerExitLinkRoom
	waitmovement 0
	applymovement VAR_0x8007, Movement_AttendantFaceDown
	waitmovement 0
	return

CableClub_EventScript_ExitTradeCenter::
	lockall
	call CableClub_EventScript_PlayerExitTradeCenter
	call CableClub_EventScript_CloseDirectCornerBarrier
	special DrawWholeMapView
	playse SE_CLICK
	erasebox 0, 0, 29, 19
	releaseall
	end

CableClub_EventScript_PlayerExitTradeCenter::
	special CloseLink
	special HelpSystem_Enable
	special QuestLog_StartRecordingInputsAfterDeferredEvent
	setvar VAR_CABLE_CLUB_STATE, 0
	textcolor NPC_TEXT_COLOR_FEMALE
	goto_if_eq VAR_0x8007, 0, CableClub_EventScript_PlayerExitLinkRoom
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerFaceAttendantRight
	waitmovement 0
	applymovement VAR_0x8007, Movement_AttendantFaceLeft
	waitmovement 0
	call CableClub_EventScript_TrainerCardDataOverwritten
	return

CableClub_EventScript_ExitUnionRoom::
	lockall
	call CableClub_EventScript_PlayerExitUnionRoom
	call CableClub_EventScript_CloseUnionRoomBarrier
	special DrawWholeMapView
	playse SE_CLICK
	erasebox 0, 0, 29, 19
	releaseall
	end

CableClub_EventScript_PlayerExitUnionRoom::
	special HelpSystem_Enable
	special QuestLog_StartRecordingInputsAfterDeferredEvent
	setvar VAR_CABLE_CLUB_STATE, 0
	textcolor NPC_TEXT_COLOR_FEMALE
	goto_if_eq VAR_0x8007, 0, CableClub_EventScript_PlayerExitLinkRoom
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerFaceAttendantRight
	waitmovement 0
	applymovement VAR_0x8007, Movement_AttendantFaceLeft
	waitmovement 0
	call CableClub_EventScript_TrainerCardDataOverwritten
	return

CableClub_EventScript_TrainerCardDataOverwritten::
	message CableClub_Text_TrainerCardDataOverwritten
	waitmessage
	playse SE_PIN
	message CableClub_Text_HopeToSeeYouAgain
	waitmessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerExitLinkRoom
	waitmovement 0
	applymovement VAR_0x8007, Movement_AttendantFaceDown
	waitmovement 0
	return

CableClub_EventScript_PlayerExitLinkRoom::
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerExitLinkRoom
	waitmovement 0
	return

CableClub_EventScript_Tutorial::
	lockall
	textcolor NPC_TEXT_COLOR_FEMALE
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFasterUp
	waitmovement 0
	msgbox CableClub_Text_FirstTimeRightThisWay
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerApproachCounter
	waitmovement 0
	delay 30
	msgbox CableClub_Text_ExplainWirelessClubFirstTime
	setvar VAR_MAP_SCENE_POKEMON_CENTER_TEALA, 2
	releaseall
	end

Movement_PlayerApproachCounter:
	walk_up
	walk_up
	step_end

CableClub_EventScript_WelcomeToCableClub::
	message CableClub_Text_WelcomeWhichCableClubService
	waitmessage
	delay 15
	goto CableClub_EventScript_SelectCableClubRoom
	end

CableClub_EventScript_UnusedWelcomeToCableClub::
	msgbox CableClub_Text_WhichService
	goto CableClub_EventScript_SelectCableClubRoom
	end

CableClub_EventScript_SelectCableClubRoom::
	setvar VAR_0x8004, 0
	multichoice 0, 0, MULTICHOICE_TRADE_CENTER_COLOSSEUM, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_TradeCenter
	case 1, CableClub_EventScript_Colosseum
	case 2, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_Colosseum::
	copyvar VAR_0x8007, VAR_LAST_TALKED
	goto CableClub_EventScript_SelectBattleMode
	end

CableClub_EventScript_SelectBattleMode::
	message CableClub_Text_PlayWhichBattleMode
	waitmessage
	multichoice 0, 0, MULTICHOICE_SINGLE_DOUBLE_MULTI_INFO_EXIT, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_SingleBattleMode
	case 1, CableClub_EventScript_DoubleBattleMode
	case 2, CableClub_EventScript_MultiBattleMode
	case 3, CableClub_EventScript_BattleModeInfo
	case 4, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_BattleModeInfo::
	msgbox CableClub_Text_ExplainBattleModes
	goto CableClub_EventScript_SelectBattleMode
	end

CableClub_EventScript_SingleBattleMode::
	setvar VAR_0x8004, USING_SINGLE_BATTLE
	goto CableClub_EventScript_TryEnterColosseum
	end

CableClub_EventScript_DoubleBattleMode::
	special HasEnoughMonsForDoubleBattle
	goto_if_ne VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS, CableClub_EventScript_NeedTwoMonsForDoubleBattle
	setvar VAR_0x8004, USING_DOUBLE_BATTLE
	goto CableClub_EventScript_TryEnterColosseum
	end

CableClub_EventScript_NeedTwoMonsForDoubleBattle::
	msgbox CableClub_Text_NeedTwoMonsForDoubleBattle
	goto CableClub_EventScript_SelectBattleMode
	end

CableClub_EventScript_MultiBattleMode::
	setvar VAR_0x8004, USING_MULTI_BATTLE
	goto CableClub_EventScript_TryEnterColosseum
	end

CableClub_EventScript_TryEnterColosseum::
	call EventScript_AskSaveGame
	goto_if_eq VAR_RESULT, 0, CableClub_EventScript_AbortLink
	message CableClub_Text_PleaseWaitBCancel
	waitmessage
	special HelpSystem_Disable
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special TryBattleLinkup
	waitstate
	call EventScript_RestorePrevTextColor
	goto_if_eq VAR_RESULT, LINKUP_SUCCESS, CableClub_EventScript_EnterColosseum
	goto_if_eq VAR_RESULT, LINKUP_SOMEONE_NOT_READY, CableClub_EventScript_AbortLinkSomeoneNotReady
	goto_if_eq VAR_RESULT, LINKUP_DIFF_SELECTIONS, CableClub_EventScript_AbortLinkDifferentSelections
	goto_if_eq VAR_RESULT, LINKUP_WRONG_NUM_PLAYERS, CableClub_EventScript_AbortLinkIncorrectNumberOfBattlers
	goto_if_eq VAR_RESULT, LINKUP_FAILED, CableClub_EventScript_AbortLink
	goto_if_eq VAR_RESULT, LINKUP_CONNECTION_ERROR, CableClub_EventScript_AbortLinkConnectionError
	end

CableClub_EventScript_EnterColosseum::
	special HealPlayerParty
	special SavePlayerParty
	special LoadPlayerBag
	copyvar VAR_CABLE_CLUB_STATE, VAR_0x8004
	messageautoscroll CableClub_Text_PleaseEnter
	waitmessage
	call CableClub_EventScript_OpenDirectCornerBarrier
	special DrawWholeMapView
	playse SE_CLICK
	delay 60
	applymovement VAR_LAST_TALKED, Movement_AttendantFaceLeft
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerApproachLinkRoomLeft
	waitmovement 0
	opendoor 9, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerEnterLinkRoom
	waitmovement 0
	hideobjectat OBJ_EVENT_ID_PLAYER, 0
	closedoor 9, 1
	waitdooranim
	release
	goto_if_eq VAR_0x8004, USING_MULTI_BATTLE, CableClub_EventScript_WarpTo4PColosseum
	special SetCableClubWarp
	warp MAP_BATTLE_COLOSSEUM_2P, 6, 8
	special DoCableClubWarp
	waitstate
	end

@ Unused
CableClub_EventScript_PlayerApproachLinkRoomRight::
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerApproachLinkRoomRight
	waitmovement 0
	return

CableClub_EventScript_WarpTo4PColosseum::
	special SetCableClubWarp
	warp MAP_BATTLE_COLOSSEUM_4P, 5, 8
	special DoCableClubWarp
	waitstate
	end

CableClub_EventScript_AbortLinkIncorrectNumberOfBattlers::
	switch VAR_0x8004
	case USING_SINGLE_BATTLE, CableClub_EventScript_AbortLinkWrongNumberForSingleBattle
	case USING_DOUBLE_BATTLE, CableClub_EventScript_AbortLinkWrongNumberForDoubleBattle
	case USING_MULTI_BATTLE, CableClub_EventScript_AbortLinkNeedFourPlayers
	goto CableClub_EventScript_AbortLinkIncorrectNumberOfParticipants
	end

CableClub_EventScript_AbortLinkNeedFourPlayers::
	special CloseLink
	msgbox CableClub_Text_NeedFourPlayers
	goto CableClub_EventScript_ConfirmNumberAndRestart
	end

CableClub_EventScript_AbortLinkWrongNumberForDoubleBattle::
	special CloseLink
	msgbox CableClub_Text_CantDoubleBattleWithXPlayers
	goto CableClub_EventScript_ConfirmNumberAndRestart
	end

CableClub_EventScript_AbortLinkWrongNumberForSingleBattle::
	special CloseLink
	msgbox CableClub_Text_CantSingleBattleWithXPlayers
	goto CableClub_EventScript_ConfirmNumberAndRestart
	end

CableClub_EventScript_ConfirmNumberAndRestart::
	special CloseLink  @ Redundant
	special HelpSystem_Enable
	msgbox CableClub_Text_PleaseConfirmNumberAndRestart
	release
	end

CableClub_EventScript_TradeCenter::
	copyvar VAR_0x8007, VAR_LAST_TALKED
	call CableClub_EventScript_CheckPartyTradeRequirements
	goto_if_eq VAR_RESULT, 0, CableClub_EventScript_AbortLink
	call EventScript_AskSaveGame
	goto_if_eq VAR_RESULT, 0, CableClub_EventScript_AbortLink
	message CableClub_Text_PleaseWaitBCancel
	waitmessage
	special HelpSystem_Disable
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special TryTradeLinkup
	waitstate
	call EventScript_RestorePrevTextColor
	goto_if_eq VAR_RESULT, LINKUP_SUCCESS, CableClub_EventScript_EnterTradeCenter
	goto_if_eq VAR_RESULT, LINKUP_SOMEONE_NOT_READY, CableClub_EventScript_AbortLinkSomeoneNotReady
	goto_if_eq VAR_RESULT, LINKUP_DIFF_SELECTIONS, CableClub_EventScript_AbortLinkDifferentSelections
	goto_if_eq VAR_RESULT, LINKUP_WRONG_NUM_PLAYERS, CableClub_EventScript_AbortLinkIncorrectNumberOfParticipants
	goto_if_eq VAR_RESULT, LINKUP_FAILED, CableClub_EventScript_AbortLink
	goto_if_eq VAR_RESULT, LINKUP_CONNECTION_ERROR, CableClub_EventScript_AbortLinkConnectionError
	goto_if_eq VAR_RESULT, LINKUP_PLAYER_NOT_READY, CableClub_EventScript_AbortLinkPlayerNotReady
	goto_if_eq VAR_RESULT, LINKUP_PARTNER_NOT_READY, CableClub_EventScript_AbortLinkOtherTrainerNotReady
	end

CableClub_EventScript_EnterTradeCenter::
	setvar VAR_0x8004, USING_TRADE_CENTER
	copyvar VAR_CABLE_CLUB_STATE, VAR_0x8004
	messageautoscroll CableClub_Text_PleaseEnter
	waitmessage
	call CableClub_EventScript_OpenDirectCornerBarrier
	special DrawWholeMapView
	playse SE_CLICK
	delay 60
	applymovement VAR_LAST_TALKED, Movement_AttendantFaceLeft
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerApproachLinkRoomLeft
	waitmovement 0
	opendoor 9, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerEnterLinkRoom
	waitmovement 0
	hideobjectat OBJ_EVENT_ID_PLAYER, 0
	closedoor 9, 1
	waitdooranim
	release
	special SetCableClubWarp
	setwarp MAP_TRADE_CENTER, 5, 8
	special DoCableClubWarp
	waitstate
	end

CableClub_EventScript_CheckPartyTradeRequirements::
	specialvar VAR_RESULT, CalculatePlayerPartyCount
	goto_if_lt VAR_RESULT, 2, CableClub_EventScript_NeedTwoMonsToTrade
	specialvar VAR_RESULT, DoesPartyHaveEnigmaBerry
	goto_if_eq VAR_RESULT, TRUE, CableClub_EventScript_CantTradeEnigmaBerry
	setvar VAR_RESULT, TRUE
	return

CableClub_EventScript_NeedTwoMonsToTrade::
	msgbox CableClub_Text_NeedTwoMonsToTrade
	setvar VAR_RESULT, FALSE
	return

CableClub_EventScript_CantTradeEnigmaBerry::
	msgbox CableClub_Text_CantTradeEnigmaBerry
	setvar VAR_RESULT, FALSE
	return

@ Record Corner is nopped in FRLG
CableClub_EventScript_RecordCorner::
	end

CableClub_EventScript_AbortLinkPlayerNotReady::
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_NotSetUpForFarAwayRegion
	release
	end

CableClub_EventScript_AbortLinkOtherTrainerNotReady::
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_OtherTrainerNotReady
	release
	end

CableClub_EventScript_AbortLinkConnectionError::
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_LinkErrorPleaseReset
	release
	end

CableClub_EventScript_AbortLinkSomeoneNotReady::
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_SomeoneIsNotReadyToLink
	release
	end

CableClub_EventScript_AbortLinkDifferentSelections::
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_PlayersMadeDifferentSelections
	release
	end

CableClub_EventScript_AbortLink::
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_PleaseVisitAgain
	release
	end

CableClub_EventScript_AbortMinigame::
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_ComeAgain
	release
	end

@ Unused
CableClub_EventScript_CableClubWarp::
	special SetCableClubWarp
	special DoCableClubWarp
	waitstate
	end

CableClub_EventScript_AbortLinkIncorrectNumberOfParticipants::
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_IncorrectNumberOfParticipants
	release
	end

CableClub_EventScript_AbortLinkPlayerHasBadEgg::
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_YouHaveAMonThatCantBeTaken
	release
	end

CableClub_EventScript_WirelessClubAdjustements::
	msgbox Text_WirelessClubUndergoingAdjustments
	release
	end

CableClub_EventScript_NotReadyYet::
	msgbox Text_AppearsToBeUndergoingAdjustments
	releaseall
	end

Movement_AttendantFaceDown::
	face_down
	step_end

@ Unused
Movement_AttendantFaceRight::
	face_right
	step_end

Movement_AttendantFaceLeft::
	face_left
	step_end

Movement_PlayerExitLinkRoom::
	walk_down
	walk_down
	step_end

Movement_PlayerApproachLinkRoomRight::
	walk_right
	walk_up
	walk_up
	step_end

Movement_PlayerApproachLinkRoomLeft::
	walk_left
	walk_up
	walk_up
	step_end

Movement_PlayerEnterLinkRoom::
	walk_up
	step_end

@ Unused
Movement_PlayerFaceAttendantLeft::
	face_left
	step_end

Movement_PlayerFaceAttendantRight::
	face_right
	step_end

Movement_PlayerEnterMinigameRoom::
	walk_left
	walk_up
	walk_up
	walk_up
	step_end

CableClub_EventScript_ShowBattleRecords::
	goto_if_questlog EventScript_ReleaseEnd
	lockall
	fadescreen FADE_TO_BLACK
	setvar VAR_0x8004, 0
	special ShowBattleRecords
	waitstate
	releaseall
	end

BattleColosseum_2P_EventScript_PlayerSpot0::
	setvar VAR_0x8005, 0
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_2P_EventScript_PlayerSpot1::
	setvar VAR_0x8005, 1
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_4P_EventScript_PlayerSpot0::
	fadescreen FADE_TO_BLACK
	special ChooseHalfPartyForBattle
	waitstate
	goto_if_eq VAR_RESULT, 0, BattleColosseum_4P_EventScript_CancelSpotTrigger
	setvar VAR_0x8005, 0
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_4P_EventScript_PlayerSpot1::
	fadescreen FADE_TO_BLACK
	special ChooseHalfPartyForBattle
	waitstate
	goto_if_eq VAR_RESULT, 0, BattleColosseum_4P_EventScript_CancelSpotTrigger
	setvar VAR_0x8005, 1
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_4P_EventScript_PlayerSpot2::
	fadescreen FADE_TO_BLACK
	special ChooseHalfPartyForBattle
	waitstate
	goto_if_eq VAR_RESULT, 0, BattleColosseum_4P_EventScript_CancelSpotTrigger
	setvar VAR_0x8005, 2
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_4P_EventScript_PlayerSpot3::
	fadescreen FADE_TO_BLACK
	special ChooseHalfPartyForBattle
	waitstate
	goto_if_eq VAR_RESULT, 0, BattleColosseum_4P_EventScript_CancelSpotTrigger
	setvar VAR_0x8005, 3
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_4P_EventScript_CancelSpotTrigger::
	end

TradeCenter_EventScript_Chair0::
	setvar VAR_0x8005, 0
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special EnterTradeSeat
	waitstate
	end

TradeCenter_EventScript_Chair1::
	setvar VAR_0x8005, 1
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special EnterTradeSeat
	waitstate
	end

@ Unused
TradeCenter_EventScript_Chair2::
	setvar VAR_0x8005, 2
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special EnterTradeSeat
	waitstate
	end

@ Unused
TradeCenter_EventScript_Chair3::
	setvar VAR_0x8005, 3
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special EnterTradeSeat
	waitstate
	end

@ Nop in FRLG
@ Separate labels to match GetDirectionForEventScript
RecordCorner_EventScript_Spot0::
RecordCorner_EventScript_Spot1::
RecordCorner_EventScript_Spot2::
RecordCorner_EventScript_Spot3::
	end

CableClub_EventScript_ReadTrainerCard::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox Text_LookedAtPlayersTrainerCard
	fadescreen FADE_TO_BLACK
	special Script_ShowLinkTrainerCard
	waitstate
	end

CableClub_EventScript_ReadTrainerCardColored::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox Text_LookedAtPlayersTrainerCardColored
	fadescreen FADE_TO_BLACK
	special Script_ShowLinkTrainerCard
	waitstate
	end

CableClub_EventScript_TooBusyToNotice::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox Text_TrainerTooBusyToNotice
	closemessage
	end

BattleColosseum_2P_EventScript_Attendant::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special Script_FacePlayer
	msgbox Text_TakeSeatStartBattle
	special Script_ClearHeldMovement
	closemessage
	end

TradeCenter_EventScript_Attendant::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special Script_FacePlayer
	msgbox Text_TakeSeatStartTrade
	special Script_ClearHeldMovement
	closemessage
	end

@ Nop in FRLG
RecordCorner_EventScript_Attendant::
	end

TradeCenter_ConfirmLeaveRoom::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox Text_TerminateLinkIfYouLeaveRoom, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, YES, TradeCenter_TerminateLink
	erasebox 0, 0, 29, 19
	releaseall
	end

TradeCenter_TerminateLink::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	messageautoscroll Text_TerminateLinkConfirmation
	waitmessage
	special ExitLinkRoom
	end

CableClub_EventScript_DoLinkRoomExit::
	special CleanupLinkRoomState
	special ReturnFromLinkRoom
	waitstate
	end

CableClub_EventScript_UnionRoomAttendant::
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	goto_if_unset FLAG_SYS_POKEDEX_GET, CableClub_EventScript_WirelessClubAdjustements
	specialvar VAR_RESULT, IsBadEggInParty
	goto_if_eq VAR_RESULT, TRUE, CableClub_EventScript_AbortLinkPlayerHasBadEgg
	copyvar VAR_0x8007, VAR_LAST_TALKED
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	goto_if_eq VAR_RESULT, FALSE, CableClub_EventScript_UnionRoomAdapterNotConnected
	message CableClub_Text_WelcomeUnionRoomEnter
	waitmessage
	goto CableClub_EventScript_AskEnterUnionRoom
	end

CableClub_EventScript_AskEnterUnionRoom::
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_EnterUnionRoom
	case 1, CableClub_EventScript_AbortLink
	case 2, CableClub_EventScript_UnionRoomInfo
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_UnionRoomInfo::
	message CableClub_Text_UnionRoomInfo
	waitmessage
	goto CableClub_EventScript_AskEnterUnionRoom
	end

CableClub_EventScript_EnterUnionRoom::
	call CableClub_EventScript_CheckPartyUnionRoomRequirements
	goto_if_eq VAR_RESULT, FALSE, CableClub_EventScript_AbortLink
	call EventScript_AskSaveGame
	goto_if_eq VAR_RESULT, 0, CableClub_EventScript_AbortLink
	msgbox CableClub_Text_EnjoyUnionRoom
	closemessage
	special HealPlayerParty
	setvar VAR_0x8004, USING_UNION_ROOM
	copyvar VAR_CABLE_CLUB_STATE, VAR_0x8004
	special HelpSystem_Disable
	call CableClub_EventScript_OpenUnionRoomBarrier
	special DrawWholeMapView
	playse SE_CLICK
	delay 60
	applymovement VAR_LAST_TALKED, Movement_AttendantFaceLeft
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerApproachLinkRoomLeft
	waitmovement 0
	opendoor 5, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerEnterLinkRoom
	waitmovement 0
	hideobjectat OBJ_EVENT_ID_PLAYER, 0
	closedoor 5, 1
	waitdooranim
	special Script_ResetUnionRoomTrade
	special SetCableClubWarp
	warpspinenter MAP_UNION_ROOM, 7, 11
	waitstate
	special RunUnionRoom
	waitstate
	end

CableClub_EventScript_CheckPartyUnionRoomRequirements::
	specialvar VAR_RESULT, CountPartyNonEggMons
	goto_if_lt VAR_RESULT, 2, CableClub_EventScript_NeedTwoMonsForUnionRoom
	specialvar VAR_RESULT, DoesPartyHaveEnigmaBerry
	goto_if_eq VAR_RESULT, TRUE, CableClub_EventScript_NoEnigmaBerryInUnionRoom
	setvar VAR_RESULT, TRUE
	return

CableClub_EventScript_NeedTwoMonsForUnionRoom::
	msgbox CableClub_Text_NeedTwoMonsForUnionRoom
	goto EventScript_SetResultFalse
	end

CableClub_EventScript_NoEnigmaBerryInUnionRoom::
	msgbox CableClub_Text_NoEnigmaBerryInUnionRoom
	goto EventScript_SetResultFalse
	end

CableClub_EventScript_UnionRoomAdapterNotConnected::
	msgbox CableClub_Text_UnionRoomAdapterNotConnected
	release
	return

CableClub_EventScript_WirelessClubAttendant::
	lock
	faceplayer
	goto_if_unset FLAG_SYS_POKEDEX_GET, CableClub_EventScript_WirelessClubAdjustements
	msgbox CableClub_Text_AskAboutLinking, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, CableClub_EventScript_DontAskAboutLinking
	msgbox CableClub_Text_ExplainWirelessClub
	release
	return

CableClub_EventScript_DontAskAboutLinking::
	msgbox CableClub_Text_HopeYouEnjoyWirelessSystem
	release
	return

CableClub_EventScript_DirectCornerAttendant::
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	goto_if_unset FLAG_SYS_POKEDEX_GET, CableClub_EventScript_WirelessClubAdjustements
	specialvar VAR_RESULT, IsBadEggInParty
	goto_if_eq VAR_RESULT, TRUE, CableClub_EventScript_AbortLinkPlayerHasBadEgg
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	goto_if_eq VAR_RESULT, FALSE, CableClub_EventScript_WelcomeToCableClub
	message CableClub_Text_WelcomeWhichDirectCornerRoom
	waitmessage
	delay 15
	goto CableClub_EventScript_DirectCornerSelectService
	end

CableClub_EventScript_DirectCornerSelectService::
	goto_if_unset FLAG_GOT_POWDER_JAR, CableClub_EventScript_DirectCornerNoBerry
	multichoice 0, 0, MULTICHOICE_TRADE_COLOSSEUM_CRUSH, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_WirelessTrade
	case 1, CableClub_EventScript_WirelessBattleSelect
	case 2, CableClub_EventScript_WirelessBerryCrush
	case 3, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_DirectCornerNoBerry::
	multichoice 0, 0, MULTICHOICE_TRADE_COLOSSEUM_2, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_WirelessTrade
	case 1, CableClub_EventScript_WirelessBattleSelect
	case 2, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_WirelessTrade::
	msgbox CableClub_Text_TradePokemon, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, CableClub_EventScript_AbortLink
	call CableClub_EventScript_CheckPartyTradeRequirements
	goto_if_eq VAR_RESULT, FALSE, CableClub_EventScript_AbortLink
	setvar VAR_0x8004, LINK_GROUP_TRADE
	goto CableClub_EventScript_SaveAndChooseLinkLeader
	end

CableClub_EventScript_WirelessBattleSelect::
	message CableClub_Text_PlayWhichBattleMode
	waitmessage
	multichoice 0, 0, MULTICHOICE_SINGLE_DOUBLE_MULTI_INFO_EXIT, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_WirelessSingleBattle
	case 1, CableClub_EventScript_WirelessDoubleBattle
	case 2, CableClub_EventScript_WirelessMultiBattle
	case 3, CableClub_EventScript_WirelessBattleInfo
	case 4, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_WirelessSingleBattle::
	setvar VAR_0x8004, LINK_GROUP_SINGLE_BATTLE
	goto CableClub_EventScript_SaveAndChooseLinkLeader
	end

CableClub_EventScript_WirelessDoubleBattle::
	special HasEnoughMonsForDoubleBattle
	goto_if_ne VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS, CableClub_EventScript_TwoMonsNeededForWirelessDoubleBattle
	setvar VAR_0x8004, LINK_GROUP_DOUBLE_BATTLE
	goto CableClub_EventScript_SaveAndChooseLinkLeader
	end

CableClub_EventScript_TwoMonsNeededForWirelessDoubleBattle::
	msgbox CableClub_Text_NeedTwoMonsForDoubleBattle
	goto CableClub_EventScript_WirelessBattleSelect
	end

CableClub_EventScript_WirelessMultiBattle::
	setvar VAR_0x8004, LINK_GROUP_MULTI_BATTLE
	goto CableClub_EventScript_SaveAndChooseLinkLeader
	end

CableClub_EventScript_WirelessBattleInfo::
	msgbox CableClub_Text_ExplainBattleModes
	goto CableClub_EventScript_WirelessBattleSelect
	end

CableClub_EventScript_WirelessBerryCrush::
	msgbox CableClub_Text_UseBerryCrush, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, CableClub_EventScript_AbortLink
	special HasAtLeastOneBerry
	goto_if_eq VAR_RESULT, FALSE, CableClub_EventScript_NeedBerryForBerryCrush
	setvar VAR_0x8004, LINK_GROUP_BERRY_CRUSH
	goto CableClub_EventScript_SaveAndChooseLinkLeader
	end

CableClub_EventScript_NeedBerryForBerryCrush::
	msgbox CableClub_Text_NeedBerryForBerryCrush
	goto CableClub_EventScript_DirectCornerSelectService
	end

CableClub_EventScript_SaveAndChooseLinkLeader::
	call EventScript_AskSaveGame
	goto_if_eq VAR_RESULT, 0, CableClub_EventScript_AbortLink
	switch VAR_0x8004
	case LINK_GROUP_TRADE, CableClub_EventScript_ChooseLinkLeaderFrom2
	case LINK_GROUP_SINGLE_BATTLE, CableClub_EventScript_ChooseLinkLeaderFrom2
	case LINK_GROUP_DOUBLE_BATTLE, CableClub_EventScript_ChooseLinkLeaderFrom2
	case LINK_GROUP_MULTI_BATTLE, CableClub_EventScript_ChooseLinkLeaderFrom4
	case LINK_GROUP_BERRY_CRUSH, CableClub_EventScript_ChooseLinkLeader
	end

CableClub_EventScript_ChooseLinkLeaderFrom2::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	message CableClub_Text_ChooseGroupLeaderOfTwo
	waitmessage
	call EventScript_RestorePrevTextColor
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_TryJoinGroup2Players
	case 1, CableClub_EventScript_TryLeadGroup2Players
	case 2, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_TryLeadGroup2Players::
	call CableClub_EventScript_TryBecomeLinkLeader
	goto_if_eq VAR_RESULT, LINKUP_SUCCESS, CableClub_EventScript_EnterWirelessLinkRoom
	goto_if_eq VAR_RESULT, LINKUP_FAILED, CableClub_EventScript_ChooseLinkLeaderFrom2
	goto_if_eq VAR_RESULT, LINKUP_RETRY_ROLE_ASSIGN, CableClub_EventScript_TryLeadGroup2Players
	release
	return

CableClub_EventScript_TryJoinGroup2Players::
	call CableClub_EventScript_TryJoinLinkGroup
	goto_if_eq VAR_RESULT, LINKUP_SUCCESS, CableClub_EventScript_EnterWirelessLinkRoom
	goto_if_eq VAR_RESULT, LINKUP_FAILED, CableClub_EventScript_ChooseLinkLeaderFrom2
	goto_if_eq VAR_RESULT, LINKUP_RETRY_ROLE_ASSIGN, CableClub_EventScript_TryJoinGroup2Players
	release
	return

CableClub_EventScript_ChooseLinkLeaderFrom4::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	message CableClub_Text_ChooseGroupLeaderOfFour
	waitmessage
	call EventScript_RestorePrevTextColor
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_TryJoinGroup4Players
	case 1, CableClub_EventScript_TryLeadGroup4Players
	case 2, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_TryLeadGroup4Players::
	call CableClub_EventScript_TryBecomeLinkLeader
	goto_if_eq VAR_RESULT, LINKUP_SUCCESS, CableClub_EventScript_EnterWirelessLinkRoom
	goto_if_eq VAR_RESULT, LINKUP_FAILED, CableClub_EventScript_ChooseLinkLeaderFrom4
	goto_if_eq VAR_RESULT, LINKUP_RETRY_ROLE_ASSIGN, CableClub_EventScript_TryLeadGroup4Players
	release
	return

CableClub_EventScript_TryJoinGroup4Players::
	call CableClub_EventScript_TryJoinLinkGroup
	goto_if_eq VAR_RESULT, LINKUP_SUCCESS, CableClub_EventScript_EnterWirelessLinkRoom
	goto_if_eq VAR_RESULT, LINKUP_FAILED, CableClub_EventScript_ChooseLinkLeaderFrom4
	goto_if_eq VAR_RESULT, LINKUP_RETRY_ROLE_ASSIGN, CableClub_EventScript_TryJoinGroup4Players
	release
	return

CableClub_EventScript_ChooseLinkLeader::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	message CableClub_Text_ChooseGroupLeader
	waitmessage
	call EventScript_RestorePrevTextColor
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_TryJoinGroupXPlayers
	case 1, CableClub_EventScript_TryLeadGroupXPlayers
	case 2, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_TryLeadGroupXPlayers::
	call CableClub_EventScript_TryBecomeLinkLeader
	goto_if_eq VAR_RESULT, LINKUP_SUCCESS, CableClub_EventScript_EnterWirelessLinkRoom
	goto_if_eq VAR_RESULT, LINKUP_FAILED, CableClub_EventScript_ChooseLinkLeader
	goto_if_eq VAR_RESULT, LINKUP_RETRY_ROLE_ASSIGN, CableClub_EventScript_TryLeadGroupXPlayers
	release
	return

CableClub_EventScript_TryJoinGroupXPlayers::
	call CableClub_EventScript_TryJoinLinkGroup
	goto_if_eq VAR_RESULT, LINKUP_SUCCESS, CableClub_EventScript_EnterWirelessLinkRoom
	goto_if_eq VAR_RESULT, LINKUP_FAILED, CableClub_EventScript_ChooseLinkLeader
	goto_if_eq VAR_RESULT, LINKUP_RETRY_ROLE_ASSIGN, CableClub_EventScript_TryJoinGroupXPlayers
	release
	return

CableClub_EventScript_TryBecomeLinkLeader::
	special HelpSystem_Disable
	special TryBecomeLinkLeader
	waitstate
	return

CableClub_EventScript_TryJoinLinkGroup::
	special HelpSystem_Disable
	special TryJoinLinkGroup
	waitstate
	return

CableClub_EventScript_EnterWirelessLinkRoom::
	messageautoscroll CableClub_Text_DirectYouToYourRoom
	waitmessage
	delay 60
	closemessage
	copyvar VAR_0x8007, VAR_LAST_TALKED
	call CableClub_EventScript_OpenDirectCornerBarrier
	special DrawWholeMapView
	playse SE_CLICK
	delay 60
	applymovement VAR_LAST_TALKED, Movement_AttendantFaceLeft
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerApproachLinkRoomLeft
	waitmovement 0
	opendoor 9, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerEnterLinkRoom
	waitmovement 0
	hideobjectat OBJ_EVENT_ID_PLAYER, 0
	closedoor 9, 1
	waitdooranim
	release
	waitstate
	end

CableClub_EventScript_ShowWirelessCommunicationScreen::
	goto_if_questlog EventScript_ReleaseEnd
	lockall
	goto_if_unset FLAG_SYS_POKEDEX_GET, CableClub_EventScript_NotReadyYet
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	goto_if_eq VAR_RESULT, FALSE, CableClub_EventScript_AdapterNotConnected
	special HelpSystem_Disable
	fadescreen FADE_TO_BLACK
	special ShowWirelessCommunicationScreen
	waitstate
	msgbox CableClub_Text_ParticipantsStepUpToCounter
	special HelpSystem_Enable
	releaseall
	end

CableClub_EventScript_AdapterNotConnected::
	msgbox CableClub_Text_AdapterNotConnected
	releaseall
	end

CableClub_EventScript_OpenUnionRoomBarrier::
	setmetatile 5, 3, METATILE_PokemonCenter_Floor_ShadeLeft, 0
	return

CableClub_EventScript_CloseUnionRoomBarrier::
	setmetatile 5, 3, METATILE_PokemonCenter_CounterBarrier, 1
	return

CableClub_EventScript_OpenDirectCornerBarrier::
	setmetatile 9, 3, METATILE_PokemonCenter_Floor_ShadeLeft, 0
	return

CableClub_EventScript_CloseDirectCornerBarrier::
	setmetatile 9, 3, METATILE_PokemonCenter_CounterBarrier, 1
	return

CableClub_EventScript_OpenGameCornerBarrier::
	setmetatile 5, 3, METATILE_GameCorner_CheckeredFloor_ShadeLeft, 0
	return

CableClub_EventScript_CloseGameCornerBarrier::
	setmetatile 5, 3, METATILE_GameCorner_CounterBarrier, 1
	return

CableClub_OnResume::
	special InitUnionRoom
	end

JoyfulGameCorner_EventScript_InfoMan2::
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	message Text_DescribeWhichGame
	waitmessage
	multichoice 0, 0, MULTICHOICE_POKEJUMP_DODRIO, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_PokemonJumpInfo
	case 1, CableClub_EventScript_DodrioBerryPickingInfo
	case 2, CableClub_EventScript_MinigameInfoExit
	case SCR_MENU_CANCEL, CableClub_EventScript_MinigameInfoExit
	end

CableClub_EventScript_PokemonJumpInfo::
	msgbox Text_PokemonJumpInfo
	release
	end

CableClub_EventScript_DodrioBerryPickingInfo::
	msgbox Text_DodrioBerryPickingInfo
	release
	end

CableClub_EventScript_MinigameInfoExit::
	msgbox Text_TalkToManToPlay
	release
	end

JoyfulGameCorner_EventScript_MinigameAttendant::
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	message Text_WelcomeCanYouWait
	waitmessage
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	goto_if_eq VAR_RESULT, FALSE, CableClub_EventScript_AdapterNotConnectedMinigame
	delay 60
	special HelpSystem_Disable
	message Text_PlayWhichGame
	waitmessage
	multichoice 0, 0, MULTICHOICE_POKEJUMP_DODRIO, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_PlayPokemonJump
	case 1, CableClub_EventScript_PlayDodrioBerryPicking
	case 2, CableClub_EventScript_AbortMinigame
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortMinigame
	end

CableClub_EventScript_PlayPokemonJump::
	setvar VAR_0x8005, 0
	special IsPokemonJumpSpeciesInParty
	goto_if_eq VAR_RESULT, FALSE, CableClub_EventScript_NoEligiblePkmn
	msgbox Text_EnterWhichPokemon
	setvar VAR_0x8005, 0
	special ChooseMonForWirelessMinigame
	waitstate
	goto_if_ge VAR_0x8004, PARTY_SIZE, CableClub_EventScript_AbortMinigame
	call EventScript_AskSaveGame
	goto_if_eq VAR_RESULT, 0, CableClub_EventScript_AbortMinigame
	setvar VAR_0x8004, LINK_GROUP_POKEMON_JUMP
	goto CableClub_EventScript_ChooseLinkLeaderMinigame
	end

CableClub_EventScript_PlayDodrioBerryPicking::
	setvar VAR_0x8005, 1
	special IsDodrioInParty
	goto_if_eq VAR_RESULT, 0, CableClub_EventScript_NoEligiblePkmn
	msgbox Text_EnterWhichPokemon
	setvar VAR_0x8005, 1
	special ChooseMonForWirelessMinigame
	waitstate
	goto_if_ge VAR_0x8004, PARTY_SIZE, CableClub_EventScript_AbortMinigame
	call EventScript_AskSaveGame
	goto_if_eq VAR_RESULT, 0, CableClub_EventScript_AbortMinigame
	setvar VAR_0x8004, LINK_GROUP_BERRY_PICKING
	goto CableClub_EventScript_ChooseLinkLeaderMinigame
	end

CableClub_EventScript_ChooseLinkLeaderMinigame::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	message CableClub_Text_ChooseGroupLeader
	waitmessage
	call EventScript_RestorePrevTextColor
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_TryJoinMinigameLinkGroup
	case 1, CableClub_EventScript_TryBecomeMinigameLinkLeader
	case 2, CableClub_EventScript_AbortMinigame
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortMinigame
	end

CableClub_EventScript_TryBecomeMinigameLinkLeader::
	call CableClub_EventScript_TryBecomeLinkLeader
	goto_if_eq VAR_RESULT, LINKUP_SUCCESS, CableClub_EventScript_EnterMinigame
	goto_if_eq VAR_RESULT, LINKUP_FAILED, CableClub_EventScript_ChooseLinkLeaderMinigame
	goto_if_eq VAR_RESULT, LINKUP_RETRY_ROLE_ASSIGN, CableClub_EventScript_TryBecomeMinigameLinkLeader
	release
	return

CableClub_EventScript_TryJoinMinigameLinkGroup::
	call CableClub_EventScript_TryJoinLinkGroup
	goto_if_eq VAR_RESULT, LINKUP_SUCCESS, CableClub_EventScript_EnterMinigame
	goto_if_eq VAR_RESULT, LINKUP_FAILED, CableClub_EventScript_ChooseLinkLeaderMinigame
	goto_if_eq VAR_RESULT, LINKUP_RETRY_ROLE_ASSIGN, CableClub_EventScript_TryJoinMinigameLinkGroup
	release
	return

CableClub_EventScript_EnterMinigame::
	messageautoscroll Text_AllGoodToGo
	waitmessage
	delay 120
	closemessage
	copyvar VAR_0x8007, VAR_LAST_TALKED
	call CableClub_EventScript_OpenGameCornerBarrier
	special DrawWholeMapView
	playse SE_CLICK
	delay 60
	applymovement VAR_LAST_TALKED, Movement_AttendantFaceLeft
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerEnterMinigameRoom
	waitmovement 0
	hideobjectat OBJ_EVENT_ID_PLAYER, 0
	release
	waitstate
	end

CableClub_EventScript_AdapterNotConnectedMinigame::
	msgbox Text_AdapterNotConnectedMinigame
	release
	end

CableClub_EventScript_NoEligiblePkmn::
	msgbox EventScript_ExplainPokemonJumpRequirements, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, CableClub_EventScript_AbortMinigame
	call_if_eq VAR_0x8005, 0, CableClub_EventScript_ExplainPokemonJumpRequirements
	call_if_eq VAR_0x8005, 1, CableClub_EventScript_ExplainDodrioBerryPickingRequirements
	goto CableClub_EventScript_AbortMinigame
	end

CableClub_EventScript_ExplainPokemonJumpRequirements::
	msgbox Text_ShortJumpingPokemonAllowed
	return

CableClub_EventScript_ExplainDodrioBerryPickingRequirements::
	msgbox Text_OnlyDodrioAllowed
	return

TwoIsland_JoyfulGameCorner_EventScript_ShowPokemonJumpRecords::
	goto_if_questlog EventScript_ReleaseEnd
	lockall
	special ShowPokemonJumpRecords
	waitstate
	releaseall
	end

TwoIsland_JoyfulGameCorner_EventScript_ShowDodrioBerryPickingRecords::
	goto_if_questlog EventScript_ReleaseEnd
	lockall
	special ShowDodrioBerryPickingRecords
	waitstate
	releaseall
	end

CableClub_Text_WelcomeWhichCableClubService::
	.string "Welcome to the POKéMON CABLE\n"
	.string "CLUB.\p"
	.string "Which of our services do you wish\n"
	.string "to use?$"

CableClub_Text_WhichService::
	.string "Which of our services do you wish\n"
	.string "to use?$"

CableClub_Text_TradeMonsUsingLinkCable::
	.string "Trade POKéMON with another player\n"
	.string "using a GBA Game Link cable.$"

CableClub_Text_BattleUsingLinkCable::
	.string "You may battle another TRAINER\n"
	.string "using a GBA Game Link cable.$"

@ Unused, translated in Emerald
CableClub_Text_CloseThisMenu::
	.string "おわります$"

CableClub_Text_NeedTwoMonsForDoubleBattle::
	.string "For a DOUBLE BATTLE, you must\n"
	.string "have at least two POKéMON.$"

CableClub_Text_NeedTwoMonsToTrade::
	.string "For trading, you must have at\n"
	.string "least two POKéMON with you.$"

CableClub_Text_CantTradeEnigmaBerry::
	.string "A POKéMON holding the {STR_VAR_1}\n"
	.string "BERRY can't be traded.$"

CableClub_Text_PleaseWaitBCancel::
	.string "Please wait.\n"
	.string "… … B Button: Cancel$"

CableClub_Text_WhenAllPlayersReadyAConfirmBCancel::
	.string "When all players are ready…\n"
	.string "A Button: Confirm\l"
	.string "B Button: Cancel$"

CableClub_Text_StartLinkWithXPlayersAConfirmBCancel::
	.string "Start link with {STR_VAR_1} players.\n"
	.string "A Button: Confirm\l"
	.string "B Button: Cancel$"

CableClub_Text_AwaitingLinkupBCancel::
	.string "Awaiting linkup…\n"
	.string "… … B Button: Cancel$"

@ Unused, translated in Emerald
CableClub_Text_OkayToSaveProgress::
	.string "はじめる　まえに　レポートを\n"
	.string "かきますが　よろしいですか？$"

CableClub_Text_PleaseEnter::
	.string "Please enter.$"

CableClub_Text_DirectYouToYourRoom::
	.string "I'll direct you to your room now.$"

CableClub_Text_SomeoneIsNotReadyToLink::
	.string "Someone is not ready to link.\p"
	.string "Please come back after everyone\n"
	.string "has made preparations.$"

CableClub_Text_LinkErrorPleaseReset::
	.string "Sorry, we have a link error…\n"
	.string "Please reset and try again.$"

CableClub_Text_PlayersMadeDifferentSelections::
	.string "The link partners appear to have\n"
	.string "made different selections.$"

CableClub_Text_PleaseVisitAgain::
	.string "Please do visit again.$"

CableClub_Text_IncorrectNumberOfParticipants::
	.string "The number of participants is\n"
	.string "incorrect.$"

CableClub_Text_CantSingleBattleWithXPlayers::
	.string "The SINGLE BATTLE Mode can't be\n"
	.string "played by {STR_VAR_1} players.$"

CableClub_Text_CantDoubleBattleWithXPlayers::
	.string "The DOUBLE BATTLE Mode can't be\n"
	.string "played by {STR_VAR_1} players.$"

CableClub_Text_NeedFourPlayers::
	.string "There must be four players to play\n"
	.string "this Battle Mode.$"

CableClub_Text_PleaseConfirmNumberAndRestart::
	.string "Please confirm the number of\n"
	.string "players and start again.$"

Text_TerminateLinkIfYouLeaveRoom::
	.string "The link will be terminated if you\n"
	.string "leave the room. Is that okay?$"

Text_TerminateLinkConfirmation::
	.string "Terminating link…\n"
	.string "You will be escorted out of\l"
	.string "the room. Please wait.$"

Text_TrainerTooBusyToNotice::
	.string "This TRAINER is too busy to\n"
	.string "notice…$"

Text_LookedAtPlayersTrainerCard::
	.string "Score! Got to look at {STR_VAR_1}'s\n"
	.string "TRAINER CARD!$"

Text_LookedAtPlayersTrainerCardColored::
	.string "Score! Got to look at {STR_VAR_1}'s\n"
	.string "TRAINER CARD!\p"
	.string "It's a {STR_VAR_2} card!$"

Text_TakeSeatStartBattle::
	.string "Please take your seat and start\n"
	.string "your battle.$"

Text_TakeSeatStartTrade::
	.string "Please take your seat and start\n"
	.string "your trade.$"

@ Unused, leftover from RS
RecordCorner_Text_ThanksForComing::
	.string "ごりよう　ありがとう　ございました$"

CableClub_Text_TrainerCardDataOverwritten::
	.string "The TRAINER CARD data will\n"
	.string "be overwritten.$"

CableClub_Text_HopeToSeeYouAgain::
	.string "I hope to see you again!$"

CableClub_Text_NotSetUpForFarAwayRegion::
	.string "I'm awfully sorry.\p"
	.string "We're not set up to conduct trades\n"
	.string "with TRAINERS far away in another\l"
	.string "region yet…$"

CableClub_Text_OtherTrainerNotReady::
	.string "The other TRAINER is not ready.$"

CableClub_Text_YouHaveAMonThatCantBeTaken::
	.string "You have at least one POKéMON\n"
	.string "that can't be taken.$"

CableClub_Text_AdapterNotConnected::
	.string "The Wireless Adapter is not\n"
	.string "connected properly.$"

CableClub_Text_ParticipantsStepUpToCounter::
	.string "Participants are asked to step up\n"
	.string "to the reception counter.$"

@ Unused, translated in Emerald
CableClub_Text_Hello::
	.string "こんにちは！$"

@ Unused, translated in Emerald
CableClub_Text_PleaseWait::
	.string "しょうしょう　おまちください$"

CableClub_Text_YouMayTradeHere::
	.string "You may trade your POKéMON here\n"
	.string "with another TRAINER.$"

CableClub_Text_YouMayBattleHere::
	.string "You may battle with your friends\n"
	.string "here.$"

CableClub_Text_CanMakeBerryPowder::
	.string "Two to five TRAINERS can make\n"
	.string "BERRY POWDER together.$"

@ Unused, Record Mix nopped
CableClub_Text_CanMixRecords::
	.string "ワイヤレス　クラブでの\n"
	.string "あそびかたを　せつめいします$"

CableClub_Text_CancelSelectedItem::
	.string "Cancels the selected MENU item.$"

@ Unused, translated in Emerald
CableClub_Text_WhichBattleMode::
	.string "どちらの　しょうぶに　しますか？$"

@ Unused, translated in Emerald
CableClub_Text_ReturnsToPreviousStep::
	.string "ひとつ　まえに　もどります$"

CableClub_Text_NeedBerryForBerryCrush::
	.string "To use the BERRY CRUSH service,\n"
	.string "you must have at least one BERRY.$"

CableClub_Text_NeedTwoMonsForUnionRoom::
	.string "To enter the UNION ROOM, you must\n"
	.string "have at least two POKéMON.$"

CableClub_Text_NoEnigmaBerryInUnionRoom::
	.string "No POKéMON holding the {STR_VAR_1}\n"
	.string "BERRY may enter the UNION ROOM.$"

CableClub_Text_UnionRoomAdapterNotConnected::
	.string "This is the POKéMON WIRELESS CLUB\n"
	.string "UNION ROOM.\p"
	.string "Unfortunately, your Wireless\n"
	.string "Adapter is not connected properly.\p"
	.string "Please do come again.$"

@ Unused, translated in Emerald
CableClub_Text_OhExcuseMe::
	.string "あ‥‥\n"
	.string "おきゃくさま！$"

Text_PlayerIsPlayingRightNowGoForIt::
	.string "It appears as if {STR_VAR_1} is playing\n"
	.string "right now.\l"
	.string "Go for it!$"

Text_DescribeWhichGame::
	.string "I can explain game rules to you,\n"
	.string "if you'd like.\p"
	.string "Which game should I describe?$"

Text_PokemonJumpInfo::
	.string "“POKéMON JUMP”\p"
	.string "Make your POKéMON skip the\n"
	.string "VINE WHIP rope with the A Button.\p"
	.string "Only mini POKéMON around 28 inches\n"
	.string "or less may participate.\p"
	.string "POKéMON that only swim, burrow, or\n"
	.string "fly are not good at jumping.\p"
	.string "As a result, those POKéMON may not\n"
	.string "participate.\p"
	.string "Good things happen if everyone\n"
	.string "jumps in time.$"

Text_DodrioBerryPickingInfo::
	.string "“DODRIO BERRY-PICKING”\p"
	.string "Command DODRIO's three heads to\n"
	.string "catch falling BERRIES.\p"
	.string "Press right, up, or left on the\n"
	.string "{PLUS} Control Pad to move the heads.\p"
	.string "To play this game, you must have\n"
	.string "a DODRIO.$"

Text_TalkToManToPlay::
	.string "If you want to play a game,\n"
	.string "please tell the man beside me.$"

Text_WelcomeCanYouWait::
	.string "Hi, welcome!\n"
	.string "You can play games over the\l"
	.string "Wireless Communication System.\p"
	.string "Can you wait just a little bit?$"

CableClub_Text_ComeAgain::
	.string "All right, come again!$"

Text_AdapterNotConnectedMinigame::
	.string "The Wireless Adapter isn't\n"
	.string "connected.\p"
	.string "Come back when it's hooked up!$"

Text_PlayWhichGame::
	.string "All right, which game did you want\n"
	.string "to play?$"

Text_EnterWhichPokemon::
	.string "Which POKéMON would you like to\n"
	.string "enter?$"

Text_AllGoodToGo::
	.string "Okay, you're all good to go.\n"
	.string "Don't let the others beat you!$"

@ Unused, translated in Emerald
Text_LeavingDoComeAgain::
	.string "きょうは　けえるのか？\n"
	.string "またこいよ！$"

EventScript_ExplainPokemonJumpRequirements::
	.string "It doesn't look like you have any\n"
	.string "POKéMON that you can enter…\p"
	.string "Would you like me to explain what\n"
	.string "kinds of POKéMON can enter?$"

Text_ShortJumpingPokemonAllowed::
	.string "“POKéMON JUMP” is open to POKéMON\n"
	.string "around 28 inches or less.\p"
	.string "What you can't enter are those\n"
	.string "POKéMON that can't jump.\p"
	.string "You know, like POKéMON that only\n"
	.string "swim, burrow, or fly.\p"
	.string "That's all you need to know.$"

Text_OnlyDodrioAllowed::
	.string "“DODRIO BERRY-PICKING”…\n"
	.string "Well, the name says it all.\p"
	.string "You have to have a DODRIO to play\n"
	.string "this game.$"

@ Unused, translated in Emerald
Text_RetryFromStartPlease::
	.string "もういちど　はじめから\n"
	.string "やりなおして　みて　くれ$"

CableClub_Text_WelcomeWhichDirectCornerRoom::
	.string "Welcome to the POKéMON WIRELESS\n"
	.string "CLUB DIRECT CORNER.\p"
	.string "You may interact directly with\n"
	.string "your friends here.\p"
	.string "Which room would you like to\n"
	.string "enter?$"

CableClub_Text_TradePokemon::
	.string "Would you like to trade POKéMON?$"

CableClub_Text_PlayWhichBattleMode::
	.string "Which Battle Mode would you like\n"
	.string "to play?$"

CableClub_Text_UseBerryCrush::
	.string "Would you like to use the\n"
	.string "BERRY CRUSH System?$"

CableClub_Text_ExplainBattleModes::
	.string "There are three Battle Modes.\p"
	.string "SINGLE BATTLE is for two TRAINERS\n"
	.string "with one or more POKéMON each.\p"
	.string "Each TRAINER can have one POKéMON\n"
	.string "in battle at a time.\p"
	.string "DOUBLE BATTLE is for two TRAINERS\n"
	.string "with two or more POKéMON each.\p"
	.string "Each TRAINER will send out two\n"
	.string "POKéMON in battle at a time.\p"
	.string "MULTI BATTLE is for four TRAINERS\n"
	.string "with one or more POKéMON each.\p"
	.string "Each TRAINER can have one POKéMON\n"
	.string "in battle at a time.$"

CableClub_Text_ChooseGroupLeaderOfTwo::
	.string "Please decide which of you two\n"
	.string "will become the LEADER.\p"
	.string "The other player must then choose\n"
	.string "“JOIN GROUP.”$"

CableClub_Text_ChooseGroupLeaderOfFour::
	.string "Please decide which of you four\n"
	.string "will become the GROUP LEADER.\p"
	.string "The other players must then choose\n"
	.string "“JOIN GROUP.”$"

CableClub_Text_ChooseGroupLeader::
	.string "Please decide which of you will\n"
	.string "become the GROUP LEADER.\p"
	.string "The other players must then choose\n"
	.string "“JOIN GROUP.”$"

CableClub_Text_WelcomeUnionRoomEnter::
	.string "Welcome to the POKéMON WIRELESS\n"
	.string "CLUB UNION ROOM.\p"
	.string "You may interact directly with\n"
	.string "other TRAINERS here, some of\l"
	.string "whom you may not even know.\p"
	.string "Would you like to enter the ROOM?$"

CableClub_Text_UnionRoomInfo::
	.string "The TRAINERS in the UNION ROOM\n"
	.string "will be those players around you\l"
	.string "who have also entered the ROOM.\p"
	.string "You may do all sorts of things\n"
	.string "here, such as exchanging greetings.\p"
	.string "You may enter two POKéMON up to\n"
	.string "Lv. 30 for a one-on-one battle.\p"
	.string "You may take part in a chat with\n"
	.string "two to five people.\p"
	.string "Or, you may register a POKéMON for\n"
	.string "trade.\p"
	.string "Would you like to enter the ROOM?$"

CableClub_Text_EnjoyUnionRoom::
	.string "I hope you enjoy your time in\n"
	.string "the UNION ROOM.$"

CableClub_Text_FirstTimeRightThisWay::
	.string "Hello!\n"
	.string "My name is TEALA.\p"
	.string "This must be your first time\n"
	.string "up here.\p"
	.string "I'll show you how the Wireless\n"
	.string "Communication System works.\p"
	.string "First, I need to show you this\n"
	.string "floor of our POKéMON CENTER.\p"
	.string "Right this way, please.$"

CableClub_Text_ExplainWirelessClubFirstTime::
	.string "On the top floor, there are two\n"
	.string "rooms.\p"
	.string "First, the room on the left.\n"
	.string "It's the UNION ROOM.\p"
	.string "You may link up with TRAINERS\n"
	.string "around you who have also entered\l"
	.string "the UNION ROOM.\p"
	.string "With them, you may do things like\n"
	.string "chat, battle, and trade.\p"
	.string "Second, the room on the right is\n"
	.string "the DIRECT CORNER.\p"
	.string "You may trade or battle POKéMON\n"
	.string "with your friends in this room.\p"
	.string "If the Wireless Adapter isn't\n"
	.string "connected, you may still link up\l"
	.string "using a GBA Game Link cable.\p"
	.string "If that is the case, you must go\n"
	.string "to the DIRECT CORNER.\p"
	.string "I hope you enjoy the Wireless \n"
	.string "Communication System.$"

CableClub_Text_AskAboutLinking::
	.string "Hello, {PLAYER}!\p"
	.string "It's me, TEALA, the POKéMON\n"
	.string "CENTER 2F attendant.\p"
	.string "Is there something you needed to\n"
	.string "ask me about linking?$"

CableClub_Text_ExplainWirelessClub::
	.string "Let me explain how the POKéMON\n"
	.string "WIRELESS CLUB works.\p"
	.string "On this, the top floor, there are\n"
	.string "two rooms.\p"
	.string "First, the room on the left.\n"
	.string "It's the UNION ROOM.\p"
	.string "You may link up with TRAINERS\n"
	.string "around you who have also entered\l"
	.string "the UNION ROOM.\p"
	.string "With them, you may do things like\n"
	.string "chat, battle, and trade.\p"
	.string "Second, the room on the right is\n"
	.string "the DIRECT CORNER.\p"
	.string "You may trade or battle POKéMON\n"
	.string "with your friends in this room.\p"
	.string "Sometimes, you may not be able to\n"
	.string "find your friends in the UNION ROOM\l"
	.string "or the DIRECT CORNER.\p"
	.string "In that case, please move closer\n"
	.string "to your friends.\p"
	.string "If the Wireless Adapter isn't\n"
	.string "connected, you may still link up\l"
	.string "using a GBA Game Link cable.\p"
	.string "If that is the case, you must go\n"
	.string "to the DIRECT CORNER.\p"
	.string "I hope you enjoy the Wireless \n"
	.string "Communication System.$"

CableClub_Text_HopeYouEnjoyWirelessSystem::
	.string "I hope you enjoy the Wireless\n"
	.string "Communication System.$"
