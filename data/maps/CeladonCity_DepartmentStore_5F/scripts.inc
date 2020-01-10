CeladonCity_DepartmentStore_5F_MapScripts:: @ 816BC40
	.byte 0

CeladonCity_DepartmentStore_5F_EventScript_16BC41:: @ 816BC41
	msgbox gUnknown_8195BBA, 2
	end

CeladonCity_DepartmentStore_5F_EventScript_16BC4A:: @ 816BC4A
	msgbox gUnknown_8195CA0, 2
	end

CeladonCity_DepartmentStore_5F_EventScript_16BC53:: @ 816BC53
	msgbox gUnknown_8195D14, 3
	end

CeladonCity_DepartmentStore_5F_EventScript_16BC5C:: @ 816BC5C
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16BC84
	msgbox gUnknown_81A5190
	release
	end

	.align 2
Items_16BC84:: @ 816BC84
	.2byte ITEM_X_ATTACK
	.2byte ITEM_X_DEFEND
	.2byte ITEM_X_SPEED
	.2byte ITEM_X_SPECIAL
	.2byte ITEM_X_ACCURACY
	.2byte ITEM_GUARD_SPEC
	.2byte ITEM_DIRE_HIT
	.2byte ITEM_NONE
	release
	end

CeladonCity_DepartmentStore_5F_EventScript_16BC96:: @ 816BC96
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16BCBC
	msgbox gUnknown_81A5190
	release
	end

	.align 2
Items_16BCBC:: @ 816BCBC
	.2byte ITEM_HP_UP
	.2byte ITEM_PROTEIN
	.2byte ITEM_IRON
	.2byte ITEM_CALCIUM
	.2byte ITEM_ZINC
	.2byte ITEM_CARBOS
	.2byte ITEM_NONE
	release
	end
