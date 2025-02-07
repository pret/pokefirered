# 1 "data/maps/SaffronCity_Mart/scripts.pory"

# 2 "data/maps/SaffronCity_Mart/scripts.pory"
SaffronCity_Mart_MapScripts::
# 3 "data/maps/SaffronCity_Mart/scripts.pory"
	.byte 0
# 4 "data/maps/SaffronCity_Mart/scripts.pory"

# 5 "data/maps/SaffronCity_Mart/scripts.pory"
SaffronCity_Mart_EventScript_Lass::
# 6 "data/maps/SaffronCity_Mart/scripts.pory"
	msgbox SaffronCity_Mart_Text_ReviveIsCostly, MSGBOX_NPC
# 7 "data/maps/SaffronCity_Mart/scripts.pory"
	end
# 8 "data/maps/SaffronCity_Mart/scripts.pory"

# 9 "data/maps/SaffronCity_Mart/scripts.pory"
SaffronCity_Mart_EventScript_Youngster::
# 10 "data/maps/SaffronCity_Mart/scripts.pory"
	msgbox SaffronCity_Mart_Text_MaxRepelMoreEffectiveThanSuper, MSGBOX_NPC
# 11 "data/maps/SaffronCity_Mart/scripts.pory"
	end
# 12 "data/maps/SaffronCity_Mart/scripts.pory"

# 13 "data/maps/SaffronCity_Mart/scripts.pory"
SaffronCity_Mart_EventScript_Clerk::
# 14 "data/maps/SaffronCity_Mart/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 15 "data/maps/SaffronCity_Mart/scripts.pory"
	lock
# 16 "data/maps/SaffronCity_Mart/scripts.pory"
	faceplayer
# 17 "data/maps/SaffronCity_Mart/scripts.pory"
	message Text_MayIHelpYou
# 18 "data/maps/SaffronCity_Mart/scripts.pory"
	waitmessage
# 19 "data/maps/SaffronCity_Mart/scripts.pory"
	pokemart SaffronCity_Mart_Items
# 20 "data/maps/SaffronCity_Mart/scripts.pory"
	msgbox Text_PleaseComeAgain
# 21 "data/maps/SaffronCity_Mart/scripts.pory"
	release
# 22 "data/maps/SaffronCity_Mart/scripts.pory"
	end
# 23 "data/maps/SaffronCity_Mart/scripts.pory"

# 24 "data/maps/SaffronCity_Mart/scripts.pory"
	.align 2
# 25 "data/maps/SaffronCity_Mart/scripts.pory"
SaffronCity_Mart_Items::
# 26 "data/maps/SaffronCity_Mart/scripts.pory"
	.2byte ITEM_GREAT_BALL
# 27 "data/maps/SaffronCity_Mart/scripts.pory"
	.2byte ITEM_HYPER_POTION
# 28 "data/maps/SaffronCity_Mart/scripts.pory"
	.2byte ITEM_REVIVE
# 29 "data/maps/SaffronCity_Mart/scripts.pory"
	.2byte ITEM_FULL_HEAL
# 30 "data/maps/SaffronCity_Mart/scripts.pory"
	.2byte ITEM_ESCAPE_ROPE
# 31 "data/maps/SaffronCity_Mart/scripts.pory"
	.2byte ITEM_MAX_REPEL
# 32 "data/maps/SaffronCity_Mart/scripts.pory"
	.2byte ITEM_NONE
# 33 "data/maps/SaffronCity_Mart/scripts.pory"
	release
# 34 "data/maps/SaffronCity_Mart/scripts.pory"
	end
