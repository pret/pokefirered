# 1 "data/maps/SSAnne_1F_Room7/scripts.pory"

# 2 "data/maps/SSAnne_1F_Room7/scripts.pory"
SSAnne_1F_Room7_MapScripts::
# 3 "data/maps/SSAnne_1F_Room7/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_1F_Room7/scripts.pory"

# 5 "data/maps/SSAnne_1F_Room7/scripts.pory"
SSAnne_1F_Room7_EventScript_Thomas::
# 6 "data/maps/SSAnne_1F_Room7/scripts.pory"
	trainerbattle_single TRAINER_GENTLEMAN_THOMAS, SSAnne_1F_Room7_Text_ThomasIntro, SSAnne_1F_Room7_Text_ThomasDefeat
# 7 "data/maps/SSAnne_1F_Room7/scripts.pory"
	msgbox SSAnne_1F_Room7_Text_ThomasPostBattle, MSGBOX_AUTOCLOSE
# 8 "data/maps/SSAnne_1F_Room7/scripts.pory"
	end
