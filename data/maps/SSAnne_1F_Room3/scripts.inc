# 1 "data/maps/SSAnne_1F_Room3/scripts.pory"

# 2 "data/maps/SSAnne_1F_Room3/scripts.pory"
SSAnne_1F_Room3_MapScripts::
# 3 "data/maps/SSAnne_1F_Room3/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_1F_Room3/scripts.pory"

# 5 "data/maps/SSAnne_1F_Room3/scripts.pory"
SSAnne_1F_Room3_EventScript_LittleGirl::
# 6 "data/maps/SSAnne_1F_Room3/scripts.pory"
	msgbox SSAnne_1F_Room3_Text_AlwaysTravelWithWigglytuff, MSGBOX_NPC
# 7 "data/maps/SSAnne_1F_Room3/scripts.pory"
	end
# 8 "data/maps/SSAnne_1F_Room3/scripts.pory"

# 9 "data/maps/SSAnne_1F_Room3/scripts.pory"
SSAnne_1F_Room3_EventScript_BaldingMan::
# 10 "data/maps/SSAnne_1F_Room3/scripts.pory"
	msgbox SSAnne_1F_Room3_Text_CruiseIsElegantAndCozy, MSGBOX_NPC
# 11 "data/maps/SSAnne_1F_Room3/scripts.pory"
	end
# 12 "data/maps/SSAnne_1F_Room3/scripts.pory"

# 13 "data/maps/SSAnne_1F_Room3/scripts.pory"
SSAnne_1F_Room3_EventScript_Wigglytuff::
# 14 "data/maps/SSAnne_1F_Room3/scripts.pory"
	lock
# 15 "data/maps/SSAnne_1F_Room3/scripts.pory"
	faceplayer
# 16 "data/maps/SSAnne_1F_Room3/scripts.pory"
	waitse
# 17 "data/maps/SSAnne_1F_Room3/scripts.pory"
	playmoncry SPECIES_WIGGLYTUFF, CRY_MODE_NORMAL
# 18 "data/maps/SSAnne_1F_Room3/scripts.pory"
	msgbox SSAnne_1F_Room3_Text_Wigglytuff
# 19 "data/maps/SSAnne_1F_Room3/scripts.pory"
	waitmoncry
# 20 "data/maps/SSAnne_1F_Room3/scripts.pory"
	release
# 21 "data/maps/SSAnne_1F_Room3/scripts.pory"
	end
