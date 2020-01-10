CeruleanCity_Mart_MapScripts:: @ 816AC9D
	.byte 0

CeruleanCity_Mart_EventScript_16AC9E:: @ 816AC9E
	msgbox gUnknown_81929C2, MSGBOX_NPC
	end

CeruleanCity_Mart_EventScript_16ACA7:: @ 816ACA7
	msgbox gUnknown_8192A79, MSGBOX_NPC
	end

CeruleanCity_Mart_EventScript_16ACB0:: @ 816ACB0
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16ACD8
	msgbox gUnknown_81A5190
	release
	end

	.align 2
Items_16ACD8:: @ 816ACD8
	.2byte ITEM_POKE_BALL
	.2byte ITEM_SUPER_POTION
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
