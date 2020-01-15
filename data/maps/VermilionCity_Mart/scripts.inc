VermilionCity_Mart_MapScripts:: @ 816B653
	.byte 0

VermilionCity_Mart_EventScript_16B654:: @ 816B654
	msgbox gUnknown_8194B65, MSGBOX_NPC
	end

VermilionCity_Mart_EventScript_16B65D:: @ 816B65D
	msgbox gUnknown_8194A77, MSGBOX_NPC
	end

VermilionCity_Mart_EventScript_16B666:: @ 816B666
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16B68C
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
Items_16B68C:: @ 816B68C
	.2byte ITEM_POKE_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_ICE_HEAL
	.2byte ITEM_REPEL
	.2byte ITEM_NONE
	release
	end
