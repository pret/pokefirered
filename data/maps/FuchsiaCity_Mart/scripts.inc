FuchsiaCity_Mart_MapScripts::
	.byte 0

FuchsiaCity_Mart_EventScript_CooltrainerF::
	msgbox FuchsiaCity_Mart_Text_DidYouTryXSpeed, MSGBOX_NPC
	end

FuchsiaCity_Mart_EventScript_Gentleman::
	msgbox FuchsiaCity_Mart_Text_DontTheyHaveSafariZonePennants, MSGBOX_NPC
	end

FuchsiaCity_Mart_EventScript_Clerk::
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	setvar VAR_0x8004, 1
	specialvar VAR_RESULT, GetCorpseRunFieldBlockReason
	goto_if_eq VAR_RESULT, 0, .MartContinue
	msgbox Text_CorpseRun_BlockMart
	release
	end
.MartContinue::
	message Text_MayIHelpYou
	waitmessage
	pokemart FuchsiaCity_Mart_Items
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
FuchsiaCity_Mart_Items::
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end
