# 1 "data/maps/ViridianCity_House/scripts.pory"

# 2 "data/maps/ViridianCity_House/scripts.pory"
ViridianCity_House_MapScripts::
# 3 "data/maps/ViridianCity_House/scripts.pory"
	.byte 0
# 4 "data/maps/ViridianCity_House/scripts.pory"

# 5 "data/maps/ViridianCity_House/scripts.pory"
ViridianCity_House_EventScript_BaldingMan::
# 6 "data/maps/ViridianCity_House/scripts.pory"
	msgbox ViridianCity_House_Text_NicknamingIsFun, MSGBOX_NPC
# 7 "data/maps/ViridianCity_House/scripts.pory"
	end
# 8 "data/maps/ViridianCity_House/scripts.pory"

# 9 "data/maps/ViridianCity_House/scripts.pory"
ViridianCity_House_EventScript_LittleGirl::
# 10 "data/maps/ViridianCity_House/scripts.pory"
	msgbox ViridianCity_House_Text_MyDaddyLovesMonsToo, MSGBOX_NPC
# 11 "data/maps/ViridianCity_House/scripts.pory"
	end
# 12 "data/maps/ViridianCity_House/scripts.pory"

# 13 "data/maps/ViridianCity_House/scripts.pory"
ViridianCity_House_EventScript_Speary::
# 14 "data/maps/ViridianCity_House/scripts.pory"
	lock
# 15 "data/maps/ViridianCity_House/scripts.pory"
	faceplayer
# 16 "data/maps/ViridianCity_House/scripts.pory"
	waitse
# 17 "data/maps/ViridianCity_House/scripts.pory"
	playmoncry SPECIES_SPEAROW, CRY_MODE_NORMAL
# 18 "data/maps/ViridianCity_House/scripts.pory"
	msgbox ViridianCity_House_Text_Speary
# 19 "data/maps/ViridianCity_House/scripts.pory"
	waitmoncry
# 20 "data/maps/ViridianCity_House/scripts.pory"
	release
# 21 "data/maps/ViridianCity_House/scripts.pory"
	end
# 22 "data/maps/ViridianCity_House/scripts.pory"

# 23 "data/maps/ViridianCity_House/scripts.pory"
ViridianCity_House_EventScript_NicknameSign::
# 24 "data/maps/ViridianCity_House/scripts.pory"
	msgbox ViridianCity_House_Text_SpearowNameSpeary, MSGBOX_SIGN
# 25 "data/maps/ViridianCity_House/scripts.pory"
	end
