# 1 "data/maps/FuchsiaCity_Mart/scripts.pory"

# 2 "data/maps/FuchsiaCity_Mart/scripts.pory"
FuchsiaCity_Mart_MapScripts::
# 3 "data/maps/FuchsiaCity_Mart/scripts.pory"
	.byte 0
# 4 "data/maps/FuchsiaCity_Mart/scripts.pory"

# 5 "data/maps/FuchsiaCity_Mart/scripts.pory"
FuchsiaCity_Mart_EventScript_CooltrainerF::
# 6 "data/maps/FuchsiaCity_Mart/scripts.pory"
	msgbox FuchsiaCity_Mart_Text_DidYouTryXSpeed, MSGBOX_NPC
# 7 "data/maps/FuchsiaCity_Mart/scripts.pory"
	end
# 8 "data/maps/FuchsiaCity_Mart/scripts.pory"

# 9 "data/maps/FuchsiaCity_Mart/scripts.pory"
FuchsiaCity_Mart_EventScript_Gentleman::
# 10 "data/maps/FuchsiaCity_Mart/scripts.pory"
	msgbox FuchsiaCity_Mart_Text_DontTheyHaveSafariZonePennants, MSGBOX_NPC
# 11 "data/maps/FuchsiaCity_Mart/scripts.pory"
	end
# 12 "data/maps/FuchsiaCity_Mart/scripts.pory"

# 13 "data/maps/FuchsiaCity_Mart/scripts.pory"
FuchsiaCity_Mart_EventScript_Clerk::
# 14 "data/maps/FuchsiaCity_Mart/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 15 "data/maps/FuchsiaCity_Mart/scripts.pory"
	lock
# 16 "data/maps/FuchsiaCity_Mart/scripts.pory"
	faceplayer
# 17 "data/maps/FuchsiaCity_Mart/scripts.pory"
	message Text_MayIHelpYou
# 18 "data/maps/FuchsiaCity_Mart/scripts.pory"
	waitmessage
# 19 "data/maps/FuchsiaCity_Mart/scripts.pory"
	pokemart FuchsiaCity_Mart_Items
# 20 "data/maps/FuchsiaCity_Mart/scripts.pory"
	msgbox Text_PleaseComeAgain
# 21 "data/maps/FuchsiaCity_Mart/scripts.pory"
	release
# 22 "data/maps/FuchsiaCity_Mart/scripts.pory"
	end
# 23 "data/maps/FuchsiaCity_Mart/scripts.pory"

# 24 "data/maps/FuchsiaCity_Mart/scripts.pory"
	.align 2
# 25 "data/maps/FuchsiaCity_Mart/scripts.pory"
FuchsiaCity_Mart_Items::
# 26 "data/maps/FuchsiaCity_Mart/scripts.pory"
	.2byte ITEM_ULTRA_BALL
# 27 "data/maps/FuchsiaCity_Mart/scripts.pory"
	.2byte ITEM_GREAT_BALL
# 28 "data/maps/FuchsiaCity_Mart/scripts.pory"
	.2byte ITEM_SUPER_POTION
# 29 "data/maps/FuchsiaCity_Mart/scripts.pory"
	.2byte ITEM_REVIVE
# 30 "data/maps/FuchsiaCity_Mart/scripts.pory"
	.2byte ITEM_FULL_HEAL
# 31 "data/maps/FuchsiaCity_Mart/scripts.pory"
	.2byte ITEM_MAX_REPEL
# 32 "data/maps/FuchsiaCity_Mart/scripts.pory"
	.2byte ITEM_NONE
# 33 "data/maps/FuchsiaCity_Mart/scripts.pory"
	release
# 34 "data/maps/FuchsiaCity_Mart/scripts.pory"
	end
