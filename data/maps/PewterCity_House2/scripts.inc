PewterCity_House2_MapScripts::
	.byte 0

PewterCity_House2_EventScript_OldMan::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_House2_Text_MonsLearnTechniquesAsTheyGrow, MSGBOX_NPC
	end

PewterCity_House2_EventScript_LittleBoy::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PewterCity_House2_Text_MonsEasierCatchIfStatused, MSGBOX_NPC
	end

PewterCity_House2_EventScript_OldWoman::
	msgbox PewterCity_House2_Text_EventScript_OldWoman, MSGBOX_NPC
	applymovement 3, Common_Movement_FaceOriginalDirection
	waitmovement 0
	releaseall
	end