# 1 "data/maps/SSAnne_B1F_Room2/scripts.pory"

# 2 "data/maps/SSAnne_B1F_Room2/scripts.pory"
SSAnne_B1F_Room2_MapScripts::
# 3 "data/maps/SSAnne_B1F_Room2/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_B1F_Room2/scripts.pory"

# 5 "data/maps/SSAnne_B1F_Room2/scripts.pory"
SSAnne_B1F_Room2_EventScript_Huey::
# 6 "data/maps/SSAnne_B1F_Room2/scripts.pory"
	trainerbattle_single TRAINER_SAILOR_HUEY, SSAnne_B1F_Room2_Text_HueyIntro, SSAnne_B1F_Room2_Text_HueyDefeat
# 7 "data/maps/SSAnne_B1F_Room2/scripts.pory"
	msgbox SSAnne_B1F_Room2_Text_HueyPostBattle, MSGBOX_AUTOCLOSE
# 8 "data/maps/SSAnne_B1F_Room2/scripts.pory"
	end
