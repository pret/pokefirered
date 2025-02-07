# 1 "data/maps/SixIsland_OutcastIsland/scripts.pory"

# 2 "data/maps/SixIsland_OutcastIsland/scripts.pory"
SixIsland_OutcastIsland_MapScripts::
# 3 "data/maps/SixIsland_OutcastIsland/scripts.pory"
	.byte 0
# 4 "data/maps/SixIsland_OutcastIsland/scripts.pory"

# 5 "data/maps/SixIsland_OutcastIsland/scripts.pory"
SixIsland_OutcastIsland_EventScript_Rocket::
# 6 "data/maps/SixIsland_OutcastIsland/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_46, SixIsland_OutcastIsland_Text_RocketIntro, SixIsland_OutcastIsland_Text_RocketDefeat
# 7 "data/maps/SixIsland_OutcastIsland/scripts.pory"
	msgbox SixIsland_OutcastIsland_Text_RocketPostBattle, MSGBOX_AUTOCLOSE
# 8 "data/maps/SixIsland_OutcastIsland/scripts.pory"
	end
