FuchsiaCity_SafariZone_Entrance_MapScripts:: @ 816D2A8
	map_script MAP_SCRIPT_ON_FRAME_TABLE, FuchsiaCity_SafariZone_Entrance_OnFrame
	.byte 0

FuchsiaCity_SafariZone_Entrance_OnFrame:: @ 816D2AE
	map_script_2 VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 1, FuchsiaCity_SafariZone_Entrance_EventScript_ExitWarpIn
	map_script_2 VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 2, FuchsiaCity_SafariZone_Entrance_EventScript_ExitEarly
	map_script_2 VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 3, FuchsiaCity_SafariZone_Entrance_EventScript_ExitWalkIn
	.2byte 0

@ When player runs out of balls mid-battle
FuchsiaCity_SafariZone_Entrance_EventScript_ExitWalkIn:: @ 816D2C8
	lockall
	textcolor 0
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_ApproachCounter
	waitmovement 0
	msgbox FuchsiaCity_SafariZone_Entrance_Text_CatchFairShareComeAgain
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_Exit2
	waitmovement 0
	special ExitSafariMode
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0
	releaseall
	end

@ When player runs of out balls after catching a pokemon, or runs out of steps
FuchsiaCity_SafariZone_Entrance_EventScript_ExitWarpIn:: @ 816D2F2
	lockall
	textcolor 0
	msgbox FuchsiaCity_SafariZone_Entrance_Text_CatchFairShareComeAgain
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_Exit
	waitmovement 0
	special ExitSafariMode
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0
	releaseall
	end

@ When player re-enters the entrance building with balls/steps remaining
FuchsiaCity_SafariZone_Entrance_EventScript_ExitEarly:: @ 816D312
	lockall
	textcolor 0
	msgbox FuchsiaCity_SafariZone_Entrance_Text_GoingToLeaveSafariZoneEarly, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq FuchsiaCity_SafariZone_Entrance_EventScript_ReturnToSafariZone
	msgbox FuchsiaCity_SafariZone_Entrance_Text_PleaseReturnSafariBalls
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_Exit
	waitmovement 0
	special ExitSafariMode
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0
	releaseall
	end

FuchsiaCity_SafariZone_Entrance_EventScript_ReturnToSafariZone:: @ 816D345
	msgbox FuchsiaCity_SafariZone_Entrance_Text_GoodLuck
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_ReEnter
	waitmovement 0
	warp MAP_SAFARI_ZONE_CENTER, 255, 26, 30
	waitstate
	end

FuchsiaCity_SafariZone_Entrance_Movement_Exit:: @ 816D362
	walk_down
	walk_down
	step_end

FuchsiaCity_SafariZone_Entrance_Movement_ReEnter:: @ 816D365
	walk_up
	step_end

FuchsiaCity_SafariZone_Entrance_Movement_Exit2:: @ 816D367
	walk_down
	walk_down
	step_end

FuchsiaCity_SafariZone_Entrance_Movement_ApproachCounter:: @ 816D36A
	walk_down
	delay_8
	step_end

FuchsiaCity_SafariZone_Entrance_EventScript_EntryTriggerMid:: @ 816D36D
	lockall
	setvar VAR_TEMP_2, 0
	goto FuchsiaCity_SafariZone_Entrance_EventScript_AskEnterSafariZone
	end

FuchsiaCity_SafariZone_Entrance_EventScript_EntryTriggerRight:: @ 816D379
	lockall
	setvar VAR_TEMP_2, 1
	goto FuchsiaCity_SafariZone_Entrance_EventScript_AskEnterSafariZone
	end

FuchsiaCity_SafariZone_Entrance_EventScript_EntryTriggerLeft:: @ 816D385
	lockall
	setvar VAR_TEMP_2, 2
	goto FuchsiaCity_SafariZone_Entrance_EventScript_AskEnterSafariZone
	end

FuchsiaCity_SafariZone_Entrance_EventScript_AskEnterSafariZone:: @ 816D391
	textcolor 0
	msgbox FuchsiaCity_SafariZone_Entrance_Text_WelcomeToSafariZone
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestRight
	waitmovement 0
	showmoneybox 0, 0, 0
	msgbox FuchsiaCity_SafariZone_Entrance_Text_PlaySafariGameFor500, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq FuchsiaCity_SafariZone_Entrance_EventScript_TryEnterSafariZone
	msgbox FuchsiaCity_SafariZone_Entrance_Text_OkayPleaseComeAgain
	goto FuchsiaCity_SafariZone_Entrance_EventScript_ForcePlayerBack
	end

FuchsiaCity_SafariZone_Entrance_EventScript_TryEnterSafariZone:: @ 816D3CA
	call FuchsiaCity_SafariZone_Entrance_EventScript_CheckSpaceForMons
	checkmoney 500, 0
	compare VAR_RESULT, FALSE
	goto_if_eq FuchsiaCity_SafariZone_Entrance_EventScript_NotEnoughMoney
	removemoney 500, 0
	updatemoneybox 0, 0, 0
	msgbox FuchsiaCity_SafariZone_Entrance_Text_ThatllBe500WeOnlyUseSpecialBalls
	textcolor 3
	playfanfare MUS_LEVEL_UP
	message FuchsiaCity_SafariZone_Entrance_Text_PlayerReceived30SafariBalls
	waitfanfare
	call EventScript_RestorePrevTextColor
	msgbox FuchsiaCity_SafariZone_Entrance_Text_CallYouOnPAWhenYouRunOut
	closemessage
	hidemoneybox 0, 0
	compare VAR_TEMP_2, 0
	call_if_eq FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneMid
	compare VAR_TEMP_2, 1
	call_if_eq FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneRight
	compare VAR_TEMP_2, 2
	call_if_eq FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneLeft
	special EnterSafariMode
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 2
	warp MAP_SAFARI_ZONE_CENTER, 255, 26, 30
	waitstate
	end

FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneRight:: @ 816D441
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneRight
	waitmovement 0
	return

FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneMid:: @ 816D44C
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneMid
	waitmovement 0
	return

FuchsiaCity_SafariZone_Entrance_EventScript_EnterSafariZoneLeft:: @ 816D457
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneLeft
	waitmovement 0
	return

FuchsiaCity_SafariZone_Entrance_EventScript_CheckSpaceForMons:: @ 816D462
	getpartysize
	compare VAR_RESULT, PARTY_SIZE
	goto_if_ne EventScript_Return
	specialvar VAR_RESULT, IsThereRoomInAnyBoxForMorePokemon
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_Return
	msgbox SafariZone_Text_ExcuseMeYourPCBoxIsFull
	goto FuchsiaCity_SafariZone_Entrance_EventScript_ForcePlayerBack
	end

FuchsiaCity_SafariZone_Entrance_EventScript_NotEnoughMoney:: @ 816D48C
	msgbox FuchsiaCity_SafariZone_Entrance_Text_OopsNotEnoughMoney
	goto FuchsiaCity_SafariZone_Entrance_EventScript_ForcePlayerBack
	end

FuchsiaCity_SafariZone_Entrance_EventScript_ForcePlayerBack:: @ 816D49A
	closemessage
	hidemoneybox 0, 0
	applymovement OBJ_EVENT_ID_PLAYER, FuchsiaCity_SafariZone_Entrance_Movement_ForceBack
	waitmovement 0
	releaseall
	end

FuchsiaCity_SafariZone_Entrance_Movement_ForceBack:: @ 816D4AA
	walk_down
	step_end

FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneMid:: @ 816D4AC
	walk_up
	walk_up
	step_end

FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneRight:: @ 816D4AF
	walk_up
	walk_left
	walk_up
	step_end

FuchsiaCity_SafariZone_Entrance_Movement_EnterSafariZoneLeft:: @ 816D4B3
	walk_up
	walk_right
	walk_up
	step_end

FuchsiaCity_SafariZone_Entrance_EventScript_InfoAttendant:: @ 816D4B7
	lock
	faceplayer
	msgbox FuchsiaCity_SafariZone_Entrance_Text_FirstTimeAtSafariZone, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq FuchsiaCity_SafariZone_Entrance_EventScript_ExplainSafariZone
	msgbox FuchsiaCity_SafariZone_Entrance_Text_SorryYoureARegularHere
	release
	end

FuchsiaCity_SafariZone_Entrance_EventScript_ExplainSafariZone:: @ 816D4D6
	msgbox FuchsiaCity_SafariZone_Entrance_Text_ExplainSafariZone
	release
	end
