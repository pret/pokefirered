FuchsiaCity_Mart_MapScripts:: @ 816D4E0
	.byte 0

FuchsiaCity_Mart_EventScript_16D4E1:: @ 816D4E1
	msgbox gUnknown_8198134, 2
	end

FuchsiaCity_Mart_EventScript_16D4EA:: @ 816D4EA
	msgbox gUnknown_81980BC, 2
	end

FuchsiaCity_Mart_EventScript_16D4F3:: @ 816D4F3
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	message Text_1A6211
	waitmessage
	pokemart Items_16D518
	msgbox gUnknown_81A5190
	release
	end

	.align 2
Items_16D518:: @ 816D518
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end
