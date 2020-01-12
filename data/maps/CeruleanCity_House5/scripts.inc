CeruleanCity_House5_MapScripts:: @ 816AE4F
	.byte 0

CeruleanCity_House5_EventScript_16AE50:: @ 816AE50
	lock
	faceplayer
	goto_if_set FLAG_GOT_POWDER_JAR, EventScript_16AEB7
	msgbox gUnknown_8192F67, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16AEAD
	goto_if_unset FLAG_SYS_GOT_BERRY_POUCH, EventScript_16AEA3
	msgbox gUnknown_8193003
	setflag FLAG_GOT_POWDER_JAR
	giveitem ITEM_POWDER_JAR
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_BagIsFull
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
	special Special_ListMenu
	waitstate
	switch VAR_RESULT
	case 0, EventScript_16AF6C
	case 1, EventScript_16AF80
	case 2, EventScript_16AF94
	case 3, EventScript_16AFA8
	case 4, EventScript_16AFBC
	case 5, EventScript_16AFD0
	case 6, EventScript_16AFE4
	case 7, EventScript_16AFF8
	case 8, EventScript_16B00C
	case 9, EventScript_16B020
	case 10, EventScript_16B034
	case 11, EventScript_16B048
	case 127, EventScript_16B048
	end

EventScript_16AF6C:: @ 816AF6C
	getitemname 0, ITEM_ENERGY_POWDER
	setvar VAR_0x8008, ITEM_ENERGY_POWDER
	setvar VAR_0x8009, 50
	goto EventScript_16B055
	end

EventScript_16AF80:: @ 816AF80
	getitemname 0, ITEM_ENERGY_ROOT
	setvar VAR_0x8008, ITEM_ENERGY_ROOT
	setvar VAR_0x8009, 80
	goto EventScript_16B055
	end

EventScript_16AF94:: @ 816AF94
	getitemname 0, ITEM_HEAL_POWDER
	setvar VAR_0x8008, ITEM_HEAL_POWDER
	setvar VAR_0x8009, 50
	goto EventScript_16B055
	end

EventScript_16AFA8:: @ 816AFA8
	getitemname 0, ITEM_REVIVAL_HERB
	setvar VAR_0x8008, ITEM_REVIVAL_HERB
	setvar VAR_0x8009, 300
	goto EventScript_16B055
	end

EventScript_16AFBC:: @ 816AFBC
	getitemname 0, ITEM_PROTEIN
	setvar VAR_0x8008, ITEM_PROTEIN
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16AFD0:: @ 816AFD0
	getitemname 0, ITEM_IRON
	setvar VAR_0x8008, ITEM_IRON
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16AFE4:: @ 816AFE4
	getitemname 0, ITEM_CARBOS
	setvar VAR_0x8008, ITEM_CARBOS
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16AFF8:: @ 816AFF8
	getitemname 0, ITEM_CALCIUM
	setvar VAR_0x8008, ITEM_CALCIUM
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16B00C:: @ 816B00C
	getitemname 0, ITEM_ZINC
	setvar VAR_0x8008, ITEM_ZINC
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16B020:: @ 816B020
	getitemname 0, ITEM_HP_UP
	setvar VAR_0x8008, ITEM_HP_UP
	setvar VAR_0x8009, 1000
	goto EventScript_16B055
	end

EventScript_16B034:: @ 816B034
	getitemname 0, ITEM_PP_UP
	setvar VAR_0x8008, ITEM_PP_UP
	setvar VAR_0x8009, 3000
	goto EventScript_16B055
	end

EventScript_16B048:: @ 816B048
	msgbox gUnknown_819342F
	special sub_815F114
	release
	end

EventScript_16B055:: @ 816B055
	msgbox gUnknown_819331E, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16AEC8
	copyvar VAR_0x8004, VAR_0x8009
	specialvar VAR_RESULT, sub_815EEB0
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16B0CC
	giveitem VAR_0x8008
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16B0BF
	copyvar VAR_0x8004, VAR_0x8009
	special sub_815EF5C
	special sub_815F070
	msgbox gUnknown_819337A, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_16AEC8
	msgbox gUnknown_81933FB
	special sub_815F114
	release
	end

EventScript_16B0BF:: @ 816B0BF
	msgbox Text_BagIsFull
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
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_814EA7C
	waitstate
	releaseall
	end
