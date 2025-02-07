# 1 "data/maps/SevenIsland_Mart/scripts.pory"

# 2 "data/maps/SevenIsland_Mart/scripts.pory"
SevenIsland_Mart_MapScripts::
# 3 "data/maps/SevenIsland_Mart/scripts.pory"
	.byte 0
# 4 "data/maps/SevenIsland_Mart/scripts.pory"

# 5 "data/maps/SevenIsland_Mart/scripts.pory"
SevenIsland_Mart_EventScript_Clerk::
# 6 "data/maps/SevenIsland_Mart/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 7 "data/maps/SevenIsland_Mart/scripts.pory"
	lock
# 8 "data/maps/SevenIsland_Mart/scripts.pory"
	faceplayer
# 9 "data/maps/SevenIsland_Mart/scripts.pory"
	message Text_MayIHelpYou
# 10 "data/maps/SevenIsland_Mart/scripts.pory"
	waitmessage
# 11 "data/maps/SevenIsland_Mart/scripts.pory"
	pokemart SevenIsland_Mart_Items
# 12 "data/maps/SevenIsland_Mart/scripts.pory"
	msgbox Text_PleaseComeAgain
# 13 "data/maps/SevenIsland_Mart/scripts.pory"
	release
# 14 "data/maps/SevenIsland_Mart/scripts.pory"
	end
# 15 "data/maps/SevenIsland_Mart/scripts.pory"

# 16 "data/maps/SevenIsland_Mart/scripts.pory"
	.align 2
# 17 "data/maps/SevenIsland_Mart/scripts.pory"
SevenIsland_Mart_Items::
# 18 "data/maps/SevenIsland_Mart/scripts.pory"
	.2byte ITEM_ULTRA_BALL
# 19 "data/maps/SevenIsland_Mart/scripts.pory"
	.2byte ITEM_GREAT_BALL
# 20 "data/maps/SevenIsland_Mart/scripts.pory"
	.2byte ITEM_FULL_RESTORE
# 21 "data/maps/SevenIsland_Mart/scripts.pory"
	.2byte ITEM_MAX_POTION
# 22 "data/maps/SevenIsland_Mart/scripts.pory"
	.2byte ITEM_HYPER_POTION
# 23 "data/maps/SevenIsland_Mart/scripts.pory"
	.2byte ITEM_REVIVE
# 24 "data/maps/SevenIsland_Mart/scripts.pory"
	.2byte ITEM_FULL_HEAL
# 25 "data/maps/SevenIsland_Mart/scripts.pory"
	.2byte ITEM_ESCAPE_ROPE
# 26 "data/maps/SevenIsland_Mart/scripts.pory"
	.2byte ITEM_MAX_REPEL
# 27 "data/maps/SevenIsland_Mart/scripts.pory"
	.2byte ITEM_NONE
# 28 "data/maps/SevenIsland_Mart/scripts.pory"
	release
# 29 "data/maps/SevenIsland_Mart/scripts.pory"
	end
# 30 "data/maps/SevenIsland_Mart/scripts.pory"

# 31 "data/maps/SevenIsland_Mart/scripts.pory"
SevenIsland_Mart_EventScript_Lass::
# 32 "data/maps/SevenIsland_Mart/scripts.pory"
	msgbox SevenIsland_Mart_Text_MonHavePersonalitiesOfTheirOwn, MSGBOX_NPC
# 33 "data/maps/SevenIsland_Mart/scripts.pory"
	end
# 34 "data/maps/SevenIsland_Mart/scripts.pory"

# 35 "data/maps/SevenIsland_Mart/scripts.pory"
SevenIsland_Mart_EventScript_Hiker::
# 36 "data/maps/SevenIsland_Mart/scripts.pory"
	msgbox SevenIsland_Mart_Text_PreparationsCompleteForRuins, MSGBOX_NPC
# 37 "data/maps/SevenIsland_Mart/scripts.pory"
	end
# 38 "data/maps/SevenIsland_Mart/scripts.pory"

# 39 "data/maps/SevenIsland_Mart/scripts.pory"
SevenIsland_Mart_EventScript_Fisher::
# 40 "data/maps/SevenIsland_Mart/scripts.pory"
	msgbox SevenIsland_Mart_Text_NeedToFishOnSevenIsland, MSGBOX_NPC
# 41 "data/maps/SevenIsland_Mart/scripts.pory"
	end
