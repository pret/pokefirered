# 1 "data/maps/SSAnne_2F_Room4/scripts.pory"

# 2 "data/maps/SSAnne_2F_Room4/scripts.pory"
SSAnne_2F_Room4_MapScripts::
# 3 "data/maps/SSAnne_2F_Room4/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_2F_Room4/scripts.pory"

# 5 "data/maps/SSAnne_2F_Room4/scripts.pory"
SSAnne_2F_Room4_EventScript_Lamar::
# 6 "data/maps/SSAnne_2F_Room4/scripts.pory"
	trainerbattle_single TRAINER_GENTLEMAN_LAMAR, SSAnne_2F_Room4_Text_LamarIntro, SSAnne_2F_Room4_Text_LamarDefeat
# 7 "data/maps/SSAnne_2F_Room4/scripts.pory"
	msgbox SSAnne_2F_Room4_Text_LamarPostBattle, MSGBOX_AUTOCLOSE
# 8 "data/maps/SSAnne_2F_Room4/scripts.pory"
	end
# 9 "data/maps/SSAnne_2F_Room4/scripts.pory"

# 10 "data/maps/SSAnne_2F_Room4/scripts.pory"
SSAnne_2F_Room4_EventScript_Dawn::
# 11 "data/maps/SSAnne_2F_Room4/scripts.pory"
	trainerbattle_single TRAINER_LASS_DAWN, SSAnne_2F_Room4_Text_DawnIntro, SSAnne_2F_Room4_Text_DawnDefeat
# 12 "data/maps/SSAnne_2F_Room4/scripts.pory"
	msgbox SSAnne_2F_Room4_Text_DawnPostBattle, MSGBOX_AUTOCLOSE
# 13 "data/maps/SSAnne_2F_Room4/scripts.pory"
	end
