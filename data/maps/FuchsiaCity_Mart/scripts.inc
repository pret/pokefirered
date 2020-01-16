FuchsiaCity_Mart_MapScripts:: @ 816D4E0
	.byte 0

FuchsiaCity_Mart_EventScript_16D4E1:: @ 816D4E1
	msgbox gUnknown_8198134, MSGBOX_NPC
	end

FuchsiaCity_Mart_EventScript_16D4EA:: @ 816D4EA
	msgbox gUnknown_81980BC, MSGBOX_NPC
	end

FuchsiaCity_Mart_EventScript_16D4F3:: @ 816D4F3
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16D518
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
Items_16D518:: @ 816D518
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end
