PewterCity_Mart_MapScripts:: @ 816A6CD
	.byte 0

PewterCity_Mart_EventScript_16A6CE:: @ 816A6CE
	loadword 0, gUnknown_81914DE
	callstd 2
	end

PewterCity_Mart_EventScript_16A6D7:: @ 816A6D7
	loadword 0, gUnknown_8191541
	callstd 2
	end

PewterCity_Mart_EventScript_16A6E0:: @ 816A6E0
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	lock
	faceplayer
	message Text_1A6211
	waitmessage
	pokemart Items_16A708
	loadword 0, gUnknown_81A5190
	callstd 4
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
