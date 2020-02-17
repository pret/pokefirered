SaffronCity_Mart_MapScripts:: @ 816EFA2
	.byte 0

SaffronCity_Mart_EventScript_Lass:: @ 816EFA3
	msgbox SaffronCity_Mart_Text_ReviveIsCostly, MSGBOX_NPC
	end

SaffronCity_Mart_EventScript_Youngster:: @ 816EFAC
	msgbox SaffronCity_Mart_Text_MaxRepelMoreEffectiveThanSuper, MSGBOX_NPC
	end

SaffronCity_Mart_EventScript_Clerk:: @ 816EFB5
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart SaffronCity_Mart_Items
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
SaffronCity_Mart_Items:: @ 816EFDC
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end
