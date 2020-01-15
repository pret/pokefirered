SaffronCity_Mart_MapScripts:: @ 816EFA2
	.byte 0

SaffronCity_Mart_EventScript_16EFA3:: @ 816EFA3
	msgbox gUnknown_819BFF1, MSGBOX_NPC
	end

SaffronCity_Mart_EventScript_16EFAC:: @ 816EFAC
	msgbox gUnknown_819BF8F, MSGBOX_NPC
	end

SaffronCity_Mart_EventScript_16EFB5:: @ 816EFB5
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16EFDC
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
Items_16EFDC:: @ 816EFDC
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end
