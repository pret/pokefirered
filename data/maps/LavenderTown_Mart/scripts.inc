LavenderTown_Mart_MapScripts:: @ 816B34F
	.byte 0

LavenderTown_Mart_EventScript_16B350:: @ 816B350
	msgbox gUnknown_8193CE5, 2
	end

LavenderTown_Mart_EventScript_16B359:: @ 816B359
	msgbox gUnknown_8193DB6, 2
	end

LavenderTown_Mart_EventScript_16B362:: @ 816B362
	msgbox gUnknown_8193DF1, 2
	end

LavenderTown_Mart_EventScript_16B36B:: @ 816B36B
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16B390
	msgbox gUnknown_81A5190
	release
	end

	.align 2
Items_16B390:: @ 816B390
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_BURN_HEAL
	.2byte ITEM_ICE_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_SUPER_REPEL
	.2byte ITEM_NONE
	release
	end
