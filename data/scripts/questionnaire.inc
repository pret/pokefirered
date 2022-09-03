EventScript_Questionnaire::
	lockall
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox Text_FillOutQuestionnaire, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, EventScript_DeclineQuestionnaire
	setvar VAR_0x8004, EASY_CHAT_TYPE_QUESTIONNAIRE
	call Common_ShowEasyChatScreen
	lock
	faceplayer
	specialvar VAR_0x8008, GetMartClerkObjectId
	textcolor NPC_TEXT_COLOR_MALE
	goto_if_eq VAR_0x8004, 0, EventScript_EnableMysteryGift
	goto_if_eq VAR_RESULT, 0, EventScript_DeclineQuestionnaire
	goto_if_eq VAR_RESULT, 1, EventScript_TookQuestionnaire
	end

EventScript_EnableMysteryGift::
	applymovement VAR_0x8008, Common_Movement_FaceDown
	waitmovement 0
	playse SE_PIN
	applymovement VAR_0x8008, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement VAR_0x8008, Common_Movement_Delay48
	waitmovement 0
	msgbox Text_YouKnowThoseWords
	setflag FLAG_SYS_MYSTERY_GIFT_ENABLED
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special DisableMsgBoxWalkaway
	signmsg
	msgbox Text_YouCanAccessMysteryGift
	normalmsg
	releaseall
	end

EventScript_DeclineQuestionnaire::
	releaseall
	end

EventScript_TookQuestionnaire::
	applymovement VAR_0x8008, Common_Movement_FaceDown
	waitmovement 0
	msgbox Text_QuestionnaireThankYou
	releaseall
	end
