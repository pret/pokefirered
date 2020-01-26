ViridianCity_House1_MapScripts:: @ 8169E9A
	.byte 0

ViridianCity_House1_EventScript_BaldingMan:: @ 8169E9B
	msgbox ViridianCity_House1_Text_NicknamingIsFun, MSGBOX_NPC
	end

ViridianCity_House1_EventScript_LittleGirl:: @ 8169EA4
	msgbox ViridianCity_House1_Text_MyDaddyLovesMonsToo, MSGBOX_NPC
	end

ViridianCity_House1_EventScript_Speary:: @ 8169EAD
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SPEAROW, 0
	msgbox ViridianCity_House1_Text_Speary
	waitmoncry
	release
	end

ViridianCity_House1_EventScript_NicknameSign:: @ 8169EC0
	msgbox ViridianCity_House1_Text_SpearowNameSpeary, MSGBOX_SIGN
	end
