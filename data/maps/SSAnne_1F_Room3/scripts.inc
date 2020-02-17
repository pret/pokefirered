SSAnne_1F_Room3_MapScripts:: @ 8160C1D
	.byte 0

SSAnne_1F_Room3_EventScript_LittleGirl:: @ 8160C1E
	msgbox SSAnne_1F_Room3_Text_AlwaysTravelWithWigglytuff, MSGBOX_NPC
	end

SSAnne_1F_Room3_EventScript_BaldingMan:: @ 8160C27
	msgbox SSAnne_1F_Room3_Text_CruiseIsElegantAndCozy, MSGBOX_NPC
	end

SSAnne_1F_Room3_EventScript_Wigglytuff:: @ 8160C30
	lock
	faceplayer
	waitse
	playmoncry SPECIES_WIGGLYTUFF, 0
	msgbox SSAnne_1F_Room3_Text_Wigglytuff
	waitmoncry
	release
	end
