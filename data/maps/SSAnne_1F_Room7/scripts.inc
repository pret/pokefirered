SSAnne_1F_Room7_MapScripts:: @ 8160C7E
	.byte 0

SSAnne_1F_Room7_EventScript_Thomas:: @ 8160C7F
	trainerbattle_single TRAINER_GENTLEMAN_THOMAS, SSAnne_1F_Room7_Text_ThomasIntro, SSAnne_1F_Room7_Text_ThomasDefeat
	msgbox SSAnne_1F_Room7_Text_ThomasPostBattle, MSGBOX_AUTOCLOSE
	end
