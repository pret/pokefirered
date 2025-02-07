# 1 "data/maps/SSAnne_1F_Room2/scripts.pory"

# 2 "data/maps/SSAnne_1F_Room2/scripts.pory"
SSAnne_1F_Room2_MapScripts::
# 3 "data/maps/SSAnne_1F_Room2/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_1F_Room2/scripts.pory"

# 5 "data/maps/SSAnne_1F_Room2/scripts.pory"
SSAnne_1F_Room2_EventScript_Woman::
# 6 "data/maps/SSAnne_1F_Room2/scripts.pory"
	msgbox SSAnne_1F_Room2_Text_CruisingAroundWorld, MSGBOX_NPC
# 7 "data/maps/SSAnne_1F_Room2/scripts.pory"
	end
# 8 "data/maps/SSAnne_1F_Room2/scripts.pory"

# 9 "data/maps/SSAnne_1F_Room2/scripts.pory"
SSAnne_1F_Room2_EventScript_Ann::
# 10 "data/maps/SSAnne_1F_Room2/scripts.pory"
	trainerbattle_single TRAINER_LASS_ANN, SSAnne_1F_Room2_Text_AnnIntro, SSAnne_1F_Room2_Text_AnnDefeat
# 11 "data/maps/SSAnne_1F_Room2/scripts.pory"
	msgbox SSAnne_1F_Room2_Text_AnnPostBattle, MSGBOX_AUTOCLOSE
# 12 "data/maps/SSAnne_1F_Room2/scripts.pory"
	end
# 13 "data/maps/SSAnne_1F_Room2/scripts.pory"

# 14 "data/maps/SSAnne_1F_Room2/scripts.pory"
SSAnne_1F_Room2_EventScript_Tyler::
# 15 "data/maps/SSAnne_1F_Room2/scripts.pory"
	trainerbattle_single TRAINER_YOUNGSTER_TYLER, SSAnne_1F_Room2_Text_TylerIntro, SSAnne_1F_Room2_Text_TylerDefeat
# 16 "data/maps/SSAnne_1F_Room2/scripts.pory"
	msgbox SSAnne_1F_Room2_Text_TylerPostBattle, MSGBOX_AUTOCLOSE
# 17 "data/maps/SSAnne_1F_Room2/scripts.pory"
	end
