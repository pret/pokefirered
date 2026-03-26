.equ CHECKED_MUSHROOMS,  FLAG_TEMP_1

TwoIsland_House_MapScripts::
	.byte 0

TwoIsland_House_EventScript_MoveManiac::
	goto_if_questlog EventScript_ReleaseEnd
	special QuestLog_CutRecording
	lock
	faceplayer
	goto_if_set CHECKED_MUSHROOMS, TwoIsland_House_EventScript_EndTutorMove
	msgbox TwoIsland_House_Text_TeachMonMoveForMushroom
	setflag CHECKED_MUSHROOMS
	release
	end

TwoIsland_House_EventScript_EndTutorMove::
	msgbox TwoIsland_House_Text_NeedMushroomOrTwoToLearnMove
	release
	end
