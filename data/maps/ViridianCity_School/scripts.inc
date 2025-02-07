# 1 "data/maps/ViridianCity_School/scripts.pory"

# 2 "data/maps/ViridianCity_School/scripts.pory"
.set LOCALID_WOMAN, 1
# 3 "data/maps/ViridianCity_School/scripts.pory"
.set LOCALID_LASS,  2
# 4 "data/maps/ViridianCity_School/scripts.pory"

# 5 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_MapScripts::
# 6 "data/maps/ViridianCity_School/scripts.pory"
	.byte 0
# 7 "data/maps/ViridianCity_School/scripts.pory"

# 8 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_Lass::
# 9 "data/maps/ViridianCity_School/scripts.pory"
	lock
# 10 "data/maps/ViridianCity_School/scripts.pory"
	faceplayer
# 11 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_TryingToMemorizeNotes
# 12 "data/maps/ViridianCity_School/scripts.pory"
	closemessage
# 13 "data/maps/ViridianCity_School/scripts.pory"
	applymovement LOCALID_LASS, Common_Movement_WalkInPlaceFasterUp
# 14 "data/maps/ViridianCity_School/scripts.pory"
	waitmovement 0
# 15 "data/maps/ViridianCity_School/scripts.pory"
	release
# 16 "data/maps/ViridianCity_School/scripts.pory"
	end
# 17 "data/maps/ViridianCity_School/scripts.pory"

# 18 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_Woman::
# 19 "data/maps/ViridianCity_School/scripts.pory"
	lock
# 20 "data/maps/ViridianCity_School/scripts.pory"
	faceplayer
# 21 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_ReadBlackboardCarefully
# 22 "data/maps/ViridianCity_School/scripts.pory"
	closemessage
# 23 "data/maps/ViridianCity_School/scripts.pory"
	applymovement LOCALID_WOMAN, Common_Movement_FaceOriginalDirection
# 24 "data/maps/ViridianCity_School/scripts.pory"
	waitmovement 0
# 25 "data/maps/ViridianCity_School/scripts.pory"
	release
# 26 "data/maps/ViridianCity_School/scripts.pory"
	end
# 27 "data/maps/ViridianCity_School/scripts.pory"

# 28 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_Notebook::
# 29 "data/maps/ViridianCity_School/scripts.pory"
	lockall
# 30 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_NotebookFirstPage
# 31 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_TurnThePage, MSGBOX_YESNO
# 32 "data/maps/ViridianCity_School/scripts.pory"
	goto_if_eq VAR_RESULT, NO, ViridianCity_School_EventScript_StopReadingNotebook
# 33 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_NotebookSecondPage
# 34 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_TurnThePage, MSGBOX_YESNO
# 35 "data/maps/ViridianCity_School/scripts.pory"
	goto_if_eq VAR_RESULT, NO, ViridianCity_School_EventScript_StopReadingNotebook
# 36 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_NotebookThirdPage
# 37 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_TurnThePage, MSGBOX_YESNO
# 38 "data/maps/ViridianCity_School/scripts.pory"
	goto_if_eq VAR_RESULT, NO, ViridianCity_School_EventScript_StopReadingNotebook
# 39 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_NotebookFourthPage
# 40 "data/maps/ViridianCity_School/scripts.pory"
	applymovement LOCALID_LASS, Common_Movement_WalkInPlaceFasterUp
# 41 "data/maps/ViridianCity_School/scripts.pory"
	waitmovement 0
# 42 "data/maps/ViridianCity_School/scripts.pory"
	textcolor NPC_TEXT_COLOR_FEMALE
# 43 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_HeyDontLookAtMyNotes
# 44 "data/maps/ViridianCity_School/scripts.pory"
	releaseall
# 45 "data/maps/ViridianCity_School/scripts.pory"
	end
# 46 "data/maps/ViridianCity_School/scripts.pory"

# 47 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_StopReadingNotebook::
# 48 "data/maps/ViridianCity_School/scripts.pory"
	releaseall
# 49 "data/maps/ViridianCity_School/scripts.pory"
	end
# 50 "data/maps/ViridianCity_School/scripts.pory"

# 51 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_Blackboard::
# 52 "data/maps/ViridianCity_School/scripts.pory"
	lockall
# 53 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_BlackboardListsStatusProblems
# 54 "data/maps/ViridianCity_School/scripts.pory"
	goto ViridianCity_School_EventScript_ChooseBlackboardTopic
# 55 "data/maps/ViridianCity_School/scripts.pory"
	end
# 56 "data/maps/ViridianCity_School/scripts.pory"

# 57 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_ChooseBlackboardTopic::
# 58 "data/maps/ViridianCity_School/scripts.pory"
	message ViridianCity_School_Text_ReadWhichTopic
# 59 "data/maps/ViridianCity_School/scripts.pory"
	waitmessage
# 60 "data/maps/ViridianCity_School/scripts.pory"
	multichoicegrid 7, 1, MULTICHOICE_TRAINER_SCHOOL_WHITEBOARD, 3, FALSE
# 61 "data/maps/ViridianCity_School/scripts.pory"
	switch VAR_RESULT
# 62 "data/maps/ViridianCity_School/scripts.pory"
	case 0, ViridianCity_School_EventScript_ReadSleep
# 63 "data/maps/ViridianCity_School/scripts.pory"
	case 1, ViridianCity_School_EventScript_ReadPoison
# 64 "data/maps/ViridianCity_School/scripts.pory"
	case 2, ViridianCity_School_EventScript_ReadParalysis
# 65 "data/maps/ViridianCity_School/scripts.pory"
	case 3, ViridianCity_School_EventScript_ReadBurn
# 66 "data/maps/ViridianCity_School/scripts.pory"
	case 4, ViridianCity_School_EventScript_ReadFreeze
# 67 "data/maps/ViridianCity_School/scripts.pory"
	case 5, ViridianCity_School_EventScript_ExitBlackboard
# 68 "data/maps/ViridianCity_School/scripts.pory"
	case 127, ViridianCity_School_EventScript_ExitBlackboard
# 69 "data/maps/ViridianCity_School/scripts.pory"
	end
# 70 "data/maps/ViridianCity_School/scripts.pory"

# 71 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_ReadSleep::
# 72 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_ExplainSleep
# 73 "data/maps/ViridianCity_School/scripts.pory"
	goto ViridianCity_School_EventScript_ChooseBlackboardTopic
# 74 "data/maps/ViridianCity_School/scripts.pory"
	end
# 75 "data/maps/ViridianCity_School/scripts.pory"

# 76 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_ReadBurn::
# 77 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_ExplainBurn
# 78 "data/maps/ViridianCity_School/scripts.pory"
	goto ViridianCity_School_EventScript_ChooseBlackboardTopic
# 79 "data/maps/ViridianCity_School/scripts.pory"
	end
# 80 "data/maps/ViridianCity_School/scripts.pory"

# 81 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_ReadPoison::
# 82 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_ExplainPoison
# 83 "data/maps/ViridianCity_School/scripts.pory"
	goto ViridianCity_School_EventScript_ChooseBlackboardTopic
# 84 "data/maps/ViridianCity_School/scripts.pory"
	end
# 85 "data/maps/ViridianCity_School/scripts.pory"

# 86 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_ReadFreeze::
# 87 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_ExplainFreeze
# 88 "data/maps/ViridianCity_School/scripts.pory"
	goto ViridianCity_School_EventScript_ChooseBlackboardTopic
# 89 "data/maps/ViridianCity_School/scripts.pory"
	end
# 90 "data/maps/ViridianCity_School/scripts.pory"

# 91 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_ReadParalysis::
# 92 "data/maps/ViridianCity_School/scripts.pory"
	msgbox ViridianCity_School_Text_ExplainParalysis
# 93 "data/maps/ViridianCity_School/scripts.pory"
	goto ViridianCity_School_EventScript_ChooseBlackboardTopic
# 94 "data/maps/ViridianCity_School/scripts.pory"
	end
# 95 "data/maps/ViridianCity_School/scripts.pory"

# 96 "data/maps/ViridianCity_School/scripts.pory"
ViridianCity_School_EventScript_ExitBlackboard::
# 97 "data/maps/ViridianCity_School/scripts.pory"
	releaseall
# 98 "data/maps/ViridianCity_School/scripts.pory"
	end
