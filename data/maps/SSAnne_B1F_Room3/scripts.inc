SSAnne_B1F_Room3_MapScripts:: @ 8160D8E
	.byte 0

SSAnne_B1F_Room3_EventScript_Dylan:: @ 8160D8F
	trainerbattle_single TRAINER_SAILOR_DYLAN, SSAnne_B1F_Room3_Text_DylanIntro, SSAnne_B1F_Room3_Text_DylanDefeat
	msgbox SSAnne_B1F_Room3_Text_DylanPostBattle, MSGBOX_AUTOCLOSE
	end
