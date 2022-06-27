ViridianCity_House1_MapScripts::
	.byte 0

ViridianCity_House1_EventScript_BaldingMan::
	msgbox ViridianCity_House1_Text_NicknamingIsFun, MSGBOX_NPC
	end

ViridianCity_House1_EventScript_LittleGirl::
	msgbox ViridianCity_House1_Text_MyDaddyLovesMonsToo, MSGBOX_NPC
	end

ViridianCity_House1_EventScript_Speary::
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SPEAROW, 0
	msgbox ViridianCity_House1_Text_Speary
	waitmoncry
	release
	end

ViridianCity_House1_EventScript_NicknameSign::
	msgbox ViridianCity_House1_Text_SpearowNameSpeary, MSGBOX_SIGN
	end
