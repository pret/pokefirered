SSAnne_1F_Room4_MapScripts:: @ 8160C43
	.byte 0

SSAnne_1F_Room4_EventScript_Woman:: @ 8160C44
	lock
	faceplayer
	checkplayergender
	compare VAR_RESULT, MALE
	goto_if_eq SSAnne_1F_Room4_EventScript_WomanPlayerMale
	msgbox SSAnne_1F_Room4_Text_WaitressCherryPiePlease
	release
	end

SSAnne_1F_Room4_EventScript_WomanPlayerMale:: @ 8160C5C
	msgbox SSAnne_1F_Room4_Text_WaiterCherryPiePlease
	release
	end
