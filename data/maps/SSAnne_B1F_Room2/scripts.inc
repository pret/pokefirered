SSAnne_B1F_Room2_MapScripts:: @ 8160D76
	.byte 0

SSAnne_B1F_Room2_EventScript_Huey:: @ 8160D77
	trainerbattle_single TRAINER_SAILOR_HUEY, SSAnne_B1F_Room2_Text_HueyIntro, SSAnne_B1F_Room2_Text_HueyDefeat
	msgbox SSAnne_B1F_Room2_Text_HueyPostBattle, MSGBOX_AUTOCLOSE
	end
