CeruleanCity_House5_MapScripts:: @ 816AE4F
	.byte 0

CeruleanCity_House5_EventScript_16AE50:: @ 816AE50
	lock
	faceplayer
	checkflag FLAG_0x2BB
	goto_if 1, EventScript_16AEB7
	msgbox gUnknown_8192F67, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16AEAD
	checkflag FLAG_0x847
	goto_if 0, EventScript_16AEA3
	msgbox gUnknown_8193003
	setflag FLAG_0x2BB
	setorcopyvar VAR_0x8000, 372
	setorcopyvar VAR_0x8001, 1
	callstd 0
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_1A6BF9
	msgbox gUnknown_8193033
	release
	end

EventScript_16AEA3:: @ 816AEA3
	msgbox gUnknown_819321D
	release
	end

EventScript_16AEAD:: @ 816AEAD
	msgbox gUnknown_819325E
	release
	end

EventScript_16AEB7:: @ 816AEB7
	special sub_815F094
	msgbox gUnknown_81932C5
	goto EventScript_16AEC8
	end

EventScript_16AEC8:: @ 816AEC8
	message Text_1932F4
	waitmessage
	setvar VAR_0x8004, 5
	special sub_80CB7C4
	waitstate
	copyvar VAR_0x8000, VAR_RESULT
	compare_var_to_value VAR_0x8000, 0
	goto_if 1, EventScript_16AF6C
	compare_var_to_value VAR_0x8000, 1
	goto_if 1, EventScript_16AF80
	compare_var_to_value VAR_0x8000, 2
	goto_if 1, EventScript_16AF94
	compare_var_to_value VAR_0x8000, 3
	goto_if 1, EventScript_16AFA8
	compare_var_to_value VAR_0x8000, 4
	goto_if 1, EventScript_16AFBC
	compare_var_to_value VAR_0x8000, 5
	goto_if 1, EventScript_16AFD0
	compare_var_to_value VAR_0x8000, 6
	goto_if 1, EventScript_16AFE4
	compare_var_to_value VAR_0x8000, 7
	goto_if 1, EventScript_16AFF8
	compare_var_to_value VAR_0x8000, 8
	goto_if 1, EventScript_16B00C
	compare_var_to_value VAR_0x8000, 9
	goto_if 1, EventScript_16B020
	compare_var_to_value VAR_0x8000, 10
	goto_if 1, EventScript_16B034
	compare_var_to_value VAR_0x8000, 11
	goto_if 1, EventScript_16B048
	compare_var_to_value VAR_0x8000, 127
	goto_if 1, EventScript_16B048
	end

EventScript_16AF6C:: @ 816AF6C
	getitemname 0, ITEM_ENERGY_POWDER
	setvar VAR_0x8008, 30
	setvar VAR_0x8009, 50
	goto EventScript_16B055
	end

EventScript_16AF80:: @ 816AF80
	getitemname 0, ITEM_ENERGY_ROOT
	setvar VAR_0x8008, 31
	setvar VAR_0x8009, 80
	goto EventScript_16B055
	end

EventScript_16AF94:: @ 816AF94
	getitemname 0, ITEM_HEAL_POWDER
	setvar VAR_0x8008, 32
	setvar VAR_0x8009, 50
	goto EventScript_16B055
	end

EventScript_16AFA8:: @ 816AFA8
	getitemname 0, ITEM_REVIVAL_HERB
	setvar VAR_0x8008, 33
	setvar VAR_0x8009, 300
	goto EventScript_16B055
	end

EventScript_16AFBC:: @ 816AFBC
	getitemname 0, ITEM_PROTEIN
	setvar VAR_0x8008, 64
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16AFD0:: @ 816AFD0
	getitemname 0, ITEM_IRON
	setvar VAR_0x8008, 65
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16AFE4:: @ 816AFE4
	getitemname 0, ITEM_CARBOS
	setvar VAR_0x8008, 66
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16AFF8:: @ 816AFF8
	getitemname 0, ITEM_CALCIUM
	setvar VAR_0x8008, 67
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16B00C:: @ 816B00C
	getitemname 0, ITEM_ZINC
	setvar VAR_0x8008, 70
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16B020:: @ 816B020
	getitemname 0, ITEM_HP_UP
	setvar VAR_0x8008, 63
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16B034:: @ 816B034
	getitemname 0, ITEM_PP_UP
	setvar VAR_0x8008, 69
	setvar VAR_0x8009, 3000
	goto EventScript_16B055
	end

EventScript_16B048:: @ 816B048
	msgbox gUnknown_819342F
	special sub_815F114
	release
	end

EventScript_16B055:: @ 816B055
	msgbox gUnknown_819331E, 5
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16AEC8
	copyvar VAR_0x8004, VAR_0x8009
	specialvar VAR_RESULT, sub_815EEB0
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16B0CC
	setorcopyvar VAR_0x8000, VAR_0x8008
	setorcopyvar VAR_0x8001, 1
	callstd 0
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_16B0BF
	copyvar VAR_0x8004, VAR_0x8009
	special sub_815EF5C
	special sub_815F070
	msgbox gUnknown_819337A, 5
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_16AEC8
	msgbox gUnknown_81933FB
	special sub_815F114
	release
	end

EventScript_16B0BF:: @ 816B0BF
	msgbox gUnknown_81A5207
	special sub_815F114
	release
	end

EventScript_16B0CC:: @ 816B0CC
	msgbox gUnknown_8193352
	goto EventScript_16AEC8
	end

CeruleanCity_House5_EventScript_16B0DA:: @ 816B0DA
	lockall
	special sub_8110AB4
	compare_var_to_value VAR_RESULT, 2
	goto_if 1, EventScript_1A7AE0
	special sub_814EA7C
	waitstate
	releaseall
	end
