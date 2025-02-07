# 1 "data/maps/SSAnne_B1F_Room5/scripts.pory"

# 2 "data/maps/SSAnne_B1F_Room5/scripts.pory"
SSAnne_B1F_Room5_MapScripts::
# 3 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	.byte 0
# 4 "data/maps/SSAnne_B1F_Room5/scripts.pory"

# 5 "data/maps/SSAnne_B1F_Room5/scripts.pory"
SSAnne_B1F_Room5_EventScript_Boy::
# 6 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	msgbox SSAnne_B1F_Room5_Text_MachokeHasStrengthToMoveRocks, MSGBOX_NPC
# 7 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	end
# 8 "data/maps/SSAnne_B1F_Room5/scripts.pory"

# 9 "data/maps/SSAnne_B1F_Room5/scripts.pory"
SSAnne_B1F_Room5_EventScript_Machoke::
# 10 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	lock
# 11 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	faceplayer
# 12 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	waitse
# 13 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	playmoncry SPECIES_MACHOKE, CRY_MODE_NORMAL
# 14 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	msgbox SSAnne_B1F_Room5_Text_Machoke
# 15 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	waitmoncry
# 16 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	release
# 17 "data/maps/SSAnne_B1F_Room5/scripts.pory"
	end
