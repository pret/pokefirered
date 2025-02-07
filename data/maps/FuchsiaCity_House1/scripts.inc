# 1 "data/maps/FuchsiaCity_House1/scripts.pory"

# 2 "data/maps/FuchsiaCity_House1/scripts.pory"
FuchsiaCity_House1_MapScripts::
# 3 "data/maps/FuchsiaCity_House1/scripts.pory"
	.byte 0
# 4 "data/maps/FuchsiaCity_House1/scripts.pory"

# 5 "data/maps/FuchsiaCity_House1/scripts.pory"
FuchsiaCity_House1_EventScript_Woman::
# 6 "data/maps/FuchsiaCity_House1/scripts.pory"
	msgbox FuchsiaCity_House1_Text_WardenIsOldHasFalseTeeth, MSGBOX_NPC
# 7 "data/maps/FuchsiaCity_House1/scripts.pory"
	end
# 8 "data/maps/FuchsiaCity_House1/scripts.pory"

# 9 "data/maps/FuchsiaCity_House1/scripts.pory"
FuchsiaCity_House1_EventScript_OldMan::
# 10 "data/maps/FuchsiaCity_House1/scripts.pory"
	lock
# 11 "data/maps/FuchsiaCity_House1/scripts.pory"
	faceplayer
# 12 "data/maps/FuchsiaCity_House1/scripts.pory"
	famechecker FAMECHECKER_BILL, 2
# 13 "data/maps/FuchsiaCity_House1/scripts.pory"
	msgbox FuchsiaCity_House1_Text_BillIsMyGrandson
# 14 "data/maps/FuchsiaCity_House1/scripts.pory"
	release
# 15 "data/maps/FuchsiaCity_House1/scripts.pory"
	end
# 16 "data/maps/FuchsiaCity_House1/scripts.pory"

# 17 "data/maps/FuchsiaCity_House1/scripts.pory"
FuchsiaCity_House1_EventScript_LittleBoy::
# 18 "data/maps/FuchsiaCity_House1/scripts.pory"
	msgbox FuchsiaCity_House1_Text_BillFilesHisOwnMonData, MSGBOX_NPC
# 19 "data/maps/FuchsiaCity_House1/scripts.pory"
	end
