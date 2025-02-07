# 1 "data/maps/SSAnne_1F_Room5/scripts.pory"

# 2 "data/maps/SSAnne_1F_Room5/scripts.pory"
SSAnne_1F_Room5_MapScripts::
# 3 "data/maps/SSAnne_1F_Room5/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_1F_Room5/scripts.pory"

# 5 "data/maps/SSAnne_1F_Room5/scripts.pory"
SSAnne_1F_Room5_EventScript_Arthur::
# 6 "data/maps/SSAnne_1F_Room5/scripts.pory"
	trainerbattle_single TRAINER_GENTLEMAN_ARTHUR, SSAnne_1F_Room5_Text_ArthurIntro, SSAnne_1F_Room5_Text_ArthurDefeat
# 7 "data/maps/SSAnne_1F_Room5/scripts.pory"
	msgbox SSAnne_1F_Room5_Text_ArthurPostBattle, MSGBOX_AUTOCLOSE
# 8 "data/maps/SSAnne_1F_Room5/scripts.pory"
	end
