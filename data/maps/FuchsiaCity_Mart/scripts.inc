FuchsiaCity_Mart_MapScripts:: @ 816D4E0
	.byte 0

FuchsiaCity_Mart_EventScript_CooltrainerF:: @ 816D4E1
	msgbox FuchsiaCity_Mart_Text_DidYouTryXSpeed, MSGBOX_NPC
	end

FuchsiaCity_Mart_EventScript_Gentleman:: @ 816D4EA
	msgbox FuchsiaCity_Mart_Text_DontTheyHaveSafariZonePennants, MSGBOX_NPC
	end

FuchsiaCity_Mart_EventScript_Clerk:: @ 816D4F3
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart FuchsiaCity_Mart_Items
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
FuchsiaCity_Mart_Items:: @ 816D518
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end
