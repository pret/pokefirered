SixIsland_Mart_MapScripts:: @ 8171E65
	.byte 0

SixIsland_Mart_EventScript_171E66:: @ 8171E66
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	lock
	faceplayer
	message Text_1A6211
	waitmessage
	pokemart Items_171E8C
	msgbox gUnknown_81A5190
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
	msgbox gUnknown_81A4271, 2
	end
