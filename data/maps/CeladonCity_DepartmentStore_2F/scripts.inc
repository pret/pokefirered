# 1 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"

# 2 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
CeladonCity_DepartmentStore_2F_MapScripts::
# 3 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.byte 0
# 4 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"

# 5 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
CeladonCity_DepartmentStore_2F_EventScript_UnusedNPC::
# 6 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	msgbox CeladonCity_DepartmentStore_2F_Text_SuperRepelMorePowerfulRepel, MSGBOX_NPC
# 7 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	end
# 8 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"

# 9 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
CeladonCity_DepartmentStore_2F_EventScript_Lass::
# 10 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	msgbox CeladonCity_DepartmentStore_2F_Text_BuyReviveForLongOutings, MSGBOX_NPC
# 11 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	end
# 12 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"

# 13 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
CeladonCity_DepartmentStore_2F_EventScript_FloorSign::
# 14 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	msgbox CeladonCity_DepartmentStore_2F_Text_FloorSign, MSGBOX_SIGN
# 15 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	end
# 16 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"

# 17 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
CeladonCity_DepartmentStore_2F_EventScript_ClerkItems::
# 18 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 19 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	lock
# 20 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	faceplayer
# 21 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	message Text_MayIHelpYou
# 22 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	waitmessage
# 23 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	pokemart CeladonCity_DepartmentStore_2F_Items
# 24 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	msgbox Text_PleaseComeAgain
# 25 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	release
# 26 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	end
# 27 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"

# 28 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.align 2
# 29 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
CeladonCity_DepartmentStore_2F_Items::
# 30 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_GREAT_BALL
# 31 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_SUPER_POTION
# 32 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_REVIVE
# 33 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_ANTIDOTE
# 34 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_PARALYZE_HEAL
# 35 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_AWAKENING
# 36 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_BURN_HEAL
# 37 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_ICE_HEAL
# 38 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_SUPER_REPEL
# 39 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_NONE
# 40 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	release
# 41 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	end
# 42 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"

# 43 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
CeladonCity_DepartmentStore_2F_EventScript_ClerkTMs::
# 44 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 45 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	lock
# 46 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	faceplayer
# 47 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	message Text_MayIHelpYou
# 48 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	waitmessage
# 49 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	pokemart CeladonCity_DepartmentStore_2F_TMs
# 50 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	msgbox Text_PleaseComeAgain
# 51 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	release
# 52 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	end
# 53 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"

# 54 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.align 2
# 55 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
CeladonCity_DepartmentStore_2F_TMs::
# 56 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_TM05
# 57 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_TM15
# 58 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_TM28
# 59 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_TM31
# 60 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_TM43
# 61 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_TM45
# 62 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	.2byte ITEM_NONE
# 63 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	release
# 64 "data/maps/CeladonCity_DepartmentStore_2F/scripts.pory"
	end
