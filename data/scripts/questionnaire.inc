EventScript_Questionnaire:: @ 81A7702
	lockall
	textcolor 3
	msgbox Text_FillOutQuestionnaire, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_DeclineQuestionnaire
	setvar VAR_0x8004, EASY_CHAT_TYPE_QUESTIONNAIRE
	call Common_ShowEasyChatScreen
	lock
	faceplayer
	specialvar VAR_0x8008, GetMartClerkObjectId
	textcolor 0
	compare VAR_0x8004, 0
	goto_if_eq EventScript_EnableMysteryGift
	compare VAR_RESULT, 0
	goto_if_eq EventScript_DeclineQuestionnaire
	compare VAR_RESULT, 1
	goto_if_eq EventScript_TookQuestionnaire
	end

EventScript_EnableMysteryGift:: @ 81A774D
	applymovement VAR_0x8008, Movement_FaceDown
	waitmovement 0
	playse SE_PIN
	applymovement VAR_0x8008, Movement_ExclamationMark
	waitmovement 0
	applymovement VAR_0x8008, Movement_Delay48
	waitmovement 0
	msgbox Text_YouKnowThoseWords
	setflag FLAG_SYS_MYSTERY_GIFT_ENABLED
	textcolor 3
	special DisableMsgBoxWalkaway
	signmsg
	msgbox Text_YouCanAccessMysteryGift
	normalmsg
	releaseall
	end

EventScript_DeclineQuestionnaire:: @ 81A778A
	releaseall
	end

EventScript_TookQuestionnaire:: @ 81A778C
	applymovement VAR_0x8008, Movement_FaceDown
	waitmovement 0
	msgbox Text_QuestionnaireThankYou
	releaseall
	end
