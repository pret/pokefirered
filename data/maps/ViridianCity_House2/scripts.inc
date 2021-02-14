.set LOCALID_WOMAN, 1
.set LOCALID_LASS,  2

ViridianCity_House2_MapScripts:: @ 816A07C
	.byte 0

ViridianCity_House2_EventScript_Lass:: @ 816A07D
	lock
	faceplayer
	msgbox ViridianCity_House2_Text_TryingToMemorizeNotes
	closemessage
	applymovement LOCALID_LASS, Movement_WalkInPlaceFastestUp
	waitmovement 0
	release
	end

ViridianCity_House2_EventScript_Woman:: @ 816A094
	lock
	faceplayer
	msgbox ViridianCity_House2_Text_ReadBlackboardCarefully
	closemessage
	applymovement LOCALID_WOMAN, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

ViridianCity_House2_EventScript_Notebook:: @ 816A0AB
	lockall
	msgbox ViridianCity_House2_Text_NotebookFirstPage
	msgbox ViridianCity_House2_Text_TurnThePage, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq ViridianCity_House2_EventScript_StopReadingNotebook
	msgbox ViridianCity_House2_Text_NotebookSecondPage
	msgbox ViridianCity_House2_Text_TurnThePage, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq ViridianCity_House2_EventScript_StopReadingNotebook
	msgbox ViridianCity_House2_Text_NotebookThirdPage
	msgbox ViridianCity_House2_Text_TurnThePage, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq ViridianCity_House2_EventScript_StopReadingNotebook
	msgbox ViridianCity_House2_Text_NotebookFourthPage
	applymovement LOCALID_LASS, Movement_WalkInPlaceFastestUp
	waitmovement 0
	textcolor 1
	msgbox ViridianCity_House2_Text_HeyDontLookAtMyNotes
	releaseall
	end

ViridianCity_House2_EventScript_StopReadingNotebook:: @ 816A11B
	releaseall
	end

ViridianCity_House2_EventScript_Blackboard:: @ 816A11D
	lockall
	msgbox ViridianCity_House2_Text_BlackboardListsStatusProblems
	goto ViridianCity_House2_EventScript_ChooseBlackboardTopic
	end

ViridianCity_House2_EventScript_ChooseBlackboardTopic:: @ 816A12C
	message ViridianCity_House2_Text_ReadWhichTopic
	waitmessage
	multichoicegrid 7, 1, MULTICHOICE_TRAINER_SCHOOL_WHITEBOARD, 3, FALSE
	switch VAR_RESULT
	case 0, ViridianCity_House2_EventScript_ReadSleep
	case 1, ViridianCity_House2_EventScript_ReadPoison
	case 2, ViridianCity_House2_EventScript_ReadParalysis
	case 3, ViridianCity_House2_EventScript_ReadBurn
	case 4, ViridianCity_House2_EventScript_ReadFreeze
	case 5, ViridianCity_House2_EventScript_ExitBlackboard
	case 127, ViridianCity_House2_EventScript_ExitBlackboard
	end

ViridianCity_House2_EventScript_ReadSleep:: @ 816A18B
	msgbox ViridianCity_House2_Text_ExplainSleep
	goto ViridianCity_House2_EventScript_ChooseBlackboardTopic
	end

ViridianCity_House2_EventScript_ReadBurn:: @ 816A199
	msgbox ViridianCity_House2_Text_ExplainBurn
	goto ViridianCity_House2_EventScript_ChooseBlackboardTopic
	end

ViridianCity_House2_EventScript_ReadPoison:: @ 816A1A7
	msgbox ViridianCity_House2_Text_ExplainPoison
	goto ViridianCity_House2_EventScript_ChooseBlackboardTopic
	end

ViridianCity_House2_EventScript_ReadFreeze:: @ 816A1B5
	msgbox ViridianCity_House2_Text_ExplainFreeze
	goto ViridianCity_House2_EventScript_ChooseBlackboardTopic
	end

ViridianCity_House2_EventScript_ReadParalysis:: @ 816A1C3
	msgbox ViridianCity_House2_Text_ExplainParalysis
	goto ViridianCity_House2_EventScript_ChooseBlackboardTopic
	end

ViridianCity_House2_EventScript_ExitBlackboard:: @ 816A1D1
	releaseall
	end
