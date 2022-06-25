FuchsiaCity_House1_MapScripts::
	.byte 0

FuchsiaCity_House1_EventScript_Woman::
	msgbox FuchsiaCity_House1_Text_WardenIsOldHasFalseTeeth, MSGBOX_NPC
	end

FuchsiaCity_House1_EventScript_OldMan::
	lock
	faceplayer
	famechecker FAMECHECKER_BILL, 2
	msgbox FuchsiaCity_House1_Text_BillIsMyGrandson
	release
	end

FuchsiaCity_House1_EventScript_LittleBoy::
	msgbox FuchsiaCity_House1_Text_BillFilesHisOwnMonData, MSGBOX_NPC
	end
