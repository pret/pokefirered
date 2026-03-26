.equ LOCALID_DAYCARE_MAN, 1

Route5_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, Route5_OnTransition
	.byte 0

Route5_OnTransition::
	call Route5_EventScript_TrySetDayCareManPos
	end

Route5_EventScript_TrySetDayCareManPos::
	goto_if_unset FLAG_PENDING_DAYCARE_EGG, Route5_EventScript_EndSetDayCareManPos
	setobjectxyperm LOCALID_DAYCARE_MAN, 22, 26
Route5_EventScript_EndSetDayCareManPos::
	return

Route5_EventScript_DaycareMan::
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	special GetDaycareMonNicknames
	specialvar VAR_RESULT, GetDaycareState
	goto_if_eq VAR_RESULT, DAYCARE_EGG_WAITING, Route5_EventScript_DaycareEggWaiting
	goto_if_eq VAR_RESULT, DAYCARE_ONE_MON, Route5_EventScript_CheckOnOneMon
	goto_if_eq VAR_RESULT, DAYCARE_TWO_MONS, Route5_EventScript_CheckOnTwoMons
	msgbox Route5_Text_DaycareManIntro
	release
	end

Route5_EventScript_DaycareEggWaiting::
	msgbox DayCare_Text_DoYouWantEgg, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, YES, Route5_EventScript_DaycareAcceptEgg
	msgbox DayCare_Text_IWillKeepDoYouWantIt, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, YES, Route5_EventScript_DaycareAcceptEgg
	msgbox DayCare_Text_IllKeepIt
	clearflag FLAG_PENDING_DAYCARE_EGG
	special RejectEggFromDayCare
	release
	end

Route5_EventScript_DaycareAcceptEgg::
	specialvar VAR_RESULT, CalculatePlayerPartyCount
	goto_if_ne VAR_RESULT, PARTY_SIZE, Route5_EventScript_DaycareReceivedEgg
	msgbox DayCare_Text_YouHaveNoRoomForIt
	release
	end

Route5_EventScript_DaycareReceivedEgg::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	message DayCare_Text_ReceivedEgg
	call EventScript_RestorePrevTextColor
	playfanfare MUS_LEVEL_UP
	waitfanfare
	waitbuttonpress
	msgbox DayCare_Text_TakeGoodCareOfIt
	special GiveEggFromDaycare
	clearflag FLAG_PENDING_DAYCARE_EGG
	release
	end

Route5_EventScript_CheckOnOneMon::
	special GetDaycareMonNicknames
	msgbox DayCare_Text_YourMonIsDoingFine
	release
	end

Route5_EventScript_CheckOnTwoMons::
	special GetDaycareMonNicknames
	msgbox DayCare_Text_YourMonsAreDoingFine
	special SetDaycareCompatibilityString
	special ShowFieldMessageStringVar4
	waitmessage
	waitbuttonpress
	release
	end

Route5_EventScript_UndergroundPathSign::
	msgbox Route5_Text_UndergroundPathSign, MSGBOX_SIGN
	end
