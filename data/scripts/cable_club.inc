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
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	execram

@ Unused
EventScript_1BB1E4:: @ 81BB1E4
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
	playse SE_TK_KASYA
	erasebox 0, 0, 29, 19
	releaseall
	end

CableClub_EventScript_ExitMinigameRoom:: @ 81BB2FD
	lockall
	call CableClub_EventScript_CloseLinkAndExitLinkRoom
	call CableClub_EventScript_CloseGameCornerBarrier
	special DrawWholeMapView
	playse SE_TK_KASYA
	erasebox 0, 0, 29, 19
	releaseall
	end

CableClub_EventScript_CloseLinkAndExitLinkRoom:: @ 81BB315
	special CloseLink
	special HelpSystem_Enable
	special sub_811390C
	setvar VAR_CABLE_CLUB_STATE, 0
	textcolor 1
	compare VAR_0x8007, 0
	goto_if_eq CableClub_EventScript_PlayerExitLinkRoom
	applymovement VAR_0x8007, Movement_1BB88F
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB891
	waitmovement 0
	applymovement VAR_0x8007, Movement_1BB88B
	waitmovement 0
	return

CableClub_EventScript_ExitTradeCenter:: @ 81BB34F
	lockall
	call EventScript_1BB367
	call CableClub_EventScript_CloseDirectCornerBarrier
	special DrawWholeMapView
	playse SE_TK_KASYA
	erasebox 0, 0, 29, 19
	releaseall
	end

EventScript_1BB367:: @ 81BB367
	special CloseLink
	special HelpSystem_Enable
	special sub_811390C
	setvar VAR_CABLE_CLUB_STATE, 0
	textcolor 1
	compare VAR_0x8007, 0
	goto_if_eq CableClub_EventScript_PlayerExitLinkRoom
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB8A0
	waitmovement 0
	applymovement VAR_0x8007, Movement_1BB88F
	waitmovement 0
	call EventScript_1BB3E6
	return

CableClub_EventScript_ExitUnionRoom:: @ 81BB39C
	lockall
	call EventScript_1BB3B4
	call CableClub_EventScript_CloseUnionRoomBarrier
	special DrawWholeMapView
	playse SE_TK_KASYA
	erasebox 0, 0, 29, 19
	releaseall
	end

EventScript_1BB3B4:: @ 81BB3B4
	special HelpSystem_Enable
	special sub_811390C
	setvar VAR_CABLE_CLUB_STATE, 0
	textcolor 1
	compare VAR_0x8007, 0
	goto_if_eq CableClub_EventScript_PlayerExitLinkRoom
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB8A0
	waitmovement 0
	applymovement VAR_0x8007, Movement_1BB88F
	waitmovement 0
	call EventScript_1BB3E6
	return

EventScript_1BB3E6:: @ 81BB3E6
	message Text_1BC918
	waitmessage
	playse SE_PIN
	message Text_1BC943
	waitmessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB891
	waitmovement 0
	applymovement VAR_0x8007, Movement_1BB88B
	waitmovement 0
	return

CableClub_EventScript_PlayerExitLinkRoom:: @ 81BB40A
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB891
	waitmovement 0
	return

CableClub_EventScript_Tutorial:: @ 81BB415
	lockall
	textcolor 1
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox gUnknown_81BD898
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB447
	waitmovement 0
	delay 30
	msgbox gUnknown_81BD966
	setvar VAR_MAP_SCENE_POKEMON_CENTER_TEALA, 2
	releaseall
	end

Movement_1BB447:: @ 81BB447
	walk_up
	walk_up
	step_end

EventScript_1BB44A:: @ 81BB44A
	message gUnknown_81BC311
	waitmessage
	delay 15
	goto EventScript_1BB467
	end

EventScript_1BB459:: @ 81BB459
	msgbox gUnknown_81BC35E
	goto EventScript_1BB467
	end

EventScript_1BB467:: @ 81BB467
	setvar VAR_0x8004, 0
	multichoice 0, 0, MULTICHOICE_TRADE_CENTER_COLOSSEUM, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BB6AB
	case 1, EventScript_1BB4A3
	case 2, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BB4A3:: @ 81BB4A3
	copyvar VAR_0x8007, VAR_LAST_TALKED
	goto EventScript_1BB4AE

EventScript_1BB4AD:: @ 81BB4AD
	end

EventScript_1BB4AE:: @ 81BB4AE
	message Text_1BD338
	waitmessage
	multichoice 0, 0, MULTICHOICE_SINGLE_DOUBLE_MULTI_INFO_EXIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BB50F
	case 1, EventScript_1BB51A
	case 2, EventScript_1BB541
	case 3, EventScript_1BB501
	case 4, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BB501:: @ 81BB501
	msgbox gUnknown_81BD390
	goto EventScript_1BB4AE
	end

EventScript_1BB50F:: @ 81BB50F
	setvar VAR_0x8004, 1
	goto EventScript_1BB54C
	end

EventScript_1BB51A:: @ 81BB51A
	special CheckForAlivePartyMons
	compare VAR_RESULT, 0
	goto_if_ne EventScript_1BB533
	setvar VAR_0x8004, 2
	goto EventScript_1BB54C
	end

EventScript_1BB533:: @ 81BB533
	msgbox gUnknown_81BC409
	goto EventScript_1BB4AE
	end

EventScript_1BB541:: @ 81BB541
	setvar VAR_0x8004, 5
	goto EventScript_1BB54C
	end

EventScript_1BB54C:: @ 81BB54C
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB82F
	message gUnknown_81BC4AC
	waitmessage
	special HelpSystem_Disable
	textcolor 3
	special sub_8081064
	waitstate
	call EventScript_1A6675
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BB5B3
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1BB80F
	compare VAR_RESULT, 3
	goto_if_eq EventScript_1BB81F
	compare VAR_RESULT, 4
	goto_if_eq EventScript_1BB63C
	compare VAR_RESULT, 5
	goto_if_eq EventScript_1BB82F
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1BB7FF
	end

EventScript_1BB5B3:: @ 81BB5B3
	special sp000_heal_pokemon
	special SavePlayerParty
	special LoadPlayerBag
	copyvar VAR_CABLE_CLUB_STATE, VAR_0x8004
	messageautoscroll Text_1BC590
	waitmessage
	call CableClub_EventScript_OpenDirectCornerBarrier
	special DrawWholeMapView
	playse SE_TK_KASYA
	delay 60
	applymovement VAR_LAST_TALKED, Movement_1BB88F
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB898
	waitmovement 0
	opendoor 9, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB89C
	waitmovement 0
	hideobject OBJ_EVENT_ID_PLAYER, MAP_UNKNOWN_MAP_00_00
	closedoor 9, 1
	waitdooranim
	release
	compare VAR_0x8004, 5
	goto_if_eq EventScript_1BB62C
	special SetCableClubWarp
	warp MAP_UNKNOWN_MAP_00_00, 255, 6, 8
	special DoCableClubWarp
	waitstate
	end

EventScript_1BB621:: @ 81BB621
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB894
	waitmovement 0
	return

EventScript_1BB62C:: @ 81BB62C
	special SetCableClubWarp
	warp MAP_UNKNOWN_MAP_00_03, 255, 5, 8
	special DoCableClubWarp
	waitstate
	end

EventScript_1BB63C:: @ 81BB63C
	switch VAR_0x8004
	case 1, EventScript_1BB68A
	case 2, EventScript_1BB679
	case 5, EventScript_1BB668
	goto EventScript_1BB857

EventScript_1BB667:: @ 81BB667
	end

EventScript_1BB668:: @ 81BB668
	special CloseLink
	msgbox gUnknown_81BC736
	goto EventScript_1BB69B

EventScript_1BB678:: @ 81BB678
	end

EventScript_1BB679:: @ 81BB679
	special CloseLink
	msgbox gUnknown_81BC700
	goto EventScript_1BB69B

EventScript_1BB689:: @ 81BB689
	end

EventScript_1BB68A:: @ 81BB68A
	special CloseLink
	msgbox gUnknown_81BC6CA
	goto EventScript_1BB69B

EventScript_1BB69A:: @ 81BB69A
	end

EventScript_1BB69B:: @ 81BB69B
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC76B
	release
	end

EventScript_1BB6AB:: @ 81BB6AB
	copyvar VAR_0x8007, VAR_LAST_TALKED
	call EventScript_1BB79C
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB82F
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB82F
	message gUnknown_81BC4AC
	waitmessage
	special HelpSystem_Disable
	textcolor 3
	special sub_80810CC
	waitstate
	call EventScript_1A6675
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BB73D
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1BB80F
	compare VAR_RESULT, 3
	goto_if_eq EventScript_1BB81F
	compare VAR_RESULT, 4
	goto_if_eq EventScript_1BB857
	compare VAR_RESULT, 5
	goto_if_eq EventScript_1BB82F
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1BB7FF
	compare VAR_RESULT, 7
	goto_if_eq EventScript_1BB7DF
	compare VAR_RESULT, 9
	goto_if_eq EventScript_1BB7EF
	end

EventScript_1BB73D:: @ 81BB73D
	setvar VAR_0x8004, 3
	copyvar VAR_CABLE_CLUB_STATE, VAR_0x8004
	messageautoscroll Text_1BC590
	waitmessage
	call CableClub_EventScript_OpenDirectCornerBarrier
	special DrawWholeMapView
	playse SE_TK_KASYA
	delay 60
	applymovement VAR_LAST_TALKED, Movement_1BB88F
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB898
	waitmovement 0
	opendoor 9, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB89C
	waitmovement 0
	hideobject OBJ_EVENT_ID_PLAYER, MAP_UNKNOWN_MAP_00_00
	closedoor 9, 1
	waitdooranim
	release
	special SetCableClubWarp
	setwarp MAP_UNKNOWN_MAP_00_01, 255, 5, 8
	special DoCableClubWarp
	waitstate
	end

EventScript_1BB79C:: @ 81BB79C
	specialvar VAR_RESULT, CalculatePlayerPartyCount
	compare VAR_RESULT, 2
	goto_if_lt EventScript_1BB7C2
	specialvar VAR_RESULT, GetNameOfEnigmaBerryInPlayerParty
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BB7D0
	setvar VAR_RESULT, 1
	return

EventScript_1BB7C2:: @ 81BB7C2
	msgbox gUnknown_81BC442
	setvar VAR_RESULT, 0
	return

EventScript_1BB7D0:: @ 81BB7D0
	msgbox gUnknown_81BC47C
	setvar VAR_RESULT, 0
	return

EventScript_1BB7DE:: @ 81BB7DE
	end

EventScript_1BB7DF:: @ 81BB7DF
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC95C
	release
	end

EventScript_1BB7EF:: @ 81BB7EF
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC9C0
	release
	end

EventScript_1BB7FF:: @ 81BB7FF
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC615
	release
	end

EventScript_1BB80F:: @ 81BB80F
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC5C0
	release
	end

EventScript_1BB81F:: @ 81BB81F
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC64E
	release
	end

EventScript_1BB82F:: @ 81BB82F
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC68A
	release
	end

EventScript_1BB83F:: @ 81BB83F
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BCFD1
	release
	end

EventScript_1BB84F:: @ 81BB84F
	special SetCableClubWarp
	special DoCableClubWarp
	waitstate
	end

EventScript_1BB857:: @ 81BB857
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC6A1
	release
	end

EventScript_1BB867:: @ 81BB867
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC9E0
	release
	end

EventScript_1BB877:: @ 81BB877
	msgbox Text_WirelessClubUndergoingAdjustments
	release
	end

EventScript_1BB881:: @ 81BB881
	msgbox Text_AppearsToBeUndergoingAdjustments
	releaseall
	end

Movement_1BB88B:: @ 81BB88B
	face_down
	step_end

Movement_1BB88D:: @ 81BB88D
	face_right
	step_end

Movement_1BB88F:: @ 81BB88F
	face_left
	step_end

Movement_1BB891:: @ 81BB891
	walk_down
	walk_down
	step_end

Movement_1BB894:: @ 81BB894
	walk_right
	walk_up
	walk_up
	step_end

Movement_1BB898:: @ 81BB898
	walk_left
	walk_up
	walk_up
	step_end

Movement_1BB89C:: @ 81BB89C
	walk_up
	step_end

Movement_1BB89E:: @ 81BB89E
	face_left
	step_end

Movement_1BB8A0:: @ 81BB8A0
	face_right
	step_end

Movement_1BB8A2:: @ 81BB8A2
	walk_left
	walk_up
	walk_up
	walk_up
	step_end

gUnknown_81BB8A7:: @ 81BB8A7
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lockall
	fadescreen FADE_TO_BLACK
	setvar VAR_0x8004, 0
	special Special_BattleRecords
	waitstate
	releaseall
	end

gUnknown_81BB8C3:: @ 81BB8C3
UnknownMap_00_00_EventScript_1BB8C3:: @ 81BB8C3
	setvar VAR_0x8005, 0
	textcolor 3
	special sub_80819C8
	waitstate
	end

gUnknown_81BB8CF:: @ 81BB8CF
UnknownMap_00_00_EventScript_1BB8CF:: @ 81BB8CF
	setvar VAR_0x8005, 1
	textcolor 3
	special sub_80819C8
	waitstate
	end

gUnknown_81BB8DB:: @ 81BB8DB
UnknownMap_00_03_EventScript_1BB8DB:: @ 81BB8DB
	fadescreen FADE_TO_BLACK
	special sub_80A0334
	waitstate
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB94F
	setvar VAR_0x8005, 0
	textcolor 3
	special sub_80819C8
	waitstate
	end

gUnknown_81BB8F8:: @ 81BB8F8
UnknownMap_00_03_EventScript_1BB8F8:: @ 81BB8F8
	fadescreen FADE_TO_BLACK
	special sub_80A0334
	waitstate
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB94F
	setvar VAR_0x8005, 1
	textcolor 3
	special sub_80819C8
	waitstate
	end

gUnknown_81BB915:: @ 81BB915
UnknownMap_00_03_EventScript_1BB915:: @ 81BB915
	fadescreen FADE_TO_BLACK
	special sub_80A0334
	waitstate
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB94F
	setvar VAR_0x8005, 2
	textcolor 3
	special sub_80819C8
	waitstate
	end

gUnknown_81BB932:: @ 81BB932
UnknownMap_00_03_EventScript_1BB932:: @ 81BB932
	fadescreen FADE_TO_BLACK
	special sub_80A0334
	waitstate
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB94F
	setvar VAR_0x8005, 3
	textcolor 3
	special sub_80819C8
	waitstate
	end

EventScript_1BB94F:: @ 81BB94F
	end

gUnknown_81BB950:: @ 81BB950
UnknownMap_00_01_EventScript_1BB950:: @ 81BB950
	setvar VAR_0x8005, 0
	textcolor 3
	special sub_8081978
	waitstate
	end

gUnknown_81BB95C:: @ 81BB95C
UnknownMap_00_01_EventScript_1BB95C:: @ 81BB95C
	setvar VAR_0x8005, 1
	textcolor 3
	special sub_8081978
	waitstate
	end

EventScript_1BB968:: @ 81BB968
	setvar VAR_0x8005, 2
	textcolor 3
	special sub_8081978
	waitstate
	end

EventScript_1BB974:: @ 81BB974
	setvar VAR_0x8005, 3
	textcolor 3
	special sub_8081978
	waitstate
	end

gUnknown_81BB980:: @ 81BB980
UnknownMap_00_02_EventScript_1BB980:: @ 81BB980
	end

gUnknown_81BB981:: @ 81BB981
	textcolor 3
	msgbox Text_LookedAtPlayersTrainerCard
	fadescreen FADE_TO_BLACK
	special sp02A_crash_sound
	waitstate
	end

gUnknown_81BB992:: @ 81BB992
	textcolor 3
	msgbox Text_LookedAtPlayersTrainerCardColored
	fadescreen FADE_TO_BLACK
	special sp02A_crash_sound
	waitstate
	end

gUnknown_81BB9A3:: @ 81BB9A3
	textcolor 3
	msgbox Text_TrainerTooBusyToNotice
	closemessage
	end

UnknownMap_00_00_EventScript_1BB9AF:: @ 81BB9AF
	textcolor 3
	special sub_8069740
	msgbox Text_TakeSeatStartBattle
	special sub_8069768
	closemessage
	end

UnknownMap_00_01_EventScript_1BB9C1:: @ 81BB9C1
	textcolor 3
	special sub_8069740
	msgbox Text_TakeSeatStartTrade
	special sub_8069768
	closemessage
	end

UnknownMap_00_02_EventScript_1BB9D3:: @ 81BB9D3
	end

gUnknown_81BB9D4:: @ 81BB9D4
	textcolor 3
	msgbox Text_TerminateLinkIfYouLeaveRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_1BB9F0
	erasebox 0, 0, 29, 19
	releaseall
	end

EventScript_1BB9F0:: @ 81BB9F0
	textcolor 3
	messageautoscroll Text_1BC7E2
	waitmessage
	special sub_8081770
	end

gUnknown_81BB9FC:: @ 81BB9FC
	special sub_8081744
	special sub_807E704
	waitstate
	end

EventScript_1BBA04:: @ 81BBA04
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	goto_if_unset FLAG_SYS_POKEDEX_GET, EventScript_1BB877
	specialvar VAR_RESULT, Special_BadEggInParty
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BB867
	copyvar VAR_0x8007, VAR_LAST_TALKED
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1BBB60
	message Text_1BD65B
	waitmessage
	goto EventScript_1BBA51

EventScript_1BBA50:: @ 81BBA50
	end

EventScript_1BBA51:: @ 81BBA51
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBA94
	case 1, EventScript_1BB82F
	case 2, EventScript_1BBA88
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBA88:: @ 81BBA88
	message Text_1BD706
	waitmessage
	goto EventScript_1BBA51

EventScript_1BBA93:: @ 81BBA93
	end

EventScript_1BBA94:: @ 81BBA94
	call EventScript_1BBB1E
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB82F
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB82F
	msgbox gUnknown_81BD86A
	closemessage
	special sp000_heal_pokemon
	setvar VAR_0x8004, 6
	copyvar VAR_CABLE_CLUB_STATE, VAR_0x8004
	special HelpSystem_Disable
	call CableClub_EventScript_OpenUnionRoomBarrier
	special DrawWholeMapView
	playse SE_TK_KASYA
	delay 60
	applymovement VAR_LAST_TALKED, Movement_1BB88F
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB898
	waitmovement 0
	opendoor 5, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB89C
	waitmovement 0
	hideobject OBJ_EVENT_ID_PLAYER, MAP_UNKNOWN_MAP_00_00
	closedoor 5, 1
	waitdooranim
	special sub_811B15C
	special SetCableClubWarp
	warpteleport2 MAP_UNKNOWN_MAP_00_04, 255, 7, 11
	waitstate
	special UnionRoomSpecial
	waitstate
	end

EventScript_1BBB1E:: @ 81BBB1E
	specialvar VAR_RESULT, CountPartyNonEggMons
	compare VAR_RESULT, 2
	goto_if_lt EventScript_1BBB44
	specialvar VAR_RESULT, GetNameOfEnigmaBerryInPlayerParty
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BBB52
	setvar VAR_RESULT, 1
	return

EventScript_1BBB44:: @ 81BBB44
	msgbox gUnknown_81BCBC3
	goto EventScript_SetResultFalse

EventScript_1BBB51:: @ 81BBB51
	end

EventScript_1BBB52:: @ 81BBB52
	msgbox gUnknown_81BCC00
	goto EventScript_SetResultFalse

EventScript_1BBB5F:: @ 81BBB5F
	end

EventScript_1BBB60:: @ 81BBB60
	msgbox gUnknown_81BCC3A
	release
	return

EventScript_1BBB6A:: @ 81BBB6A
	lock
	faceplayer
	goto_if_unset FLAG_SYS_POKEDEX_GET, EventScript_1BB877
	msgbox gUnknown_81BDB85, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1BBB92
	msgbox gUnknown_81BDBF8
	release
	return

EventScript_1BBB92:: @ 81BBB92
	msgbox gUnknown_81BDEDF
	release
	return

EventScript_1BBB9C:: @ 81BBB9C
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	goto_if_unset FLAG_SYS_POKEDEX_GET, EventScript_1BB877
	specialvar VAR_RESULT, Special_BadEggInParty
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BB867
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1BB44A
	message Text_1BD28D
	waitmessage
	delay 15
	goto EventScript_1BBBE7

EventScript_1BBBE6:: @ 81BBBE6
	end

EventScript_1BBBE7:: @ 81BBBE7
	goto_if_unset FLAG_GOT_POWDER_JAR, EventScript_1BBC32
	multichoice 0, 0, MULTICHOICE_TRADE_COLOSSEUM_CRUSH, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBC69
	case 1, EventScript_1BBC97
	case 2, EventScript_1BBD35
	case 3, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBC32:: @ 81BBC32
	multichoice 0, 0, MULTICHOICE_TRADE_COLOSSEUM_2, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBC69
	case 1, EventScript_1BBC97
	case 2, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBC69:: @ 81BBC69
	msgbox gUnknown_81BD317, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1BB82F
	call EventScript_1BB79C
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB82F
	setvar VAR_0x8004, 3
	goto EventScript_1BBD6F

EventScript_1BBC96:: @ 81BBC96
	end

EventScript_1BBC97:: @ 81BBC97
	message Text_1BD338
	waitmessage
	multichoice 0, 0, MULTICHOICE_SINGLE_DOUBLE_MULTI_INFO_EXIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBCEA
	case 1, EventScript_1BBCF5
	case 2, EventScript_1BBD1C
	case 3, EventScript_1BBD27
	case 4, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBCEA:: @ 81BBCEA
	setvar VAR_0x8004, 0
	goto EventScript_1BBD6F

EventScript_1BBCF4:: @ 81BBCF4
	end

EventScript_1BBCF5:: @ 81BBCF5
	special CheckForAlivePartyMons
	compare VAR_RESULT, 0
	goto_if_ne EventScript_1BBD0E
	setvar VAR_0x8004, 1
	goto EventScript_1BBD6F

EventScript_1BBD0D:: @ 81BBD0D
	end

EventScript_1BBD0E:: @ 81BBD0E
	msgbox gUnknown_81BC409
	goto EventScript_1BBC97

EventScript_1BBD1B:: @ 81BBD1B
	end

EventScript_1BBD1C:: @ 81BBD1C
	setvar VAR_0x8004, 2
	goto EventScript_1BBD6F

EventScript_1BBD26:: @ 81BBD26
	end

EventScript_1BBD27:: @ 81BBD27
	msgbox gUnknown_81BD390
	goto EventScript_1BBC97

EventScript_1BBD34:: @ 81BBD34
	end

EventScript_1BBD35:: @ 81BBD35
	msgbox gUnknown_81BD362, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1BB82F
	special CheckHasAtLeastOneBerry
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BBD61
	setvar VAR_0x8004, 5
	goto EventScript_1BBD6F

EventScript_1BBD60:: @ 81BBD60
	end

EventScript_1BBD61:: @ 81BBD61
	msgbox gUnknown_81BCB81
	goto EventScript_1BBBE7

EventScript_1BBD6E:: @ 81BBD6E
	end

EventScript_1BBD6F:: @ 81BBD6F
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB82F
	switch VAR_0x8004
	case 3, EventScript_1BBDBC
	case 0, EventScript_1BBDBC
	case 1, EventScript_1BBDBC
	case 2, EventScript_1BBE50
	case 5, EventScript_1BBEE4
	end

EventScript_1BBDBC:: @ 81BBDBC
	textcolor 3
	message Text_1BD51B
	waitmessage
	call EventScript_1A6675
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBE28
	case 1, EventScript_1BBE00
	case 2, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBE00:: @ 81BBE00
	call EventScript_1BBF78
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if_eq EventScript_1BBDBC
	compare VAR_RESULT, 8
	goto_if_eq EventScript_1BBE00
	release
	return

EventScript_1BBE28:: @ 81BBE28
	call EventScript_1BBF80
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if_eq EventScript_1BBDBC
	compare VAR_RESULT, 8
	goto_if_eq EventScript_1BBE28
	release
	return

EventScript_1BBE50:: @ 81BBE50
	textcolor 3
	message Text_1BD582
	waitmessage
	call EventScript_1A6675
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBEBC
	case 1, EventScript_1BBE94
	case 2, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBE94:: @ 81BBE94
	call EventScript_1BBF78
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if_eq EventScript_1BBE50
	compare VAR_RESULT, 8
	goto_if_eq EventScript_1BBE94
	release
	return

EventScript_1BBEBC:: @ 81BBEBC
	call EventScript_1BBF80
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if_eq EventScript_1BBE50
	compare VAR_RESULT, 8
	goto_if_eq EventScript_1BBEBC
	release
	return

EventScript_1BBEE4:: @ 81BBEE4
	textcolor 3
	message Text_1BD5F1
	waitmessage
	call EventScript_1A6675
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBF50
	case 1, EventScript_1BBF28
	case 2, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBF28:: @ 81BBF28
	call EventScript_1BBF78
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if_eq EventScript_1BBEE4
	compare VAR_RESULT, 8
	goto_if_eq EventScript_1BBF28
	release
	return

EventScript_1BBF50:: @ 81BBF50
	call EventScript_1BBF80
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if_eq EventScript_1BBEE4
	compare VAR_RESULT, 8
	goto_if_eq EventScript_1BBF50
	release
	return

EventScript_1BBF78:: @ 81BBF78
	special HelpSystem_Disable
	special sub_8115A24
	waitstate
	return

EventScript_1BBF80:: @ 81BBF80
	special HelpSystem_Disable
	special BerryBlenderLinkJoinGroup
	waitstate
	return

EventScript_1BBF88:: @ 81BBF88
	messageautoscroll Text_1BC59E
	waitmessage
	delay 60
	closemessage
	copyvar VAR_0x8007, VAR_LAST_TALKED
	call CableClub_EventScript_OpenDirectCornerBarrier
	special DrawWholeMapView
	playse SE_TK_KASYA
	delay 60
	applymovement VAR_LAST_TALKED, Movement_1BB88F
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB898
	waitmovement 0
	opendoor 9, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB89C
	waitmovement 0
	hideobject OBJ_EVENT_ID_PLAYER, MAP_UNKNOWN_MAP_00_00
	closedoor 9, 1
	waitdooranim
	release
	waitstate
	end

gUnknown_81BBFD8:: @ 81BBFD8
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lockall
	goto_if_unset FLAG_SYS_POKEDEX_GET, EventScript_1BB881
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1BC016
	special HelpSystem_Disable
	fadescreen FADE_TO_BLACK
	special sub_814F1D4
	waitstate
	msgbox gUnknown_81BCA43
	special HelpSystem_Enable
	releaseall
	end

EventScript_1BC016:: @ 81BC016
	msgbox gUnknown_81BCA13
	releaseall
	end

CableClub_EventScript_OpenUnionRoomBarrier:: @ 81BC020
	setmetatile 5, 3, 709, 0
	return

CableClub_EventScript_CloseUnionRoomBarrier:: @ 81BC02A
	setmetatile 5, 3, 761, 1
	return

CableClub_EventScript_OpenDirectCornerBarrier:: @ 81BC034
	setmetatile 9, 3, 709, 0
	return

CableClub_EventScript_CloseDirectCornerBarrier:: @ 81BC03E
	setmetatile 9, 3, 761, 1
	return

CableClub_EventScript_OpenGameCornerBarrier:: @ 81BC048
	setmetatile 5, 3, 737, 0
	return

CableClub_EventScript_CloseGameCornerBarrier:: @ 81BC052
	setmetatile 5, 3, 759, 1
	return

CeladonCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
CeruleanCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
CinnabarIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
FiveIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
FourIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
FuchsiaCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
IndigoPlateau_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
LavenderTown_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
OneIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
PewterCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
Route10_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
Route4_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
SaffronCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
SevenIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
SixIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
ThreeIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
TwoIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
VermilionCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
ViridianCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
	special sub_811999C
	end

EventScript_1BC060:: @ 81BC060
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	message Text_1BCCFF
	waitmessage
	multichoice 0, 0, MULTICHOICE_POKEJUMP_DODRIO, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BC0B0
	case 1, EventScript_1BC0BA
	case 2, EventScript_1BC0C4
	case SCR_MENU_CANCEL, EventScript_1BC0C4
	end

EventScript_1BC0B0:: @ 81BC0B0
	msgbox gUnknown_81BCD4D
	release
	end

EventScript_1BC0BA:: @ 81BC0BA
	msgbox gUnknown_81BCE73
	release
	end

EventScript_1BC0C4:: @ 81BC0C4
	msgbox gUnknown_81BCF2E
	release
	end

EventScript_1BC0CE:: @ 81BC0CE
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	message Text_1BCF69
	waitmessage
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1BC29C
	delay 60
	special HelpSystem_Disable
	message Text_1BD02D
	waitmessage
	multichoice 0, 0, MULTICHOICE_POKEJUMP_DODRIO, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BC13A
	case 1, EventScript_1BC184
	case 2, EventScript_1BB83F
	case SCR_MENU_CANCEL, EventScript_1BB83F
	end

EventScript_1BC13A:: @ 81BC13A
	setvar VAR_0x8005, 0
	special sub_8149A18
	compare VAR_RESULT, 0
	goto_if_eq EventScript_NoEligiblePkmn
	msgbox gUnknown_81BD059
	setvar VAR_0x8005, 0
	special ChooseMonForWirelessMinigame
	waitstate
	compare VAR_0x8004, 6
	goto_if_ge EventScript_1BB83F
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB83F
	setvar VAR_0x8004, 4
	goto EventScript_1BC1CE

EventScript_1BC183:: @ 81BC183
	end

EventScript_1BC184:: @ 81BC184
	setvar VAR_0x8005, 1
	special sub_81537C0
	compare VAR_RESULT, 0
	goto_if_eq EventScript_NoEligiblePkmn
	msgbox gUnknown_81BD059
	setvar VAR_0x8005, 1
	special ChooseMonForWirelessMinigame
	waitstate
	compare VAR_0x8004, 6
	goto_if_ge EventScript_1BB83F
	call EventScript_AskSaveGame
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BB83F
	setvar VAR_0x8004, 6
	goto EventScript_1BC1CE

EventScript_1BC1CD:: @ 81BC1CD
	end

EventScript_1BC1CE:: @ 81BC1CE
	textcolor 3
	message Text_1BD5F1
	waitmessage
	call EventScript_1A6675
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BC23A
	case 1, EventScript_1BC212
	case 2, EventScript_1BB83F
	case SCR_MENU_CANCEL, EventScript_1BB83F
	end

EventScript_1BC212:: @ 81BC212
	call EventScript_1BBF78
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BC262
	compare VAR_RESULT, 5
	goto_if_eq EventScript_1BC1CE
	compare VAR_RESULT, 8
	goto_if_eq EventScript_1BC212
	release
	return

EventScript_1BC23A:: @ 81BC23A
	call EventScript_1BBF80
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BC262
	compare VAR_RESULT, 5
	goto_if_eq EventScript_1BC1CE
	compare VAR_RESULT, 8
	goto_if_eq EventScript_1BC23A
	release
	return

EventScript_1BC262:: @ 81BC262
	messageautoscroll Text_1BD080
	waitmessage
	delay 120
	closemessage
	copyvar VAR_0x8007, VAR_LAST_TALKED
	call CableClub_EventScript_OpenGameCornerBarrier
	special DrawWholeMapView
	playse SE_TK_KASYA
	delay 60
	applymovement VAR_LAST_TALKED, Movement_1BB88F
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB8A2
	waitmovement 0
	hideobject OBJ_EVENT_ID_PLAYER, MAP_UNKNOWN_MAP_00_00
	release
	waitstate
	end

EventScript_1BC29C:: @ 81BC29C
	msgbox gUnknown_81BCFE8
	release
	end

EventScript_NoEligiblePkmn:: @ 81BC2A6
	msgbox gUnknown_81BD0CF, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1BB83F
	compare VAR_0x8005, 0
	call_if_eq EventScript_1BC2D5
	compare VAR_0x8005, 1
	call_if_eq EventScript_1BC2DE
	goto EventScript_1BB83F

EventScript_1BC2D4:: @ 81BC2D4
	end

EventScript_1BC2D5:: @ 81BC2D5
	msgbox gUnknown_81BD14B
	return

EventScript_1BC2DE:: @ 81BC2DE
	msgbox gUnknown_81BD213
	return

TwoIsland_JoyfulGameCorner_EventScript_1BC2E7:: @ 81BC2E7
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lockall
	special sub_814B504
	waitstate
	releaseall
	end

TwoIsland_JoyfulGameCorner_EventScript_1BC2FC:: @ 81BC2FC
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lockall
	special sub_8153810
	waitstate
	releaseall
	end

gUnknown_81BC311:: @ 81BC311
	.string "Welcome to the POKéMON CABLE\n"
	.string "CLUB.\p"
	.string "Which of our services do you wish\n"
	.string "to use?$"

gUnknown_81BC35E:: @ 81BC35E
	.string "Which of our services do you wish\n"
	.string "to use?$"

Text_1BC388:: @ 81BC388
	.string "Trade POKéMON with another player\n"
	.string "using a GBA Game Link cable.$"

Text_1BC3C7:: @ 81BC3C7
	.string "You may battle another TRAINER\n"
	.string "using a GBA Game Link cable.$"

Text_1BC403:: @ 81BC403
	.string "おわります$"

gUnknown_81BC409:: @ 81BC409
	.string "For a DOUBLE BATTLE, you must\n"
	.string "have at least two POKéMON.$"

gUnknown_81BC442:: @ 81BC442
	.string "For trading, you must have at\n"
	.string "least two POKéMON with you.$"

gUnknown_81BC47C:: @ 81BC47C
	.string "A POKéMON holding the {STR_VAR_1}\n"
	.string "BERRY can't be traded.$"

gUnknown_81BC4AC:: @ 81BC4AC
	.string "Please wait.\n"
	.string "… … B Button: Cancel$"

gUnknown_81BC4CE:: @ 81BC4CE
	.string "When all players are ready…\n"
	.string "A Button: Confirm\l"
	.string "B Button: Cancel$"

gUnknown_81BC50D:: @ 81BC50D
	.string "Start link with {STR_VAR_1} players.\n"
	.string "A Button: Confirm\l"
	.string "B Button: Cancel$"

gUnknown_81BC54C:: @ 81BC54C
	.string "Awaiting linkup…\n"
	.string "… … B Button: Cancel$"

Text_1BC572:: @ 81BC572
	.string "はじめる　まえに　レポートを\n"
	.string "かきますが　よろしいですか？$"

Text_1BC590:: @ 81BC590
	.string "Please enter.$"

Text_1BC59E:: @ 81BC59E
	.string "I'll direct you to your room now.$"

gUnknown_81BC5C0:: @ 81BC5C0
	.string "Someone is not ready to link.\p"
	.string "Please come back after everyone\n"
	.string "has made preparations.$"

gUnknown_81BC615:: @ 81BC615
	.string "Sorry, we have a link error…\n"
	.string "Please reset and try again.$"

gUnknown_81BC64E:: @ 81BC64E
	.string "The link partners appear to have\n"
	.string "made different selections.$"

gUnknown_81BC68A:: @ 81BC68A
	.string "Please do visit again.$"

gUnknown_81BC6A1:: @ 81BC6A1
	.string "The number of participants is\n"
	.string "incorrect.$"

gUnknown_81BC6CA:: @ 81BC6CA
	.string "The SINGLE BATTLE Mode can't be\n"
	.string "played by {STR_VAR_1} players.$"

gUnknown_81BC700:: @ 81BC700
	.string "The DOUBLE BATTLE Mode can't be\n"
	.string "played by {STR_VAR_1} players.$"

gUnknown_81BC736:: @ 81BC736
	.string "There must be four players to play\n"
	.string "this Battle Mode.$"

gUnknown_81BC76B:: @ 81BC76B
	.string "Please confirm the number of\n"
	.string "players and start again.$"

Text_TerminateLinkIfYouLeaveRoom:: @ 81BC7A1
	.string "The link will be terminated if you\n"
	.string "leave the room. Is that okay?$"

Text_1BC7E2:: @ 81BC7E2
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

Text_1BC906:: @ 81BC906
	.string "ごりよう　ありがとう　ございました$"

Text_1BC918:: @ 81BC918
	.string "The TRAINER CARD data will\n"
	.string "be overwritten.$"

Text_1BC943:: @ 81BC943
	.string "I hope to see you again!$"

gUnknown_81BC95C:: @ 81BC95C
	.string "I'm awfully sorry.\p"
	.string "We're not set up to conduct trades\n"
	.string "with TRAINERS far away in another\l"
	.string "region yet…$"

gUnknown_81BC9C0:: @ 81BC9C0
	.string "The other TRAINER is not ready.$"

gUnknown_81BC9E0:: @ 81BC9E0
	.string "You have at least one POKéMON\n"
	.string "that can't be taken.$"

gUnknown_81BCA13:: @ 81BCA13
	.string "The Wireless Adapter is not\n"
	.string "connected properly.$"

gUnknown_81BCA43:: @ 81BCA43
	.string "Participants are asked to step up\n"
	.string "to the reception counter.$"

Text_1BCA7F:: @ 81BCA7F
	.string "こんにちは！$"

Text_1BCA86:: @ 81BCA86
	.string "しょうしょう　おまちください$"

Text_1BCA95:: @ 81BCA95
	.string "You may trade your POKéMON here\n"
	.string "with another TRAINER.$"

Text_1BCACB:: @ 81BCACB
	.string "You may battle with your friends\n"
	.string "here.$"

Text_1BCAF2:: @ 81BCAF2
	.string "Two to five TRAINERS can make\n"
	.string "BERRY POWDER together.$"

Text_1BCB27:: @ 81BCB27
	.string "ワイヤレス　クラブでの\n"
	.string "あそびかたを　せつめいします$"

Text_1BCB42:: @ 81BCB42
	.string "Cancels the selected MENU item.$"

Text_1BCB62:: @ 81BCB62
	.string "どちらの　しょうぶに　しますか？$"

Text_1BCB73:: @ 81BCB73
	.string "ひとつ　まえに　もどります$"

gUnknown_81BCB81:: @ 81BCB81
	.string "To use the BERRY CRUSH service,\n"
	.string "you must have at least one BERRY.$"

gUnknown_81BCBC3:: @ 81BCBC3
	.string "To enter the UNION ROOM, you must\n"
	.string "have at least two POKéMON.$"

gUnknown_81BCC00:: @ 81BCC00
	.string "No POKéMON holding the {STR_VAR_1}\n"
	.string "BERRY may enter the UNION ROOM.$"

gUnknown_81BCC3A:: @ 81BCC3A
	.string "This is the POKéMON WIRELESS CLUB\n"
	.string "UNION ROOM.\p"
	.string "Unfortunately, your Wireless\n"
	.string "Adapter is not connected properly.\p"
	.string "Please do come again.$"

Text_1BCCBE:: @ 81BCCBE
	.string "あ‥‥\n"
	.string "おきゃくさま！$"

Text_PlayerIsPlayingRightNowGoForIt:: @ 81BCCCA
	.string "It appears as if {STR_VAR_1} is playing\n"
	.string "right now.\l"
	.string "Go for it!$"

Text_1BCCFF:: @ 81BCCFF
	.string "I can explain game rules to you,\n"
	.string "if you'd like.\p"
	.string "Which game should I describe?$"

gUnknown_81BCD4D:: @ 81BCD4D
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

gUnknown_81BCE73:: @ 81BCE73
	.string "“DODRIO BERRY-PICKING”\p"
	.string "Command DODRIO's three heads to\n"
	.string "catch falling BERRIES.\p"
	.string "Press right, up, or left on the\n"
	.string "{PLUS} Control Pad to move the heads.\p"
	.string "To play this game, you must have\n"
	.string "a DODRIO.$"

gUnknown_81BCF2E:: @ 81BCF2E
	.string "If you want to play a game,\n"
	.string "please tell the man beside me.$"

Text_1BCF69:: @ 81BCF69
	.string "Hi, welcome!\n"
	.string "You can play games over the\l"
	.string "Wireless Communication System.\p"
	.string "Can you wait just a little bit?$"

gUnknown_81BCFD1:: @ 81BCFD1
	.string "All right, come again!$"

gUnknown_81BCFE8:: @ 81BCFE8
	.string "The Wireless Adapter isn't\n"
	.string "connected.\p"
	.string "Come back when it's hooked up!$"

Text_1BD02D:: @ 81BD02D
	.string "All right, which game did you want\n"
	.string "to play?$"

gUnknown_81BD059:: @ 81BD059
	.string "Which POKéMON would you like to\n"
	.string "enter?$"

Text_1BD080:: @ 81BD080
	.string "Okay, you're all good to go.\n"
	.string "Don't let the others beat you!$"

Text_1BD0BC:: @ 81BD0BC
	.string "きょうは　けえるのか？\n"
	.string "またこいよ！$"

gUnknown_81BD0CF:: @ 81BD0CF
	.string "It doesn't look like you have any\n"
	.string "POKéMON that you can enter…\p"
	.string "Would you like me to explain what\n"
	.string "kinds of POKéMON can enter?$"

gUnknown_81BD14B:: @ 81BD14B
	.string "“POKéMON JUMP” is open to POKéMON\n"
	.string "around 28 inches or less.\p"
	.string "What you can't enter are those\n"
	.string "POKéMON that can't jump.\p"
	.string "You know, like POKéMON that only\n"
	.string "swim, burrow, or fly.\p"
	.string "That's all you need to know.$"

gUnknown_81BD213:: @ 81BD213
	.string "“DODRIO BERRY-PICKING”…\n"
	.string "Well, the name says it all.\p"
	.string "You have to have a DODRIO to play\n"
	.string "this game.$"

Text_1BD274:: @ 81BD274
	.string "もういちど　はじめから\n"
	.string "やりなおして　みて　くれ$"

Text_1BD28D:: @ 81BD28D
	.string "Welcome to the POKéMON WIRELESS\n"
	.string "CLUB DIRECT CORNER.\p"
	.string "You may interact directly with\n"
	.string "your friends here.\p"
	.string "Which room would you like to\n"
	.string "enter?$"

gUnknown_81BD317:: @ 81BD317
	.string "Would you like to trade POKéMON?$"

Text_1BD338:: @ 81BD338
	.string "Which Battle Mode would you like\n"
	.string "to play?$"

gUnknown_81BD362:: @ 81BD362
	.string "Would you like to use the\n"
	.string "BERRY CRUSH System?$"

gUnknown_81BD390:: @ 81BD390
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

Text_1BD51B:: @ 81BD51B
	.string "Please decide which of you two\n"
	.string "will become the LEADER.\p"
	.string "The other player must then choose\n"
	.string "“JOIN GROUP.”$"

Text_1BD582:: @ 81BD582
	.string "Please decide which of you four\n"
	.string "will become the GROUP LEADER.\p"
	.string "The other players must then choose\n"
	.string "“JOIN GROUP.”$"

Text_1BD5F1:: @ 81BD5F1
	.string "Please decide which of you will\n"
	.string "become the GROUP LEADER.\p"
	.string "The other players must then choose\n"
	.string "“JOIN GROUP.”$"

Text_1BD65B:: @ 81BD65B
	.string "Welcome to the POKéMON WIRELESS\n"
	.string "CLUB UNION ROOM.\p"
	.string "You may interact directly with\n"
	.string "other TRAINERS here, some of\l"
	.string "whom you may not even know.\p"
	.string "Would you like to enter the ROOM?$"

Text_1BD706:: @ 81BD706
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

gUnknown_81BD86A:: @ 81BD86A
	.string "I hope you enjoy your time in\n"
	.string "the UNION ROOM.$"

gUnknown_81BD898:: @ 81BD898
	.string "Hello!\n"
	.string "My name is TEALA.\p"
	.string "This must be your first time\n"
	.string "up here.\p"
	.string "I'll show you how the Wireless\n"
	.string "Communication System works.\p"
	.string "First, I need to show you this\n"
	.string "floor of our POKéMON CENTER.\p"
	.string "Right this way, please.$"

gUnknown_81BD966:: @ 81BD966
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

gUnknown_81BDB85:: @ 81BDB85
	.string "Hello, {PLAYER}!\p"
	.string "It's me, TEALA, the POKéMON\n"
	.string "CENTER 2F attendant.\p"
	.string "Is there something you needed to\n"
	.string "ask me about linking?$"

gUnknown_81BDBF8:: @ 81BDBF8
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

gUnknown_81BDEDF:: @ 81BDEDF
	.string "I hope you enjoy the Wireless\n"
	.string "Communication System.$"
