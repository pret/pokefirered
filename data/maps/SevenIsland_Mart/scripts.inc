SevenIsland_Mart_MapScripts:: @ 8170B30
	.byte 0

SevenIsland_Mart_EventScript_170B31:: @ 8170B31
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	lock
	faceplayer
	message Text_1A6211
	waitmessage
	pokemart Items_170B58
	msgbox gUnknown_81A5190
	release
	end

	.align 2
Items_170B58:: @ 8170B58
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_FULL_RESTORE
	.2byte ITEM_MAX_POTION
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end

SevenIsland_Mart_EventScript_170B6E:: @ 8170B6E
	msgbox gUnknown_81A0A4F, 2
	end

SevenIsland_Mart_EventScript_170B77:: @ 8170B77
	msgbox gUnknown_81A0ACC, 2
	end

SevenIsland_Mart_EventScript_170B80:: @ 8170B80
	msgbox gUnknown_81A0B09, 2
	end
