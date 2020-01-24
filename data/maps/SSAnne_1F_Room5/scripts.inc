SSAnne_1F_Room5_MapScripts:: @ 8160C66
	.byte 0

SSAnne_1F_Room5_EventScript_Arthur:: @ 8160C67
	trainerbattle_single TRAINER_GENTLEMAN_ARTHUR, SSAnne_1F_Room5_Text_ArthurIntro, SSAnne_1F_Room5_Text_ArthurDefeat
	msgbox SSAnne_1F_Room5_Text_ArthurPostBattle, MSGBOX_AUTOCLOSE
	end
