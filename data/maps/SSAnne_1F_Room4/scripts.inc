# 1 "data/maps/SSAnne_1F_Room4/scripts.pory"

# 2 "data/maps/SSAnne_1F_Room4/scripts.pory"
SSAnne_1F_Room4_MapScripts::
# 3 "data/maps/SSAnne_1F_Room4/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_1F_Room4/scripts.pory"

# 5 "data/maps/SSAnne_1F_Room4/scripts.pory"
SSAnne_1F_Room4_EventScript_Woman::
# 6 "data/maps/SSAnne_1F_Room4/scripts.pory"
	lock
# 7 "data/maps/SSAnne_1F_Room4/scripts.pory"
	faceplayer
# 8 "data/maps/SSAnne_1F_Room4/scripts.pory"
	checkplayergender
# 9 "data/maps/SSAnne_1F_Room4/scripts.pory"
	goto_if_eq VAR_RESULT, MALE, SSAnne_1F_Room4_EventScript_WomanPlayerMale
# 10 "data/maps/SSAnne_1F_Room4/scripts.pory"
	msgbox SSAnne_1F_Room4_Text_WaitressCherryPiePlease
# 11 "data/maps/SSAnne_1F_Room4/scripts.pory"
	release
# 12 "data/maps/SSAnne_1F_Room4/scripts.pory"
	end
# 13 "data/maps/SSAnne_1F_Room4/scripts.pory"

# 14 "data/maps/SSAnne_1F_Room4/scripts.pory"
SSAnne_1F_Room4_EventScript_WomanPlayerMale::
# 15 "data/maps/SSAnne_1F_Room4/scripts.pory"
	msgbox SSAnne_1F_Room4_Text_WaiterCherryPiePlease
# 16 "data/maps/SSAnne_1F_Room4/scripts.pory"
	release
# 17 "data/maps/SSAnne_1F_Room4/scripts.pory"
	end
