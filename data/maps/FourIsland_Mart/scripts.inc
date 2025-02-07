# 1 "data/maps/FourIsland_Mart/scripts.pory"

# 2 "data/maps/FourIsland_Mart/scripts.pory"
FourIsland_Mart_MapScripts::
# 3 "data/maps/FourIsland_Mart/scripts.pory"
	.byte 0
# 4 "data/maps/FourIsland_Mart/scripts.pory"

# 5 "data/maps/FourIsland_Mart/scripts.pory"
FourIsland_Mart_EventScript_Clerk::
# 6 "data/maps/FourIsland_Mart/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 7 "data/maps/FourIsland_Mart/scripts.pory"
	lock
# 8 "data/maps/FourIsland_Mart/scripts.pory"
	faceplayer
# 9 "data/maps/FourIsland_Mart/scripts.pory"
	message Text_MayIHelpYou
# 10 "data/maps/FourIsland_Mart/scripts.pory"
	waitmessage
# 11 "data/maps/FourIsland_Mart/scripts.pory"
	pokemart FourIsland_Mart_Items
# 12 "data/maps/FourIsland_Mart/scripts.pory"
	msgbox Text_PleaseComeAgain
# 13 "data/maps/FourIsland_Mart/scripts.pory"
	release
# 14 "data/maps/FourIsland_Mart/scripts.pory"
	end
# 15 "data/maps/FourIsland_Mart/scripts.pory"

# 16 "data/maps/FourIsland_Mart/scripts.pory"
	.align 2
# 17 "data/maps/FourIsland_Mart/scripts.pory"
FourIsland_Mart_Items::
# 18 "data/maps/FourIsland_Mart/scripts.pory"
	.2byte ITEM_ULTRA_BALL
# 19 "data/maps/FourIsland_Mart/scripts.pory"
	.2byte ITEM_FULL_RESTORE
# 20 "data/maps/FourIsland_Mart/scripts.pory"
	.2byte ITEM_MAX_POTION
# 21 "data/maps/FourIsland_Mart/scripts.pory"
	.2byte ITEM_REVIVE
# 22 "data/maps/FourIsland_Mart/scripts.pory"
	.2byte ITEM_ICE_HEAL
# 23 "data/maps/FourIsland_Mart/scripts.pory"
	.2byte ITEM_FULL_HEAL
# 24 "data/maps/FourIsland_Mart/scripts.pory"
	.2byte ITEM_ESCAPE_ROPE
# 25 "data/maps/FourIsland_Mart/scripts.pory"
	.2byte ITEM_MAX_REPEL
# 26 "data/maps/FourIsland_Mart/scripts.pory"
	.2byte ITEM_NONE
# 27 "data/maps/FourIsland_Mart/scripts.pory"
	release
# 28 "data/maps/FourIsland_Mart/scripts.pory"
	end
# 29 "data/maps/FourIsland_Mart/scripts.pory"

# 30 "data/maps/FourIsland_Mart/scripts.pory"
FourIsland_Mart_EventScript_Camper::
# 31 "data/maps/FourIsland_Mart/scripts.pory"
	msgbox FourIsland_Mart_Text_IcefallCaveIsFrigid, MSGBOX_NPC
# 32 "data/maps/FourIsland_Mart/scripts.pory"
	end
