SixIsland_Mart_MapScripts:: @ 8171E65
	.byte 0

SixIsland_Mart_EventScript_171E66:: @ 8171E66
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_171E8C
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
Items_171E8C:: @ 8171E8C
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_FULL_RESTORE
	.2byte ITEM_MAX_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_DREAM_MAIL
	.2byte ITEM_NONE
	release
	end

SixIsland_Mart_EventScript_171EA0:: @ 8171EA0
	msgbox gUnknown_81A4271, MSGBOX_NPC
	end
