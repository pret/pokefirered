SaffronCity_Mart_MapScripts:: @ 816EFA2
	.byte 0

SaffronCity_Mart_EventScript_16EFA3:: @ 816EFA3
	msgbox gUnknown_819BFF1, 2
	end

SaffronCity_Mart_EventScript_16EFAC:: @ 816EFAC
	msgbox gUnknown_819BF8F, 2
	end

SaffronCity_Mart_EventScript_16EFB5:: @ 816EFB5
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16EFDC
	msgbox gUnknown_81A5190
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
