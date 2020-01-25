VermilionCity_Mart_MapScripts:: @ 816B653
	.byte 0

VermilionCity_Mart_EventScript_CooltrainerF:: @ 816B654
	msgbox VermilionCity_Mart_Text_MonsGoodOrBadDependingOnTrainer, MSGBOX_NPC
	end

VermilionCity_Mart_EventScript_BaldingMan:: @ 816B65D
	msgbox VermilionCity_Mart_Text_TeamRocketAreWickedPeople, MSGBOX_NPC
	end

VermilionCity_Mart_EventScript_Clerk:: @ 816B666
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart VermilionCity_Mart_Items
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
VermilionCity_Mart_Items:: @ 816B68C
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
