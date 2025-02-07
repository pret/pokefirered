# 1 "data/maps/RocketHideout_B2F/scripts.pory"

# 2 "data/maps/RocketHideout_B2F/scripts.pory"
RocketHideout_B2F_MapScripts::
# 3 "data/maps/RocketHideout_B2F/scripts.pory"
	.byte 0
# 4 "data/maps/RocketHideout_B2F/scripts.pory"

# 5 "data/maps/RocketHideout_B2F/scripts.pory"
RocketHideout_B2F_EventScript_Grunt::
# 6 "data/maps/RocketHideout_B2F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_13, RocketHideout_B2F_Text_GruntIntro, RocketHideout_B2F_Text_GruntDefeat
# 7 "data/maps/RocketHideout_B2F/scripts.pory"
	msgbox RocketHideout_B2F_Text_GruntPostBattle, MSGBOX_AUTOCLOSE
# 8 "data/maps/RocketHideout_B2F/scripts.pory"
	end
