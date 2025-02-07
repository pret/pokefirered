# 1 "data/maps/ThreeIsland_Mart/scripts.pory"

# 2 "data/maps/ThreeIsland_Mart/scripts.pory"
ThreeIsland_Mart_MapScripts::
# 3 "data/maps/ThreeIsland_Mart/scripts.pory"
	.byte 0
# 4 "data/maps/ThreeIsland_Mart/scripts.pory"

# 5 "data/maps/ThreeIsland_Mart/scripts.pory"
ThreeIsland_Mart_EventScript_Clerk::
# 6 "data/maps/ThreeIsland_Mart/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 7 "data/maps/ThreeIsland_Mart/scripts.pory"
	lock
# 8 "data/maps/ThreeIsland_Mart/scripts.pory"
	faceplayer
# 9 "data/maps/ThreeIsland_Mart/scripts.pory"
	message Text_MayIHelpYou
# 10 "data/maps/ThreeIsland_Mart/scripts.pory"
	waitmessage
# 11 "data/maps/ThreeIsland_Mart/scripts.pory"
	pokemart ThreeIsland_Mart_Items
# 12 "data/maps/ThreeIsland_Mart/scripts.pory"
	msgbox Text_PleaseComeAgain
# 13 "data/maps/ThreeIsland_Mart/scripts.pory"
	release
# 14 "data/maps/ThreeIsland_Mart/scripts.pory"
	end
# 15 "data/maps/ThreeIsland_Mart/scripts.pory"

# 16 "data/maps/ThreeIsland_Mart/scripts.pory"
	.align 2
# 17 "data/maps/ThreeIsland_Mart/scripts.pory"
ThreeIsland_Mart_Items::
# 18 "data/maps/ThreeIsland_Mart/scripts.pory"
	.2byte ITEM_ULTRA_BALL
# 19 "data/maps/ThreeIsland_Mart/scripts.pory"
	.2byte ITEM_HYPER_POTION
# 20 "data/maps/ThreeIsland_Mart/scripts.pory"
	.2byte ITEM_REVIVE
# 21 "data/maps/ThreeIsland_Mart/scripts.pory"
	.2byte ITEM_FULL_HEAL
# 22 "data/maps/ThreeIsland_Mart/scripts.pory"
	.2byte ITEM_ESCAPE_ROPE
# 23 "data/maps/ThreeIsland_Mart/scripts.pory"
	.2byte ITEM_MAX_REPEL
# 24 "data/maps/ThreeIsland_Mart/scripts.pory"
	.2byte ITEM_NONE
# 25 "data/maps/ThreeIsland_Mart/scripts.pory"
	release
# 26 "data/maps/ThreeIsland_Mart/scripts.pory"
	end
# 27 "data/maps/ThreeIsland_Mart/scripts.pory"

# 28 "data/maps/ThreeIsland_Mart/scripts.pory"
ThreeIsland_Mart_EventScript_Picnicker::
# 29 "data/maps/ThreeIsland_Mart/scripts.pory"
	msgbox ThreeIsland_Mart_Text_TrueThatCeldadonDeptStoreBigger, MSGBOX_NPC
# 30 "data/maps/ThreeIsland_Mart/scripts.pory"
	end
# 31 "data/maps/ThreeIsland_Mart/scripts.pory"

# 32 "data/maps/ThreeIsland_Mart/scripts.pory"
ThreeIsland_Mart_EventScript_BugCatcher::
# 33 "data/maps/ThreeIsland_Mart/scripts.pory"
	msgbox ThreeIsland_Mart_Text_PeopleHealWithBerriesFromForest, MSGBOX_NPC
# 34 "data/maps/ThreeIsland_Mart/scripts.pory"
	end
# 35 "data/maps/ThreeIsland_Mart/scripts.pory"

# 36 "data/maps/ThreeIsland_Mart/scripts.pory"
ThreeIsland_Mart_EventScript_Youngster::
# 37 "data/maps/ThreeIsland_Mart/scripts.pory"
	msgbox ThreeIsland_Mart_Text_BikersWereAboutToTrashMart, MSGBOX_NPC
# 38 "data/maps/ThreeIsland_Mart/scripts.pory"
	end
