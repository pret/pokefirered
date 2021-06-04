CableClub_OnTransition:: @ 81BB1B4
	call CableClub_EventScript_HideOrShowMysteryGiftMan
	end

CableClub_EventScript_HideOrShowMysteryGiftMan:: @ 81BB1BA
	specialvar VAR_RESULT, ValidateReceivedWonderCard
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_HideMysteryGiftMan
	clearflag FLAG_HIDE_MG_DELIVERYMEN
	return

EventScript_HideMysteryGiftMan:: @ 81BB1CE
	setflag FLAG_HIDE_MG_DELIVERYMEN
	return

CableClub_EventScript_MysteryGiftMan:: @ 81BB1D2
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	execram

@ Unused
EventScript_MysteryGiftThankYou:: @ 81BB1E4
	msgbox Text_ThankYouForAccessingMysteryGift, MSGBOX_NPC
	end

CableClub_OnWarp:: @ 81BB1ED
	map_script_2 VAR_CABLE_CLUB_STATE, USING_SINGLE_BATTLE, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_DOUBLE_BATTLE, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MULTI_BATTLE, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_TRADE_CENTER, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_UNION_ROOM, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_BERRY_CRUSH, EventScript_CheckTurnAttendant
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MINIGAME, EventScript_CheckTurnAttendant
	.2byte 0

EventScript_CheckTurnAttendant:: @ 81BB227
	compare VAR_0x8007, 0
	goto_if_eq EventScript_CheckTurnAttendantEnd
	turnobject VAR_0x8007, DIR_WEST
EventScript_CheckTurnAttendantEnd:
	end

CableClub_OnLoad:: @ 81BB237
	compare VAR_CABLE_CLUB_STATE, USING_SINGLE_BATTLE
	goto_if_eq EventScript_OnLoadFromColosseum
	compare VAR_CABLE_CLUB_STATE, USING_DOUBLE_BATTLE
	goto_if_eq EventScript_OnLoadFromColosseum
	compare VAR_CABLE_CLUB_STATE, USING_MULTI_BATTLE
	goto_if_eq EventScript_OnLoadFromColosseum
	compare VAR_CABLE_CLUB_STATE, USING_TRADE_CENTER
	goto_if_eq EventScript_OnLoadFromTradeCenter
	compare VAR_CABLE_CLUB_STATE, USING_UNION_ROOM
	goto_if_eq EventScript_OnLoadFromUnionRoom
	compare VAR_CABLE_CLUB_STATE, USING_BERRY_CRUSH
	goto_if_eq EventScript_OnLoadFromBerryCrush
	compare VAR_CABLE_CLUB_STATE, USING_MINIGAME
	goto_if_eq EventScript_OnLoadFromGameCorner
	end

EventScript_OnLoadFromColosseum:: @ 81BB285
	call CableClub_EventScript_OpenDirectCornerBarrier
	end

EventScript_OnLoadFromTradeCenter:: @ 81BB28B
	call CableClub_EventScript_OpenDirectCornerBarrier
	end

EventScript_OnLoadFromUnionRoom:: @ 81BB291
	call CableClub_EventScript_OpenUnionRoomBarrier
	end

EventScript_OnLoadFromBerryCrush:: @ 81BB297
	call CableClub_EventScript_OpenDirectCornerBarrier
	end

EventScript_OnLoadFromGameCorner:: @ 81BB29D
	call CableClub_EventScript_OpenGameCornerBarrier
	end

CableClub_OnFrame:: @ 81BB2A3
	map_script_2 VAR_MAP_SCENE_POKEMON_CENTER_TEALA, 1, CableClub_EventScript_Tutorial
	map_script_2 VAR_CABLE_CLUB_STATE, USING_SINGLE_BATTLE, CableClub_EventScript_ExitLinkRoom
	map_script_2 VAR_CABLE_CLUB_STATE, USING_DOUBLE_BATTLE, CableClub_EventScript_ExitLinkRoom
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MULTI_BATTLE, CableClub_EventScript_ExitLinkRoom
	map_script_2 VAR_CABLE_CLUB_STATE, USING_TRADE_CENTER, CableClub_EventScript_ExitTradeCenter
	map_script_2 VAR_CABLE_CLUB_STATE, USING_UNION_ROOM, CableClub_EventScript_ExitUnionRoom
	map_script_2 VAR_CABLE_CLUB_STATE, USING_BERRY_CRUSH, CableClub_EventScript_ExitLinkRoom
	map_script_2 VAR_CABLE_CLUB_STATE, USING_MINIGAME, CableClub_EventScript_ExitMinigameRoom
	.2byte 0

CableClub_EventScript_ExitLinkRoom:: @ 81BB2E5
	lockall
	call CableClub_EventScript_CloseLinkAndExitLinkRoom
	call CableClub_EventScript_CloseDirectCornerBarrier
	special DrawWholeMapView
	playse SE_CLICK
	erasebox 0, 0, 29, 19
	releaseall
	end

CableClub_EventScript_ExitMinigameRoom:: @ 81BB2FD
	lockall
	call CableClub_EventScript_CloseLinkAndExitLinkRoom
	call CableClub_EventScript_CloseGameCornerBarrier
	special DrawWholeMapView
	playse SE_CLICK
	erasebox 0, 0, 29, 19
	releaseall
	end

CableClub_EventScript_CloseLinkAndExitLinkRoom:: @ 81BB315
	special CloseLink
	special HelpSystem_Enable
	special QuestLog_StartRecordingInputsAfterDeferredEvent
	setvar VAR_CABLE_CLUB_STATE, 0
	textcolor 1
	compare VAR_0x8007, 0
	goto_if_eq CableClub_EventScript_PlayerExitLinkRoom
	applymovement VAR_0x8007, Movement_AttendantFaceLeft
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerExitLinkRoom
	waitmovement 0
	applymovement VAR_0x8007, Movement_AttendantFaceDown
	waitmovement 0
	return

CableClub_EventScript_ExitTradeCenter:: @ 81BB34F
	lockall
	call CableClub_EventScript_PlayerExitTradeCenter
	call CableClub_EventScript_CloseDirectCornerBarrier
	special DrawWholeMapView
	playse SE_CLICK
	erasebox 0, 0, 29, 19
	releaseall
	end

CableClub_EventScript_PlayerExitTradeCenter:: @ 81BB367
	special CloseLink
	special HelpSystem_Enable
	special QuestLog_StartRecordingInputsAfterDeferredEvent
	setvar VAR_CABLE_CLUB_STATE, 0
	textcolor 1
	compare VAR_0x8007, 0
	goto_if_eq CableClub_EventScript_PlayerExitLinkRoom
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerFaceAttendantRight
	waitmovement 0
	applymovement VAR_0x8007, Movement_AttendantFaceLeft
	waitmovement 0
	call CableClub_EventScript_TrainerCardDataOverwritten
	return

CableClub_EventScript_ExitUnionRoom:: @ 81BB39C
	lockall
	call CableClub_EventScript_PlayerExitUnionRoom
	call CableClub_EventScript_CloseUnionRoomBarrier
	special DrawWholeMapView
	playse SE_CLICK
	erasebox 0, 0, 29, 19
	releaseall
	end

CableClub_EventScript_PlayerExitUnionRoom:: @ 81BB3B4
	special HelpSystem_Enable
	special QuestLog_StartRecordingInputsAfterDeferredEvent
	setvar VAR_CABLE_CLUB_STATE, 0
	textcolor 1
	compare VAR_0x8007, 0
	goto_if_eq CableClub_EventScript_PlayerExitLinkRoom
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerFaceAttendantRight
	waitmovement 0
	applymovement VAR_0x8007, Movement_AttendantFaceLeft
	waitmovement 0
	call CableClub_EventScript_TrainerCardDataOverwritten
	return

CableClub_EventScript_TrainerCardDataOverwritten:: @ 81BB3E6
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

CableClub_EventScript_PlayerExitLinkRoom:: @ 81BB40A
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerExitLinkRoom
	waitmovement 0
	return

CableClub_EventScript_Tutorial:: @ 81BB415
	lockall
	textcolor 1
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
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

Movement_PlayerApproachCounter: @ 81BB447
	walk_up
	walk_up
	step_end

CableClub_EventScript_WelcomeToCableClub:: @ 81BB44A
	message CableClub_Text_WelcomeWhichCableClubService
	waitmessage
	delay 15
	goto CableClub_EventScript_SelectCableClubRoom
	end

CableClub_EventScript_UnusedWelcomeToCableClub:: @ 81BB459
	msgbox CableClub_Text_WhichService
	goto CableClub_EventScript_SelectCableClubRoom
	end

CableClub_EventScript_SelectCableClubRoom:: @ 81BB467
	setvar VAR_0x8004, 0
	multichoice 0, 0, MULTICHOICE_TRADE_CENTER_COLOSSEUM, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_TradeCenter
	case 1, CableClub_EventScript_Colosseum
	case 2, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_Colosseum:: @ 81BB4A3
	copyvar VAR_0x8007, VAR_LAST_TALKED
	goto CableClub_EventScript_SelectBattleMode
	end

CableClub_EventScript_SelectBattleMode:: @ 81BB4AE
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

CableClub_EventScript_BattleModeInfo:: @ 81BB501
	msgbox CableClub_Text_ExplainBattleModes
	goto CableClub_EventScript_SelectBattleMode
	end

CableClub_EventScript_SingleBattleMode:: @ 81BB50F
	setvar VAR_0x8004, USING_SINGLE_BATTLE
	goto CableClub_EventScript_TryEnterColosseum
	end

CableClub_EventScript_DoubleBattleMode:: @ 81BB51A
	special HasEnoughMonsForDoubleBattle
	compare VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS
	goto_if_ne CableClub_EventScript_NeedTwoMonsForDoubleBattle
	setvar VAR_0x8004, USING_DOUBLE_BATTLE
	goto CableClub_EventScript_TryEnterColosseum
	end

CableClub_EventScript_NeedTwoMonsForDoubleBattle:: @ 81BB533
	msgbox CableClub_Text_NeedTwoMonsForDoubleBattle
	goto CableClub_EventScript_SelectBattleMode
	end

CableClub_EventScript_MultiBattleMode:: @ 81BB541
	setvar VAR_0x8004, USING_MULTI_BATTLE
	goto CableClub_EventScript_TryEnterColosseum
	end

CableClub_EventScript_TryEnterColosseum:: @ 81BB54C
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq CableClub_EventScript_AbortLink
	message CableClub_Text_PleaseWaitBCancel
	waitmessage
	special HelpSystem_Disable
	textcolor 3
	special TryBattleLinkup
	waitstate
	call EventScript_RestorePrevTextColor
	compare VAR_RESULT, 1
	goto_if_eq CableClub_EventScript_EnterColosseum
	compare VAR_RESULT, 2
	goto_if_eq CableClub_EventScript_AbortLinkSomeoneNotReady
	compare VAR_RESULT, 3
	goto_if_eq CableClub_EventScript_AbortLinkDifferentSelections
	compare VAR_RESULT, 4
	goto_if_eq CableClub_EventScript_AbortLinkIncorrectNumberOfBattlers
	compare VAR_RESULT, 5
	goto_if_eq CableClub_EventScript_AbortLink
	compare VAR_RESULT, 6
	goto_if_eq CableClub_EventScript_AbortLinkConnectionError
	end

CableClub_EventScript_EnterColosseum:: @ 81BB5B3
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
	hideobject OBJ_EVENT_ID_PLAYER, 0
	closedoor 9, 1
	waitdooranim
	release
	compare VAR_0x8004, USING_MULTI_BATTLE
	goto_if_eq CableClub_EventScript_WarpTo4PColosseum
	special SetCableClubWarp
	warp MAP_BATTLE_COLOSSEUM_2P, 255, 6, 8
	special DoCableClubWarp
	waitstate
	end

@ Unused
CableClub_EventScript_PlayerApproachLinkRoomRight:: @ 81BB621
	applymovement OBJ_EVENT_ID_PLAYER, Movement_PlayerApproachLinkRoomRight
	waitmovement 0
	return

CableClub_EventScript_WarpTo4PColosseum:: @ 81BB62C
	special SetCableClubWarp
	warp MAP_BATTLE_COLOSSEUM_4P, 255, 5, 8
	special DoCableClubWarp
	waitstate
	end

CableClub_EventScript_AbortLinkIncorrectNumberOfBattlers:: @ 81BB63C
	switch VAR_0x8004
	case USING_SINGLE_BATTLE, CableClub_EventScript_AbortLinkWrongNumberForSingleBattle
	case USING_DOUBLE_BATTLE, CableClub_EventScript_AbortLinkWrongNumberForDoubleBattle
	case USING_MULTI_BATTLE, CableClub_EventScript_AbortLinkNeedFourPlayers
	goto CableClub_EventScript_AbortLinkIncorrectNumberOfParticipants
	end

CableClub_EventScript_AbortLinkNeedFourPlayers:: @ 81BB668
	special CloseLink
	msgbox CableClub_Text_NeedFourPlayers
	goto CableClub_EventScript_ConfirmNumberAndRestart
	end

CableClub_EventScript_AbortLinkWrongNumberForDoubleBattle:: @ 81BB679
	special CloseLink
	msgbox CableClub_Text_CantDoubleBattleWithXPlayers
	goto CableClub_EventScript_ConfirmNumberAndRestart
	end

CableClub_EventScript_AbortLinkWrongNumberForSingleBattle:: @ 81BB68A
	special CloseLink
	msgbox CableClub_Text_CantSingleBattleWithXPlayers
	goto CableClub_EventScript_ConfirmNumberAndRestart
	end

CableClub_EventScript_ConfirmNumberAndRestart:: @ 81BB69B
	special CloseLink  @ Redundant
	special HelpSystem_Enable
	msgbox CableClub_Text_PleaseConfirmNumberAndRestart
	release
	end

CableClub_EventScript_TradeCenter:: @ 81BB6AB
	copyvar VAR_0x8007, VAR_LAST_TALKED
	call CableClub_EventScript_CheckPartyTradeRequirements
	compare VAR_RESULT, 0
	goto_if_eq CableClub_EventScript_AbortLink
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq CableClub_EventScript_AbortLink
	message CableClub_Text_PleaseWaitBCancel
	waitmessage
	special HelpSystem_Disable
	textcolor 3
	special TryTradeLinkup
	waitstate
	call EventScript_RestorePrevTextColor
	compare VAR_RESULT, 1
	goto_if_eq CableClub_EventScript_EnterTradeCenter
	compare VAR_RESULT, 2
	goto_if_eq CableClub_EventScript_AbortLinkSomeoneNotReady
	compare VAR_RESULT, 3
	goto_if_eq CableClub_EventScript_AbortLinkDifferentSelections
	compare VAR_RESULT, 4
	goto_if_eq CableClub_EventScript_AbortLinkIncorrectNumberOfParticipants
	compare VAR_RESULT, 5
	goto_if_eq CableClub_EventScript_AbortLink
	compare VAR_RESULT, 6
	goto_if_eq CableClub_EventScript_AbortLinkConnectionError
	compare VAR_RESULT, 7
	goto_if_eq CableClub_EventScript_AbortLinkPlayerNotReady
	compare VAR_RESULT, 9
	goto_if_eq CableClub_EventScript_AbortLinkOtherTrainerNotReady
	end

CableClub_EventScript_EnterTradeCenter:: @ 81BB73D
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
	hideobject OBJ_EVENT_ID_PLAYER, 0
	closedoor 9, 1
	waitdooranim
	release
	special SetCableClubWarp
	setwarp MAP_TRADE_CENTER, 255, 5, 8
	special DoCableClubWarp
	waitstate
	end

CableClub_EventScript_CheckPartyTradeRequirements:: @ 81BB79C
	specialvar VAR_RESULT, CalculatePlayerPartyCount
	compare VAR_RESULT, 2
	goto_if_lt CableClub_EventScript_NeedTwoMonsToTrade
	specialvar VAR_RESULT, DoesPartyHaveEnigmaBerry
	compare VAR_RESULT, TRUE
	goto_if_eq CableClub_EventScript_CantTradeEnigmaBerry
	setvar VAR_RESULT, TRUE
	return

CableClub_EventScript_NeedTwoMonsToTrade:: @ 81BB7C2
	msgbox CableClub_Text_NeedTwoMonsToTrade
	setvar VAR_RESULT, FALSE
	return

CableClub_EventScript_CantTradeEnigmaBerry:: @ 81BB7D0
	msgbox CableClub_Text_CantTradeEnigmaBerry
	setvar VAR_RESULT, FALSE
	return

@ Record Corner is nopped in FRLG
CableClub_EventScript_RecordCorner:: @ 81BB7DE
	end

CableClub_EventScript_AbortLinkPlayerNotReady:: @ 81BB7DF
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_NotSetUpForFarAwayRegion
	release
	end

CableClub_EventScript_AbortLinkOtherTrainerNotReady:: @ 81BB7EF
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_OtherTrainerNotReady
	release
	end

CableClub_EventScript_AbortLinkConnectionError:: @ 81BB7FF
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_LinkErrorPleaseReset
	release
	end

CableClub_EventScript_AbortLinkSomeoneNotReady:: @ 81BB80F
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_SomeoneIsNotReadyToLink
	release
	end

CableClub_EventScript_AbortLinkDifferentSelections:: @ 81BB81F
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_PlayersMadeDifferentSelections
	release
	end

CableClub_EventScript_AbortLink:: @ 81BB82F
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_PleaseVisitAgain
	release
	end

CableClub_EventScript_AbortMinigame:: @ 81BB83F
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_ComeAgain
	release
	end

@ Unused
CableClub_EventScript_CableClubWarp:: @ 81BB84F
	special SetCableClubWarp
	special DoCableClubWarp
	waitstate
	end

CableClub_EventScript_AbortLinkIncorrectNumberOfParticipants:: @ 81BB857
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_IncorrectNumberOfParticipants
	release
	end

CableClub_EventScript_AbortLinkPlayerHasBadEgg:: @ 81BB867
	special CloseLink
	special HelpSystem_Enable
	msgbox CableClub_Text_YouHaveAMonThatCantBeTaken
	release
	end

CableClub_EventScript_WirelessClubAdjustements:: @ 81BB877
	msgbox Text_WirelessClubUndergoingAdjustments
	release
	end

CableClub_EventScript_NotReadyYet:: @ 81BB881
	msgbox Text_AppearsToBeUndergoingAdjustments
	releaseall
	end

Movement_AttendantFaceDown:: @ 81BB88B
	face_down
	step_end

@ Unused
Movement_AttendantFaceRight:: @ 81BB88D
	face_right
	step_end

Movement_AttendantFaceLeft:: @ 81BB88F
	face_left
	step_end

Movement_PlayerExitLinkRoom:: @ 81BB891
	walk_down
	walk_down
	step_end

Movement_PlayerApproachLinkRoomRight:: @ 81BB894
	walk_right
	walk_up
	walk_up
	step_end

Movement_PlayerApproachLinkRoomLeft:: @ 81BB898
	walk_left
	walk_up
	walk_up
	step_end

Movement_PlayerEnterLinkRoom:: @ 81BB89C
	walk_up
	step_end

@ Unused
Movement_PlayerFaceAttendantLeft:: @ 81BB89E
	face_left
	step_end

Movement_PlayerFaceAttendantRight:: @ 81BB8A0
	face_right
	step_end

Movement_PlayerEnterMinigameRoom:: @ 81BB8A2
	walk_left
	walk_up
	walk_up
	walk_up
	step_end

CableClub_EventScript_ShowBattleRecords:: @ 81BB8A7
	goto_if_questlog EventScript_ReleaseEnd
	lockall
	fadescreen FADE_TO_BLACK
	setvar VAR_0x8004, 0
	special ShowBattleRecords
	waitstate
	releaseall
	end

BattleColosseum_2P_EventScript_PlayerSpot0:: @ 81BB8C3
	setvar VAR_0x8005, 0
	textcolor 3
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_2P_EventScript_PlayerSpot1:: @ 81BB8CF
	setvar VAR_0x8005, 1
	textcolor 3
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_4P_EventScript_PlayerSpot0:: @ 81BB8DB
	fadescreen FADE_TO_BLACK
	special ChooseHalfPartyForBattle
	waitstate
	compare VAR_RESULT, 0
	goto_if_eq BattleColosseum_4P_EventScript_CancelSpotTrigger
	setvar VAR_0x8005, 0
	textcolor 3
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_4P_EventScript_PlayerSpot1:: @ 81BB8F8
	fadescreen FADE_TO_BLACK
	special ChooseHalfPartyForBattle
	waitstate
	compare VAR_RESULT, 0
	goto_if_eq BattleColosseum_4P_EventScript_CancelSpotTrigger
	setvar VAR_0x8005, 1
	textcolor 3
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_4P_EventScript_PlayerSpot2:: @ 81BB915
	fadescreen FADE_TO_BLACK
	special ChooseHalfPartyForBattle
	waitstate
	compare VAR_RESULT, 0
	goto_if_eq BattleColosseum_4P_EventScript_CancelSpotTrigger
	setvar VAR_0x8005, 2
	textcolor 3
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_4P_EventScript_PlayerSpot3:: @ 81BB932
	fadescreen FADE_TO_BLACK
	special ChooseHalfPartyForBattle
	waitstate
	compare VAR_RESULT, 0
	goto_if_eq BattleColosseum_4P_EventScript_CancelSpotTrigger
	setvar VAR_0x8005, 3
	textcolor 3
	special EnterColosseumPlayerSpot
	waitstate
	end

BattleColosseum_4P_EventScript_CancelSpotTrigger:: @ 81BB94F
	end

TradeCenter_EventScript_Chair0:: @ 81BB950
	setvar VAR_0x8005, 0
	textcolor 3
	special EnterTradeSeat
	waitstate
	end

TradeCenter_EventScript_Chair1:: @ 81BB95C
	setvar VAR_0x8005, 1
	textcolor 3
	special EnterTradeSeat
	waitstate
	end

@ Unused
TradeCenter_EventScript_Chair2:: @ 81BB968
	setvar VAR_0x8005, 2
	textcolor 3
	special EnterTradeSeat
	waitstate
	end

@ Unused
TradeCenter_EventScript_Chair3:: @ 81BB974
	setvar VAR_0x8005, 3
	textcolor 3
	special EnterTradeSeat
	waitstate
	end

@ Nop in FRLG
@ Separate labels to match GetDirectionForEventScript
RecordCorner_EventScript_Spot0:: @ 81BB980
RecordCorner_EventScript_Spot1:: @ 81BB980
RecordCorner_EventScript_Spot2:: @ 81BB980
RecordCorner_EventScript_Spot3:: @ 81BB980
	end

CableClub_EventScript_ReadTrainerCard:: @ 81BB981
	textcolor 3
	msgbox Text_LookedAtPlayersTrainerCard
	fadescreen FADE_TO_BLACK
	special Script_ShowLinkTrainerCard
	waitstate
	end

CableClub_EventScript_ReadTrainerCardColored:: @ 81BB992
	textcolor 3
	msgbox Text_LookedAtPlayersTrainerCardColored
	fadescreen FADE_TO_BLACK
	special Script_ShowLinkTrainerCard
	waitstate
	end

CableClub_EventScript_TooBusyToNotice:: @ 81BB9A3
	textcolor 3
	msgbox Text_TrainerTooBusyToNotice
	closemessage
	end

BattleColosseum_2P_EventScript_Attendant:: @ 81BB9AF
	textcolor 3
	special Script_FacePlayer
	msgbox Text_TakeSeatStartBattle
	special Script_ClearHeldMovement
	closemessage
	end

TradeCenter_EventScript_Attendant:: @ 81BB9C1
	textcolor 3
	special Script_FacePlayer
	msgbox Text_TakeSeatStartTrade
	special Script_ClearHeldMovement
	closemessage
	end

@ Nop in FRLG
RecordCorner_EventScript_Attendant:: @ 81BB9D3
	end

TradeCenter_ConfirmLeaveRoom:: @ 81BB9D4
	textcolor 3
	msgbox Text_TerminateLinkIfYouLeaveRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq TradeCenter_TerminateLink
	erasebox 0, 0, 29, 19
	releaseall
	end

TradeCenter_TerminateLink:: @ 81BB9F0
	textcolor 3
	messageautoscroll Text_TerminateLinkConfirmation
	waitmessage
	special ExitLinkRoom
	end

CableClub_EventScript_DoLinkRoomExit:: @ 81BB9FC
	special CleanupLinkRoomState
	special ReturnFromLinkRoom
	waitstate
	end

CableClub_EventScript_UnionRoomAttendant:: @ 81BBA04
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	goto_if_unset FLAG_SYS_POKEDEX_GET, CableClub_EventScript_WirelessClubAdjustements
	specialvar VAR_RESULT, IsBadEggInParty
	compare VAR_RESULT, TRUE
	goto_if_eq CableClub_EventScript_AbortLinkPlayerHasBadEgg
	copyvar VAR_0x8007, VAR_LAST_TALKED
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, FALSE
	goto_if_eq CableClub_EventScript_UnionRoomAdapterNotConnected
	message CableClub_Text_WelcomeUnionRoomEnter
	waitmessage
	goto CableClub_EventScript_AskEnterUnionRoom
	end

CableClub_EventScript_AskEnterUnionRoom:: @ 81BBA51
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_EnterUnionRoom
	case 1, CableClub_EventScript_AbortLink
	case 2, CableClub_EventScript_UnionRoomInfo
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_UnionRoomInfo:: @ 81BBA88
	message CableClub_Text_UnionRoomInfo
	waitmessage
	goto CableClub_EventScript_AskEnterUnionRoom
	end

CableClub_EventScript_EnterUnionRoom:: @ 81BBA94
	call CableClub_EventScript_CheckPartyUnionRoomRequirements
	compare VAR_RESULT, FALSE
	goto_if_eq CableClub_EventScript_AbortLink
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq CableClub_EventScript_AbortLink
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
	hideobject OBJ_EVENT_ID_PLAYER, 0
	closedoor 5, 1
	waitdooranim
	special Script_ResetUnionRoomTrade
	special SetCableClubWarp
	warpteleport2 MAP_UNION_ROOM, 255, 7, 11
	waitstate
	special UnionRoomSpecial
	waitstate
	end

CableClub_EventScript_CheckPartyUnionRoomRequirements:: @ 81BBB1E
	specialvar VAR_RESULT, CountPartyNonEggMons
	compare VAR_RESULT, 2
	goto_if_lt CableClub_EventScript_NeedTwoMonsForUnionRoom
	specialvar VAR_RESULT, DoesPartyHaveEnigmaBerry
	compare VAR_RESULT, TRUE
	goto_if_eq CableClub_EventScript_NoEnigmaBerryInUnionRoom
	setvar VAR_RESULT, TRUE
	return

CableClub_EventScript_NeedTwoMonsForUnionRoom:: @ 81BBB44
	msgbox CableClub_Text_NeedTwoMonsForUnionRoom
	goto EventScript_SetResultFalse
	end

CableClub_EventScript_NoEnigmaBerryInUnionRoom:: @ 81BBB52
	msgbox CableClub_Text_NoEnigmaBerryInUnionRoom
	goto EventScript_SetResultFalse
	end

CableClub_EventScript_UnionRoomAdapterNotConnected:: @ 81BBB60
	msgbox CableClub_Text_UnionRoomAdapterNotConnected
	release
	return

CableClub_EventScript_WirelessClubAttendant:: @ 81BBB6A
	lock
	faceplayer
	goto_if_unset FLAG_SYS_POKEDEX_GET, CableClub_EventScript_WirelessClubAdjustements
	msgbox CableClub_Text_AskAboutLinking, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq CableClub_EventScript_DontAskAboutLinking
	msgbox CableClub_Text_ExplainWirelessClub
	release
	return

CableClub_EventScript_DontAskAboutLinking:: @ 81BBB92
	msgbox CableClub_Text_HopeYouEnjoyWirelessSystem
	release
	return

CableClub_EventScript_DirectCornerAttendant:: @ 81BBB9C
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	goto_if_unset FLAG_SYS_POKEDEX_GET, CableClub_EventScript_WirelessClubAdjustements
	specialvar VAR_RESULT, IsBadEggInParty
	compare VAR_RESULT, TRUE
	goto_if_eq CableClub_EventScript_AbortLinkPlayerHasBadEgg
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, FALSE
	goto_if_eq CableClub_EventScript_WelcomeToCableClub
	message CableClub_Text_WelcomeWhichDirectCornerRoom
	waitmessage
	delay 15
	goto CableClub_EventScript_DirectCornerSelectService
	end

CableClub_EventScript_DirectCornerSelectService:: @ 81BBBE7
	goto_if_unset FLAG_GOT_POWDER_JAR, CableClub_EventScript_DirectCornerNoBerry
	multichoice 0, 0, MULTICHOICE_TRADE_COLOSSEUM_CRUSH, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_WirelessTrade
	case 1, CableClub_EventScript_WirelessBattleSelect
	case 2, CableClub_EventScript_WirelessBerryCrush
	case 3, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_DirectCornerNoBerry:: @ 81BBC32
	multichoice 0, 0, MULTICHOICE_TRADE_COLOSSEUM_2, FALSE
	switch VAR_RESULT
	case 0, CableClub_EventScript_WirelessTrade
	case 1, CableClub_EventScript_WirelessBattleSelect
	case 2, CableClub_EventScript_AbortLink
	case SCR_MENU_CANCEL, CableClub_EventScript_AbortLink
	end

CableClub_EventScript_WirelessTrade:: @ 81BBC69
	msgbox CableClub_Text_TradePokemon, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq CableClub_EventScript_AbortLink
	call CableClub_EventScript_CheckPartyTradeRequirements
	compare VAR_RESULT, FALSE
	goto_if_eq CableClub_EventScript_AbortLink
	setvar VAR_0x8004, LINK_GROUP_TRADE
	goto CableClub_EventScript_SaveAndChooseLinkLeader
	end

CableClub_EventScript_WirelessBattleSelect:: @ 81BBC97
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

CableClub_EventScript_WirelessSingleBattle:: @ 81BBCEA
	setvar VAR_0x8004, LINK_GROUP_SINGLE_BATTLE
	goto CableClub_EventScript_SaveAndChooseLinkLeader
	end

CableClub_EventScript_WirelessDoubleBattle:: @ 81BBCF5
	special HasEnoughMonsForDoubleBattle
	compare VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS
	goto_if_ne CableClub_EventScript_TwoMonsNeededForWirelessDoubleBattle
	setvar VAR_0x8004, LINK_GROUP_DOUBLE_BATTLE
	goto CableClub_EventScript_SaveAndChooseLinkLeader
	end

CableClub_EventScript_TwoMonsNeededForWirelessDoubleBattle:: @ 81BBD0E
	msgbox CableClub_Text_NeedTwoMonsForDoubleBattle
	goto CableClub_EventScript_WirelessBattleSelect
	end

CableClub_EventScript_WirelessMultiBattle:: @ 81BBD1C
	setvar VAR_0x8004, LINK_GROUP_MULTI_BATTLE
	goto CableClub_EventScript_SaveAndChooseLinkLeader
	end

CableClub_EventScript_WirelessBattleInfo:: @ 81BBD27
	msgbox CableClub_Text_ExplainBattleModes
	goto CableClub_EventScript_WirelessBattleSelect
	end

CableClub_EventScript_WirelessBerryCrush:: @ 81BBD35
	msgbox CableClub_Text_UseBerryCrush, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq CableClub_EventScript_AbortLink
	special HasAtLeastOneBerry
	compare VAR_RESULT, FALSE
	goto_if_eq CableClub_EventScript_NeedBerryForBerryCrush
	setvar VAR_0x8004, LINK_GROUP_BERRY_CRUSH
	goto CableClub_EventScript_SaveAndChooseLinkLeader
	end

CableClub_EventScript_NeedBerryForBerryCrush:: @ 81BBD61
	msgbox CableClub_Text_NeedBerryForBerryCrush
	goto CableClub_EventScript_DirectCornerSelectService
	end

CableClub_EventScript_SaveAndChooseLinkLeader:: @ 81BBD6F
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq CableClub_EventScript_AbortLink
	switch VAR_0x8004
	case LINK_GROUP_TRADE, CableClub_EventScript_ChooseLinkLeaderFrom2
	case LINK_GROUP_SINGLE_BATTLE, CableClub_EventScript_ChooseLinkLeaderFrom2
	case LINK_GROUP_DOUBLE_BATTLE, CableClub_EventScript_ChooseLinkLeaderFrom2
	case LINK_GROUP_MULTI_BATTLE, CableClub_EventScript_ChooseLinkLeaderFrom4
	case LINK_GROUP_BERRY_CRUSH, CableClub_EventScript_ChooseLinkLeader
	end

CableClub_EventScript_ChooseLinkLeaderFrom2:: @ 81BBDBC
	textcolor 3
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

CableClub_EventScript_TryLeadGroup2Players:: @ 81BBE00
	call CableClub_EventScript_TryBecomeLinkLeader
	compare VAR_RESULT, 1
	goto_if_eq CableClub_EventScript_EnterWirelessLinkRoom
	compare VAR_RESULT, 5
	goto_if_eq CableClub_EventScript_ChooseLinkLeaderFrom2
	compare VAR_RESULT, 8
	goto_if_eq CableClub_EventScript_TryLeadGroup2Players
	release
	return

CableClub_EventScript_TryJoinGroup2Players:: @ 81BBE28
	call CableClub_EventScript_TryJoinLinkGroup
	compare VAR_RESULT, 1
	goto_if_eq CableClub_EventScript_EnterWirelessLinkRoom
	compare VAR_RESULT, 5
	goto_if_eq CableClub_EventScript_ChooseLinkLeaderFrom2
	compare VAR_RESULT, 8
	goto_if_eq CableClub_EventScript_TryJoinGroup2Players
	release
	return

CableClub_EventScript_ChooseLinkLeaderFrom4:: @ 81BBE50
	textcolor 3
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

CableClub_EventScript_TryLeadGroup4Players:: @ 81BBE94
	call CableClub_EventScript_TryBecomeLinkLeader
	compare VAR_RESULT, 1
	goto_if_eq CableClub_EventScript_EnterWirelessLinkRoom
	compare VAR_RESULT, 5
	goto_if_eq CableClub_EventScript_ChooseLinkLeaderFrom4
	compare VAR_RESULT, 8
	goto_if_eq CableClub_EventScript_TryLeadGroup4Players
	release
	return

CableClub_EventScript_TryJoinGroup4Players:: @ 81BBEBC
	call CableClub_EventScript_TryJoinLinkGroup
	compare VAR_RESULT, 1
	goto_if_eq CableClub_EventScript_EnterWirelessLinkRoom
	compare VAR_RESULT, 5
	goto_if_eq CableClub_EventScript_ChooseLinkLeaderFrom4
	compare VAR_RESULT, 8
	goto_if_eq CableClub_EventScript_TryJoinGroup4Players
	release
	return

CableClub_EventScript_ChooseLinkLeader:: @ 81BBEE4
	textcolor 3
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

CableClub_EventScript_TryLeadGroupXPlayers:: @ 81BBF28
	call CableClub_EventScript_TryBecomeLinkLeader
	compare VAR_RESULT, 1
	goto_if_eq CableClub_EventScript_EnterWirelessLinkRoom
	compare VAR_RESULT, 5
	goto_if_eq CableClub_EventScript_ChooseLinkLeader
	compare VAR_RESULT, 8
	goto_if_eq CableClub_EventScript_TryLeadGroupXPlayers
	release
	return

CableClub_EventScript_TryJoinGroupXPlayers:: @ 81BBF50
	call CableClub_EventScript_TryJoinLinkGroup
	compare VAR_RESULT, 1
	goto_if_eq CableClub_EventScript_EnterWirelessLinkRoom
	compare VAR_RESULT, 5
	goto_if_eq CableClub_EventScript_ChooseLinkLeader
	compare VAR_RESULT, 8
	goto_if_eq CableClub_EventScript_TryJoinGroupXPlayers
	release
	return

CableClub_EventScript_TryBecomeLinkLeader:: @ 81BBF78
	special HelpSystem_Disable
	special TryBecomeLinkLeader
	waitstate
	return

CableClub_EventScript_TryJoinLinkGroup:: @ 81BBF80
	special HelpSystem_Disable
	special TryJoinLinkGroup
	waitstate
	return

CableClub_EventScript_EnterWirelessLinkRoom:: @ 81BBF88
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
	hideobject OBJ_EVENT_ID_PLAYER, 0
	closedoor 9, 1
	waitdooranim
	release
	waitstate
	end

CableClub_EventScript_ShowWirelessCommunicationScreen:: @ 81BBFD8
	goto_if_questlog EventScript_ReleaseEnd
	lockall
	goto_if_unset FLAG_SYS_POKEDEX_GET, CableClub_EventScript_NotReadyYet
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, FALSE
	goto_if_eq CableClub_EventScript_AdapterNotConnected
	special HelpSystem_Disable
	fadescreen FADE_TO_BLACK
	special ShowWirelessCommunicationScreen
	waitstate
	msgbox CableClub_Text_ParticipantsStepUpToCounter
	special HelpSystem_Enable
	releaseall
	end

CableClub_EventScript_AdapterNotConnected:: @ 81BC016
	msgbox CableClub_Text_AdapterNotConnected
	releaseall
	end

CableClub_EventScript_OpenUnionRoomBarrier:: @ 81BC020
	setmetatile 5, 3, METATILE_PokemonCenter_Floor_ShadeLeft, 0
	return

CableClub_EventScript_CloseUnionRoomBarrier:: @ 81BC02A
	setmetatile 5, 3, METATILE_PokemonCenter_CounterBarrier, 1
	return

CableClub_EventScript_OpenDirectCornerBarrier:: @ 81BC034
	setmetatile 9, 3, METATILE_PokemonCenter_Floor_ShadeLeft, 0
	return

CableClub_EventScript_CloseDirectCornerBarrier:: @ 81BC03E
	setmetatile 9, 3, METATILE_PokemonCenter_CounterBarrier, 1
	return

CableClub_EventScript_OpenGameCornerBarrier:: @ 81BC048
	setmetatile 5, 3, METATILE_GameCorner_CheckeredFloor_ShadeLeft, 0
	return

CableClub_EventScript_CloseGameCornerBarrier:: @ 81BC052
	setmetatile 5, 3, METATILE_GameCorner_CounterBarrier, 1
	return

CableClub_OnResume:: @ 81BC05C
	special InitUnionRoom
	end

JoyfulGameCorner_EventScript_InfoMan2:: @ 81BC060
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

CableClub_EventScript_PokemonJumpInfo:: @ 81BC0B0
	msgbox Text_PokemonJumpInfo
	release
	end

CableClub_EventScript_DodrioBerryPickingInfo:: @ 81BC0BA
	msgbox Text_DodrioBerryPickingInfo
	release
	end

CableClub_EventScript_MinigameInfoExit:: @ 81BC0C4
	msgbox Text_TalkToManToPlay
	release
	end

JoyfulGameCorner_EventScript_MinigameAttendant:: @ 81BC0CE
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	message Text_WelcomeCanYouWait
	waitmessage
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, FALSE
	goto_if_eq CableClub_EventScript_AdapterNotConnectedMinigame
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

CableClub_EventScript_PlayPokemonJump:: @ 81BC13A
	setvar VAR_0x8005, 0
	special IsPokemonJumpSpeciesInParty
	compare VAR_RESULT, FALSE
	goto_if_eq CableClub_EventScript_NoEligiblePkmn
	msgbox Text_EnterWhichPokemon
	setvar VAR_0x8005, 0
	special ChooseMonForWirelessMinigame
	waitstate
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge CableClub_EventScript_AbortMinigame
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq CableClub_EventScript_AbortMinigame
	setvar VAR_0x8004, LINK_GROUP_POKEMON_JUMP
	goto CableClub_EventScript_ChooseLinkLeaderMinigame
	end

CableClub_EventScript_PlayDodrioBerryPicking:: @ 81BC184
	setvar VAR_0x8005, 1
	special IsDodrioInParty
	compare VAR_RESULT, 0
	goto_if_eq CableClub_EventScript_NoEligiblePkmn
	msgbox Text_EnterWhichPokemon
	setvar VAR_0x8005, 1
	special ChooseMonForWirelessMinigame
	waitstate
	compare VAR_0x8004, PARTY_SIZE
	goto_if_ge CableClub_EventScript_AbortMinigame
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq CableClub_EventScript_AbortMinigame
	setvar VAR_0x8004, LINK_GROUP_BERRY_PICKING
	goto CableClub_EventScript_ChooseLinkLeaderMinigame
	end

CableClub_EventScript_ChooseLinkLeaderMinigame:: @ 81BC1CE
	textcolor 3
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

CableClub_EventScript_TryBecomeMinigameLinkLeader:: @ 81BC212
	call CableClub_EventScript_TryBecomeLinkLeader
	compare VAR_RESULT, 1
	goto_if_eq CableClub_EventScript_EnterMinigame
	compare VAR_RESULT, 5
	goto_if_eq CableClub_EventScript_ChooseLinkLeaderMinigame
	compare VAR_RESULT, 8
	goto_if_eq CableClub_EventScript_TryBecomeMinigameLinkLeader
	release
	return

CableClub_EventScript_TryJoinMinigameLinkGroup:: @ 81BC23A
	call CableClub_EventScript_TryJoinLinkGroup
	compare VAR_RESULT, 1
	goto_if_eq CableClub_EventScript_EnterMinigame
	compare VAR_RESULT, 5
	goto_if_eq CableClub_EventScript_ChooseLinkLeaderMinigame
	compare VAR_RESULT, 8
	goto_if_eq CableClub_EventScript_TryJoinMinigameLinkGroup
	release
	return

CableClub_EventScript_EnterMinigame:: @ 81BC262
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
	hideobject OBJ_EVENT_ID_PLAYER, 0
	release
	waitstate
	end

CableClub_EventScript_AdapterNotConnectedMinigame:: @ 81BC29C
	msgbox Text_AdapterNotConnectedMinigame
	release
	end

CableClub_EventScript_NoEligiblePkmn:: @ 81BC2A6
	msgbox EventScript_ExplainPokemonJumpRequirements, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq CableClub_EventScript_AbortMinigame
	compare VAR_0x8005, 0
	call_if_eq CableClub_EventScript_ExplainPokemonJumpRequirements
	compare VAR_0x8005, 1
	call_if_eq CableClub_EventScript_ExplainDodrioBerryPickingRequirements
	goto CableClub_EventScript_AbortMinigame
	end

CableClub_EventScript_ExplainPokemonJumpRequirements:: @ 81BC2D5
	msgbox Text_ShortJumpingPokemonAllowed
	return

CableClub_EventScript_ExplainDodrioBerryPickingRequirements:: @ 81BC2DE
	msgbox Text_OnlyDodrioAllowed
	return

TwoIsland_JoyfulGameCorner_EventScript_ShowPokemonJumpRecords:: @ 81BC2E7
	goto_if_questlog EventScript_ReleaseEnd
	lockall
	special ShowPokemonJumpRecords
	waitstate
	releaseall
	end

TwoIsland_JoyfulGameCorner_EventScript_ShowDodrioBerryPickingRecords:: @ 81BC2FC
	goto_if_questlog EventScript_ReleaseEnd
	lockall
	special ShowDodrioBerryPickingRecords
	waitstate
	releaseall
	end

CableClub_Text_WelcomeWhichCableClubService:: @ 81BC311
	.string "Welcome to the POKéMON CABLE\n"
	.string "CLUB.\p"
	.string "Which of our services do you wish\n"
	.string "to use?$"

CableClub_Text_WhichService:: @ 81BC35E
	.string "Which of our services do you wish\n"
	.string "to use?$"

CableClub_Text_TradeMonsUsingLinkCable:: @ 81BC388
	.string "Trade POKéMON with another player\n"
	.string "using a GBA Game Link cable.$"

CableClub_Text_BattleUsingLinkCable:: @ 81BC3C7
	.string "You may battle another TRAINER\n"
	.string "using a GBA Game Link cable.$"

@ Unused, translated in Emerald
CableClub_Text_CloseThisMenu:: @ 81BC403
	.string "おわります$"

CableClub_Text_NeedTwoMonsForDoubleBattle:: @ 81BC409
	.string "For a DOUBLE BATTLE, you must\n"
	.string "have at least two POKéMON.$"

CableClub_Text_NeedTwoMonsToTrade:: @ 81BC442
	.string "For trading, you must have at\n"
	.string "least two POKéMON with you.$"

CableClub_Text_CantTradeEnigmaBerry:: @ 81BC47C
	.string "A POKéMON holding the {STR_VAR_1}\n"
	.string "BERRY can't be traded.$"

CableClub_Text_PleaseWaitBCancel:: @ 81BC4AC
	.string "Please wait.\n"
	.string "… … B Button: Cancel$"

CableClub_Text_WhenAllPlayersReadyAConfirmBCancel:: @ 81BC4CE
	.string "When all players are ready…\n"
	.string "A Button: Confirm\l"
	.string "B Button: Cancel$"

CableClub_Text_StartLinkWithXPlayersAConfirmBCancel:: @ 81BC50D
	.string "Start link with {STR_VAR_1} players.\n"
	.string "A Button: Confirm\l"
	.string "B Button: Cancel$"

CableClub_Text_AwaitingLinkupBCancel:: @ 81BC54C
	.string "Awaiting linkup…\n"
	.string "… … B Button: Cancel$"

@ Unused, translated in Emerald
CableClub_Text_OkayToSaveProgress:: @ 81BC572
	.string "はじめる　まえに　レポートを\n"
	.string "かきますが　よろしいですか？$"

CableClub_Text_PleaseEnter:: @ 81BC590
	.string "Please enter.$"

CableClub_Text_DirectYouToYourRoom:: @ 81BC59E
	.string "I'll direct you to your room now.$"

CableClub_Text_SomeoneIsNotReadyToLink:: @ 81BC5C0
	.string "Someone is not ready to link.\p"
	.string "Please come back after everyone\n"
	.string "has made preparations.$"

CableClub_Text_LinkErrorPleaseReset:: @ 81BC615
	.string "Sorry, we have a link error…\n"
	.string "Please reset and try again.$"

CableClub_Text_PlayersMadeDifferentSelections:: @ 81BC64E
	.string "The link partners appear to have\n"
	.string "made different selections.$"

CableClub_Text_PleaseVisitAgain:: @ 81BC68A
	.string "Please do visit again.$"

CableClub_Text_IncorrectNumberOfParticipants:: @ 81BC6A1
	.string "The number of participants is\n"
	.string "incorrect.$"

CableClub_Text_CantSingleBattleWithXPlayers:: @ 81BC6CA
	.string "The SINGLE BATTLE Mode can't be\n"
	.string "played by {STR_VAR_1} players.$"

CableClub_Text_CantDoubleBattleWithXPlayers:: @ 81BC700
	.string "The DOUBLE BATTLE Mode can't be\n"
	.string "played by {STR_VAR_1} players.$"

CableClub_Text_NeedFourPlayers:: @ 81BC736
	.string "There must be four players to play\n"
	.string "this Battle Mode.$"

CableClub_Text_PleaseConfirmNumberAndRestart:: @ 81BC76B
	.string "Please confirm the number of\n"
	.string "players and start again.$"

Text_TerminateLinkIfYouLeaveRoom:: @ 81BC7A1
	.string "The link will be terminated if you\n"
	.string "leave the room. Is that okay?$"

Text_TerminateLinkConfirmation:: @ 81BC7E2
	.string "Terminating link…\n"
	.string "You will be escorted out of\l"
	.string "the room. Please wait.$"

Text_TrainerTooBusyToNotice:: @ 81BC827
	.string "This TRAINER is too busy to\n"
	.string "notice…$"

Text_LookedAtPlayersTrainerCard:: @ 81BC84B
	.string "Score! Got to look at {STR_VAR_1}'s\n"
	.string "TRAINER CARD!$"

Text_LookedAtPlayersTrainerCardColored:: @ 81BC874
	.string "Score! Got to look at {STR_VAR_1}'s\n"
	.string "TRAINER CARD!\p"
	.string "It's a {STR_VAR_2} card!$"

Text_TakeSeatStartBattle:: @ 81BC8AD
	.string "Please take your seat and start\n"
	.string "your battle.$"

Text_TakeSeatStartTrade:: @ 81BC8DA
	.string "Please take your seat and start\n"
	.string "your trade.$"

@ Unused, leftover from RS
RecordCorner_Text_ThanksForComing:: @ 81BC906
	.string "ごりよう　ありがとう　ございました$"

CableClub_Text_TrainerCardDataOverwritten:: @ 81BC918
	.string "The TRAINER CARD data will\n"
	.string "be overwritten.$"

CableClub_Text_HopeToSeeYouAgain:: @ 81BC943
	.string "I hope to see you again!$"

CableClub_Text_NotSetUpForFarAwayRegion:: @ 81BC95C
	.string "I'm awfully sorry.\p"
	.string "We're not set up to conduct trades\n"
	.string "with TRAINERS far away in another\l"
	.string "region yet…$"

CableClub_Text_OtherTrainerNotReady:: @ 81BC9C0
	.string "The other TRAINER is not ready.$"

CableClub_Text_YouHaveAMonThatCantBeTaken:: @ 81BC9E0
	.string "You have at least one POKéMON\n"
	.string "that can't be taken.$"

CableClub_Text_AdapterNotConnected:: @ 81BCA13
	.string "The Wireless Adapter is not\n"
	.string "connected properly.$"

CableClub_Text_ParticipantsStepUpToCounter:: @ 81BCA43
	.string "Participants are asked to step up\n"
	.string "to the reception counter.$"

@ Unused, translated in Emerald
CableClub_Text_Hello:: @ 81BCA7F
	.string "こんにちは！$"

@ Unused, translated in Emerald
CableClub_Text_PleaseWait:: @ 81BCA86
	.string "しょうしょう　おまちください$"

CableClub_Text_YouMayTradeHere:: @ 81BCA95
	.string "You may trade your POKéMON here\n"
	.string "with another TRAINER.$"

CableClub_Text_YouMayBattleHere:: @ 81BCACB
	.string "You may battle with your friends\n"
	.string "here.$"

CableClub_Text_CanMakeBerryPowder:: @ 81BCAF2
	.string "Two to five TRAINERS can make\n"
	.string "BERRY POWDER together.$"

@ Unused, Record Mix nopped
CableClub_Text_CanMixRecords:: @ 81BCB27
	.string "ワイヤレス　クラブでの\n"
	.string "あそびかたを　せつめいします$"

CableClub_Text_CancelSelectedItem:: @ 81BCB42
	.string "Cancels the selected MENU item.$"

@ Unused, translated in Emerald
CableClub_Text_WhichBattleMode:: @ 81BCB62
	.string "どちらの　しょうぶに　しますか？$"

@ Unused, translated in Emerald
CableClub_Text_ReturnsToPreviousStep:: @ 81BCB73
	.string "ひとつ　まえに　もどります$"

CableClub_Text_NeedBerryForBerryCrush:: @ 81BCB81
	.string "To use the BERRY CRUSH service,\n"
	.string "you must have at least one BERRY.$"

CableClub_Text_NeedTwoMonsForUnionRoom:: @ 81BCBC3
	.string "To enter the UNION ROOM, you must\n"
	.string "have at least two POKéMON.$"

CableClub_Text_NoEnigmaBerryInUnionRoom:: @ 81BCC00
	.string "No POKéMON holding the {STR_VAR_1}\n"
	.string "BERRY may enter the UNION ROOM.$"

CableClub_Text_UnionRoomAdapterNotConnected:: @ 81BCC3A
	.string "This is the POKéMON WIRELESS CLUB\n"
	.string "UNION ROOM.\p"
	.string "Unfortunately, your Wireless\n"
	.string "Adapter is not connected properly.\p"
	.string "Please do come again.$"

@ Unused, translated in Emerald
CableClub_Text_OhExcuseMe:: @ 81BCCBE
	.string "あ‥‥\n"
	.string "おきゃくさま！$"

Text_PlayerIsPlayingRightNowGoForIt:: @ 81BCCCA
	.string "It appears as if {STR_VAR_1} is playing\n"
	.string "right now.\l"
	.string "Go for it!$"

Text_DescribeWhichGame:: @ 81BCCFF
	.string "I can explain game rules to you,\n"
	.string "if you'd like.\p"
	.string "Which game should I describe?$"

Text_PokemonJumpInfo:: @ 81BCD4D
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

Text_DodrioBerryPickingInfo:: @ 81BCE73
	.string "“DODRIO BERRY-PICKING”\p"
	.string "Command DODRIO's three heads to\n"
	.string "catch falling BERRIES.\p"
	.string "Press right, up, or left on the\n"
	.string "{PLUS} Control Pad to move the heads.\p"
	.string "To play this game, you must have\n"
	.string "a DODRIO.$"

Text_TalkToManToPlay:: @ 81BCF2E
	.string "If you want to play a game,\n"
	.string "please tell the man beside me.$"

Text_WelcomeCanYouWait:: @ 81BCF69
	.string "Hi, welcome!\n"
	.string "You can play games over the\l"
	.string "Wireless Communication System.\p"
	.string "Can you wait just a little bit?$"

CableClub_Text_ComeAgain:: @ 81BCFD1
	.string "All right, come again!$"

Text_AdapterNotConnectedMinigame:: @ 81BCFE8
	.string "The Wireless Adapter isn't\n"
	.string "connected.\p"
	.string "Come back when it's hooked up!$"

Text_PlayWhichGame:: @ 81BD02D
	.string "All right, which game did you want\n"
	.string "to play?$"

Text_EnterWhichPokemon:: @ 81BD059
	.string "Which POKéMON would you like to\n"
	.string "enter?$"

Text_AllGoodToGo:: @ 81BD080
	.string "Okay, you're all good to go.\n"
	.string "Don't let the others beat you!$"

@ Unused, translated in Emerald
Text_LeavingDoComeAgain:: @ 81BD0BC
	.string "きょうは　けえるのか？\n"
	.string "またこいよ！$"

EventScript_ExplainPokemonJumpRequirements:: @ 81BD0CF
	.string "It doesn't look like you have any\n"
	.string "POKéMON that you can enter…\p"
	.string "Would you like me to explain what\n"
	.string "kinds of POKéMON can enter?$"

Text_ShortJumpingPokemonAllowed:: @ 81BD14B
	.string "“POKéMON JUMP” is open to POKéMON\n"
	.string "around 28 inches or less.\p"
	.string "What you can't enter are those\n"
	.string "POKéMON that can't jump.\p"
	.string "You know, like POKéMON that only\n"
	.string "swim, burrow, or fly.\p"
	.string "That's all you need to know.$"

Text_OnlyDodrioAllowed:: @ 81BD213
	.string "“DODRIO BERRY-PICKING”…\n"
	.string "Well, the name says it all.\p"
	.string "You have to have a DODRIO to play\n"
	.string "this game.$"

@ Unused, translated in Emerald
Text_RetryFromStartPlease:: @ 81BD274
	.string "もういちど　はじめから\n"
	.string "やりなおして　みて　くれ$"

CableClub_Text_WelcomeWhichDirectCornerRoom:: @ 81BD28D
	.string "Welcome to the POKéMON WIRELESS\n"
	.string "CLUB DIRECT CORNER.\p"
	.string "You may interact directly with\n"
	.string "your friends here.\p"
	.string "Which room would you like to\n"
	.string "enter?$"

CableClub_Text_TradePokemon:: @ 81BD317
	.string "Would you like to trade POKéMON?$"

CableClub_Text_PlayWhichBattleMode:: @ 81BD338
	.string "Which Battle Mode would you like\n"
	.string "to play?$"

CableClub_Text_UseBerryCrush:: @ 81BD362
	.string "Would you like to use the\n"
	.string "BERRY CRUSH System?$"

CableClub_Text_ExplainBattleModes:: @ 81BD390
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

CableClub_Text_ChooseGroupLeaderOfTwo:: @ 81BD51B
	.string "Please decide which of you two\n"
	.string "will become the LEADER.\p"
	.string "The other player must then choose\n"
	.string "“JOIN GROUP.”$"

CableClub_Text_ChooseGroupLeaderOfFour:: @ 81BD582
	.string "Please decide which of you four\n"
	.string "will become the GROUP LEADER.\p"
	.string "The other players must then choose\n"
	.string "“JOIN GROUP.”$"

CableClub_Text_ChooseGroupLeader:: @ 81BD5F1
	.string "Please decide which of you will\n"
	.string "become the GROUP LEADER.\p"
	.string "The other players must then choose\n"
	.string "“JOIN GROUP.”$"

CableClub_Text_WelcomeUnionRoomEnter:: @ 81BD65B
	.string "Welcome to the POKéMON WIRELESS\n"
	.string "CLUB UNION ROOM.\p"
	.string "You may interact directly with\n"
	.string "other TRAINERS here, some of\l"
	.string "whom you may not even know.\p"
	.string "Would you like to enter the ROOM?$"

CableClub_Text_UnionRoomInfo:: @ 81BD706
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

CableClub_Text_EnjoyUnionRoom:: @ 81BD86A
	.string "I hope you enjoy your time in\n"
	.string "the UNION ROOM.$"

CableClub_Text_FirstTimeRightThisWay:: @ 81BD898
	.string "Hello!\n"
	.string "My name is TEALA.\p"
	.string "This must be your first time\n"
	.string "up here.\p"
	.string "I'll show you how the Wireless\n"
	.string "Communication System works.\p"
	.string "First, I need to show you this\n"
	.string "floor of our POKéMON CENTER.\p"
	.string "Right this way, please.$"

CableClub_Text_ExplainWirelessClubFirstTime:: @ 81BD966
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

CableClub_Text_AskAboutLinking:: @ 81BDB85
	.string "Hello, {PLAYER}!\p"
	.string "It's me, TEALA, the POKéMON\n"
	.string "CENTER 2F attendant.\p"
	.string "Is there something you needed to\n"
	.string "ask me about linking?$"

CableClub_Text_ExplainWirelessClub:: @ 81BDBF8
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

CableClub_Text_HopeYouEnjoyWirelessSystem:: @ 81BDEDF
	.string "I hope you enjoy the Wireless\n"
	.string "Communication System.$"
