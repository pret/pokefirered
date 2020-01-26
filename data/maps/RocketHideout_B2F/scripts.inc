RocketHideout_B2F_MapScripts:: @ 81612A1
	.byte 0

RocketHideout_B2F_EventScript_Grunt:: @ 81612A2
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_13, RocketHideout_B2F_Text_GruntIntro, RocketHideout_B2F_Text_GruntDefeat
	msgbox RocketHideout_B2F_Text_GruntPostBattle, MSGBOX_AUTOCLOSE
	end
