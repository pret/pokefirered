# 1 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"

# 2 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
CeladonCity_DepartmentStore_4F_MapScripts::
# 3 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	.byte 0
# 4 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"

# 5 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
CeladonCity_DepartmentStore_4F_EventScript_Man::
# 6 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	msgbox CeladonCity_DepartmentStore_4F_Text_GettingPokeDollAsPresent, MSGBOX_NPC
# 7 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	end
# 8 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"

# 9 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
CeladonCity_DepartmentStore_4F_EventScript_Youngster::
# 10 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	msgbox CeladonCity_DepartmentStore_4F_Text_CanRunAwayWithPokeDoll, MSGBOX_NPC
# 11 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	end
# 12 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"

# 13 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
CeladonCity_DepartmentStore_4F_EventScript_FloorSign::
# 14 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	msgbox CeladonCity_DepartmentStore_4F_Text_FloorSign, MSGBOX_SIGN
# 15 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	end
# 16 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"

# 17 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
CeladonCity_DepartmentStore_4F_EventScript_Clerk::
# 18 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 19 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	lock
# 20 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	faceplayer
# 21 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	message Text_MayIHelpYou
# 22 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	waitmessage
# 23 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	pokemart CeladonCity_DepartmentStore_4F_Items
# 24 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	msgbox Text_PleaseComeAgain
# 25 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	release
# 26 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	end
# 27 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"

# 28 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	.align 2
# 29 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
CeladonCity_DepartmentStore_4F_Items::
# 30 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	.2byte ITEM_POKE_DOLL
# 31 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	.2byte ITEM_RETRO_MAIL
# 32 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	.2byte ITEM_FIRE_STONE
# 33 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	.2byte ITEM_THUNDER_STONE
# 34 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	.2byte ITEM_WATER_STONE
# 35 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	.2byte ITEM_LEAF_STONE
# 36 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	.2byte ITEM_NONE
# 37 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	release
# 38 "data/maps/CeladonCity_DepartmentStore_4F/scripts.pory"
	end
