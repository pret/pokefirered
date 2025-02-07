# 1 "data/maps/SSAnne_B1F_Room4/scripts.pory"

# 2 "data/maps/SSAnne_B1F_Room4/scripts.pory"
SSAnne_B1F_Room4_MapScripts::
# 3 "data/maps/SSAnne_B1F_Room4/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_B1F_Room4/scripts.pory"

# 5 "data/maps/SSAnne_B1F_Room4/scripts.pory"
SSAnne_B1F_Room4_EventScript_Leonard::
# 6 "data/maps/SSAnne_B1F_Room4/scripts.pory"
	trainerbattle_single TRAINER_SAILOR_LEONARD, SSAnne_B1F_Room4_Text_LeonardIntro, SSAnne_B1F_Room4_Text_LeonardDefeat
# 7 "data/maps/SSAnne_B1F_Room4/scripts.pory"
	msgbox SSAnne_B1F_Room4_Text_LeonardPostBattle, MSGBOX_AUTOCLOSE
# 8 "data/maps/SSAnne_B1F_Room4/scripts.pory"
	end
# 9 "data/maps/SSAnne_B1F_Room4/scripts.pory"

# 10 "data/maps/SSAnne_B1F_Room4/scripts.pory"
SSAnne_B1F_Room4_EventScript_Duncan::
# 11 "data/maps/SSAnne_B1F_Room4/scripts.pory"
	trainerbattle_single TRAINER_SAILOR_DUNCAN, SSAnne_B1F_Room4_Text_DuncanIntro, SSAnne_B1F_Room4_Text_DuncanDefeat
# 12 "data/maps/SSAnne_B1F_Room4/scripts.pory"
	msgbox SSAnne_B1F_Room4_Text_DuncanPostBattle, MSGBOX_AUTOCLOSE
# 13 "data/maps/SSAnne_B1F_Room4/scripts.pory"
	end
