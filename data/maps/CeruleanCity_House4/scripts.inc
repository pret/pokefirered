.set LOCALID_WONDER_NEWS_BERRY_MAN, 1

CeruleanCity_House4_MapScripts:: @ 816ACEE
	.byte 0

CeruleanCity_House4_EventScript_WonderNewsBerryMan:: @ 816ACEF
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	specialvar VAR_0x8004, GetMENewsJisanItemAndState
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_0x8004, 0
	goto_if_eq CeruleanCity_House4_EventScript_NoNews
	compare VAR_0x8004, 1
	goto_if_eq CeruleanCity_House4_EventScript_News1
	compare VAR_0x8004, 2
	goto_if_eq CeruleanCity_House4_EventScript_News2
	compare VAR_0x8004, 3
	goto_if_eq CeruleanCity_House4_EventScript_NewsNotSpread
	compare VAR_0x8004, 4
	goto_if_eq CeruleanCity_House4_EventScript_NewsSpread1
	compare VAR_0x8004, 5
	goto_if_eq CeruleanCity_House4_EventScript_NewsSpread2
	compare VAR_0x8004, 6
	goto_if_eq CeruleanCity_House4_EventScript_NewsDone
	end

CeruleanCity_House4_EventScript_NoNews:: @ 816AD59
	msgbox CeruleanCity_House4_Text_NothingEntertaining
	release
	end

CeruleanCity_House4_EventScript_News1:: @ 816AD63
	call CeruleanCity_House4_EventScript_MovementReactionToNews
	msgbox CeruleanCity_House4_Text_NewNewsInformativeHaveThis
	giveitem VAR_0x8008
	compare VAR_RESULT, FALSE
	goto_if_eq CeruleanCity_House4_EventScript_NoRoomForBerries
	release
	end

CeruleanCity_House4_EventScript_News2:: @ 816AD89
	call CeruleanCity_House4_EventScript_MovementReactionToNews
	msgbox CeruleanCity_House4_Text_IncredibleNewsHaveBerries
	giveitem VAR_0x8008, 4
	compare VAR_RESULT, FALSE
	goto_if_eq CeruleanCity_House4_EventScript_NoRoomForBerries
	release
	end

CeruleanCity_House4_EventScript_NewsNotSpread:: @ 816ADAF
	applymovement LOCALID_WONDER_NEWS_BERRY_MAN, Movement_FacePlayer
	waitmovement 0
	msgbox CeruleanCity_House4_Text_WishCouldShareNewsWithOthers
	release
	end

CeruleanCity_House4_EventScript_NewsSpread1:: @ 816ADC3
	call CeruleanCity_House4_EventScript_MovementReactionToNews
	msgbox CeruleanCity_House4_Text_ThanksForSpreadingNewsTakeThis
	giveitem VAR_0x8008
	compare VAR_RESULT, FALSE
	goto_if_eq CeruleanCity_House4_EventScript_NoRoomForBerries
	release
	end

CeruleanCity_House4_EventScript_NewsSpread2:: @ 816ADE9
	call CeruleanCity_House4_EventScript_MovementReactionToNews
	msgbox CeruleanCity_House4_Text_MagnificentNewsSpreadHaveBerries
	giveitem VAR_0x8008, 4
	compare VAR_RESULT, FALSE
	goto_if_eq CeruleanCity_House4_EventScript_NoRoomForBerries
	release
	end

CeruleanCity_House4_EventScript_NewsDone:: @ 816AE0F
	applymovement LOCALID_WONDER_NEWS_BERRY_MAN, Movement_FacePlayer
	waitmovement 0
	msgbox CeruleanCity_House4_Text_EnjoyingMyselfWithAllSortsOfNews
	release
	end

CeruleanCity_House4_EventScript_MovementReactionToNews:: @ 816AE23
	playse SE_PIN
	applymovement LOCALID_WONDER_NEWS_BERRY_MAN, Movement_ExclamationMark
	waitmovement 0
	applymovement LOCALID_WONDER_NEWS_BERRY_MAN, Movement_FacePlayer
	waitmovement 0
	applymovement LOCALID_WONDER_NEWS_BERRY_MAN, Movement_Delay48
	waitmovement 0
	return

CeruleanCity_House4_EventScript_NoRoomForBerries:: @ 816AE45
	msgbox CeruleanCity_House4_Text_YourBerryPouchIsFull
	release
	end
