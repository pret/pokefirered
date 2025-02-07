# 1 "data/maps/LavenderTown_Mart/scripts.pory"

# 2 "data/maps/LavenderTown_Mart/scripts.pory"
LavenderTown_Mart_MapScripts::
# 3 "data/maps/LavenderTown_Mart/scripts.pory"
	.byte 0
# 4 "data/maps/LavenderTown_Mart/scripts.pory"

# 5 "data/maps/LavenderTown_Mart/scripts.pory"
LavenderTown_Mart_EventScript_BaldingMan::
# 6 "data/maps/LavenderTown_Mart/scripts.pory"
	msgbox LavenderTown_Mart_Text_SearchingForStatRaiseItems, MSGBOX_NPC
# 7 "data/maps/LavenderTown_Mart/scripts.pory"
	end
# 8 "data/maps/LavenderTown_Mart/scripts.pory"

# 9 "data/maps/LavenderTown_Mart/scripts.pory"
LavenderTown_Mart_EventScript_Rocker::
# 10 "data/maps/LavenderTown_Mart/scripts.pory"
	msgbox LavenderTown_Mart_Text_DidYouBuyRevives, MSGBOX_NPC
# 11 "data/maps/LavenderTown_Mart/scripts.pory"
	end
# 12 "data/maps/LavenderTown_Mart/scripts.pory"

# 13 "data/maps/LavenderTown_Mart/scripts.pory"
LavenderTown_Mart_EventScript_Youngster::
# 14 "data/maps/LavenderTown_Mart/scripts.pory"
	msgbox LavenderTown_Mart_Text_TrainerDuosCanChallengeYou, MSGBOX_NPC
# 15 "data/maps/LavenderTown_Mart/scripts.pory"
	end
# 16 "data/maps/LavenderTown_Mart/scripts.pory"

# 17 "data/maps/LavenderTown_Mart/scripts.pory"
LavenderTown_Mart_EventScript_Clerk::
# 18 "data/maps/LavenderTown_Mart/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 19 "data/maps/LavenderTown_Mart/scripts.pory"
	lock
# 20 "data/maps/LavenderTown_Mart/scripts.pory"
	faceplayer
# 21 "data/maps/LavenderTown_Mart/scripts.pory"
	message Text_MayIHelpYou
# 22 "data/maps/LavenderTown_Mart/scripts.pory"
	waitmessage
# 23 "data/maps/LavenderTown_Mart/scripts.pory"
	pokemart LavenderTown_Mart_Items
# 24 "data/maps/LavenderTown_Mart/scripts.pory"
	msgbox Text_PleaseComeAgain
# 25 "data/maps/LavenderTown_Mart/scripts.pory"
	release
# 26 "data/maps/LavenderTown_Mart/scripts.pory"
	end
# 27 "data/maps/LavenderTown_Mart/scripts.pory"

# 28 "data/maps/LavenderTown_Mart/scripts.pory"
	.align 2
# 29 "data/maps/LavenderTown_Mart/scripts.pory"
LavenderTown_Mart_Items::
# 30 "data/maps/LavenderTown_Mart/scripts.pory"
	.2byte ITEM_GREAT_BALL
# 31 "data/maps/LavenderTown_Mart/scripts.pory"
	.2byte ITEM_SUPER_POTION
# 32 "data/maps/LavenderTown_Mart/scripts.pory"
	.2byte ITEM_REVIVE
# 33 "data/maps/LavenderTown_Mart/scripts.pory"
	.2byte ITEM_ANTIDOTE
# 34 "data/maps/LavenderTown_Mart/scripts.pory"
	.2byte ITEM_PARALYZE_HEAL
# 35 "data/maps/LavenderTown_Mart/scripts.pory"
	.2byte ITEM_BURN_HEAL
# 36 "data/maps/LavenderTown_Mart/scripts.pory"
	.2byte ITEM_ICE_HEAL
# 37 "data/maps/LavenderTown_Mart/scripts.pory"
	.2byte ITEM_ESCAPE_ROPE
# 38 "data/maps/LavenderTown_Mart/scripts.pory"
	.2byte ITEM_SUPER_REPEL
# 39 "data/maps/LavenderTown_Mart/scripts.pory"
	.2byte ITEM_NONE
# 40 "data/maps/LavenderTown_Mart/scripts.pory"
	release
# 41 "data/maps/LavenderTown_Mart/scripts.pory"
	end
