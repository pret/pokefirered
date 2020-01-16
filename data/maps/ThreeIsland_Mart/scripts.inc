ThreeIsland_Mart_MapScripts:: @ 817188C
	.byte 0

ThreeIsland_Mart_EventScript_17188D:: @ 817188D
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_1718B4
	msgbox Text_PleaseComeAgain
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
	msgbox gUnknown_81A3114, MSGBOX_NPC
	end

ThreeIsland_Mart_EventScript_1718CD:: @ 81718CD
	msgbox gUnknown_81A315C, MSGBOX_NPC
	end

ThreeIsland_Mart_EventScript_1718D6:: @ 81718D6
	msgbox gUnknown_81A31F0, MSGBOX_NPC
	end
