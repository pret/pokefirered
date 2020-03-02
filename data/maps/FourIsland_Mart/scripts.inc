FourIsland_Mart_MapScripts:: @ 8171CAD
	.byte 0

FourIsland_Mart_EventScript_Clerk:: @ 8171CAE
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart FourIsland_Mart_Items
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
FourIsland_Mart_Items:: @ 8171CD4
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_FULL_RESTORE
	.2byte ITEM_MAX_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_ICE_HEAL
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end

FourIsland_Mart_EventScript_Camper:: @ 8171CE8
	msgbox FourIsland_Mart_Text_IcefallCaveIsFrigid, MSGBOX_NPC
	end
