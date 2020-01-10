VermilionCity_Mart_MapScripts:: @ 816B653
	.byte 0

VermilionCity_Mart_EventScript_16B654:: @ 816B654
	msgbox gUnknown_8194B65, 2
	end

VermilionCity_Mart_EventScript_16B65D:: @ 816B65D
	msgbox gUnknown_8194A77, 2
	end

VermilionCity_Mart_EventScript_16B666:: @ 816B666
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16B68C
	msgbox gUnknown_81A5190
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
