PewterCity_Mart_MapScripts:: @ 816A6CD
	.byte 0

PewterCity_Mart_EventScript_16A6CE:: @ 816A6CE
	msgbox gUnknown_81914DE, MSGBOX_NPC
	end

PewterCity_Mart_EventScript_16A6D7:: @ 816A6D7
	msgbox gUnknown_8191541, MSGBOX_NPC
	end

PewterCity_Mart_EventScript_16A6E0:: @ 816A6E0
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16A708
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
Items_16A708:: @ 816A708
	.2byte ITEM_POKE_BALL
	.2byte ITEM_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_BURN_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_REPEL
	.2byte ITEM_NONE
	release
	end
