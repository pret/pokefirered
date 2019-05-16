ThreeIsland_Mart_MapScripts:: @ 817188C
	.byte 0

ThreeIsland_Mart_EventScript_17188D:: @ 817188D
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	lock
	faceplayer
	message Text_1A6211
	waitmessage
	pokemart Items_1718B4
	msgbox gUnknown_81A5190
	release
	end

	.align 2
Items_1718B4:: @ 81718B4
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end

ThreeIsland_Mart_EventScript_1718C4:: @ 81718C4
	msgbox gUnknown_81A3114, 2
	end

ThreeIsland_Mart_EventScript_1718CD:: @ 81718CD
	msgbox gUnknown_81A315C, 2
	end

ThreeIsland_Mart_EventScript_1718D6:: @ 81718D6
	msgbox gUnknown_81A31F0, 2
	end
