EventScript_1A666F:: @ 81A666F
	copyvar VAR_MON_BOX_POS, VAR_MON_BOX_ID
	return

EventScript_1A6675:: @ 81A6675
	copyvar VAR_MON_BOX_ID, VAR_MON_BOX_POS
	return

Std_ObtainItem:: @ 81A667B
	copyvar VAR_MON_BOX_POS, VAR_MON_BOX_ID
	textcolor 3
	additem VAR_0x8000, VAR_0x8001
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_1A6697
	copyvar VAR_MON_BOX_ID, VAR_MON_BOX_POS
	return

EventScript_1A6697:: @ 81A6697
	bufferitemnameplural 1, VAR_0x8000, VAR_0x8001
	checkitemtype VAR_0x8000
	call EventScript_1A66BC
	compare VAR_0x8007, 1
	call_if_eq EventScript_1A6749
	compare VAR_0x8007, 0
	call_if_eq EventScript_1A675E
	return

EventScript_1A66BC:: @ 81A66BC
	switch VAR_RESULT
	case POCKET_ITEMS, EventScript_1A66F9
	case POCKET_KEY_ITEMS, EventScript_1A6709
	case POCKET_POKE_BALLS, EventScript_1A6719
	case POCKET_TM_CASE, EventScript_1A6729
	case POCKET_BERRY_POUCH, EventScript_1A6739
	end

EventScript_1A66F9:: @ 81A66F9
	getstdstring 2, 24
	compare VAR_0x8007, 1
	call_if_eq EventScript_1A6764
	return

EventScript_1A6709:: @ 81A6709
	getstdstring 2, 25
	compare VAR_0x8007, 1
	call_if_eq EventScript_1A6764
	return

EventScript_1A6719:: @ 81A6719
	getstdstring 2, 26
	compare VAR_0x8007, 1
	call_if_eq EventScript_1A6764
	return

EventScript_1A6729:: @ 81A6729
	getstdstring 2, 27
	compare VAR_0x8007, 1
	call_if_eq EventScript_1A6768
	return

EventScript_1A6739:: @ 81A6739
	getstdstring 2, 28
	compare VAR_0x8007, 1
	call_if_eq EventScript_1A6764
	return

EventScript_1A6749:: @ 81A6749
	message Text_ObtainedTheX
	waitfanfare
	waitmessage
	msgbox Text_PutItemAway
	setvar VAR_RESULT, 1
	return

EventScript_1A675E:: @ 81A675E
	setvar VAR_RESULT, 0
	return

EventScript_1A6764:: @ 81A6764
	playfanfare MUS_FANFA1
	return

EventScript_1A6768:: @ 81A6768
	playfanfare MUS_FANFA1
	return

Std_ObtainDecoration:: @ 81A676C
	adddecor VAR_0x8000
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_1A677A
	return

EventScript_1A677A:: @ 81A677A
	getdecorname 1, VAR_0x8000
	compare VAR_0x8007, 1
	call_if_eq EventScript_1A6795
	compare VAR_0x8007, 0
	call_if_eq EventScript_1A67AD
	return

EventScript_1A6795:: @ 81A6795
	playfanfare MUS_FANFA4
	message Text_1A52F0
	waitfanfare
	waitmessage
	msgbox gUnknown_81A532F
	setvar VAR_RESULT, 1
	return

EventScript_1A67AD:: @ 81A67AD
	setvar VAR_RESULT, 0
	return

Std_FindItem:: @ 81A67B3
	lock
	faceplayer
	waitse
	copyvar VAR_0x8004, VAR_0x8000
	copyvar VAR_0x8005, VAR_0x8001
	checkitemspace VAR_0x8000, VAR_0x8001
	copyvar VAR_0x8007, VAR_RESULT
	getitemname 1, VAR_0x8000
	checkitemtype VAR_0x8000
	call EventScript_1A66BC
	compare VAR_0x8007, 1
	call_if_eq EventScript_1A67EE
	compare VAR_0x8007, 0
	call_if_eq EventScript_1A682D
	release
	return

EventScript_1A67EE:: @ 81A67EE
	removeobject VAR_LAST_TALKED
	additem VAR_0x8004, VAR_0x8005
	specialvar VAR_RESULT, Special_ItemIsTM_GetMoveName
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_0x8008, 1
	call_if_eq EventScript_1A6821
	compare VAR_0x8008, 0
	call_if_eq EventScript_1A6827
	waitfanfare
	waitmessage
	msgbox Text_PutItemAway
	return

EventScript_1A6821:: @ 81A6821
	message Text_1A63E8
	return

EventScript_1A6827:: @ 81A6827
	message Text_FoundOneItem
	return

EventScript_1A682D:: @ 81A682D
	msgbox Text_ObtainedTheX
	msgbox Text_TooBadBagFull
	setvar VAR_RESULT, 0
	return

EventScript_PickUpHiddenItem:: @ 81A6843
	lockall
	textcolor 3
	waitse
	compare VAR_0x8005, 0
	goto_if_eq EventScript_PickUpHiddenCoins
	call EventScript_GiveItem
	compare VAR_0x8007, 1
	goto_if_eq EventScript_ItemInPocketMessage
	compare VAR_0x8007, 0
	goto_if_eq EventScript_BagIsFullMessage
	end

EventScript_GiveItem::
	additem VAR_0x8005, VAR_0x8006
	copyvar VAR_0x8007, VAR_RESULT
	getitemname 1, VAR_0x8005
	checkitemtype VAR_0x8005
	call EventScript_1A66BC
	return

EventScript_ItemInPocketMessage::
	compare VAR_0x8006, 1
	call_if_eq EventScript_FoundSingleItemMessage
	compare VAR_0x8006, 1
	call_if_ne EventScript_FoundMultipleItemsMessage
	waitfanfare
	waitmessage
	msgbox Text_PutItemAway
	special Special_SetHiddenItemFlag
	releaseall
	end

EventScript_FoundSingleItemMessage::
	message Text_FoundOneItem
	return

EventScript_FoundCoinsMessage::
	getnumberstring 0, VAR_0x8006
	message Text_FoundXCoins
	return

EventScript_FoundMultipleItemsMessage::
	getnumberstring 0, VAR_0x8006
	message Text_FoundXItems
	return

EventScript_BagIsFullMessage::
	msgbox Text_FoundOneItem
	msgbox Text_TooBadBagFull
	setvar VAR_RESULT, 0
	releaseall
	end

EventScript_PickUpHiddenCoins::
	goto_if_unset FLAG_GOT_COIN_CASE, EventScript_HiddenCoinsButNoCoinCase
	checkcoins VAR_RESULT
	specialvar VAR_RESULT, Special_CheckAddCoins
	compare VAR_RESULT, 0
	goto_if_eq EventScript_HiddenCoinsButTheCoinCaseIsFull
	givecoins VAR_0x8006
	getstdstring 1, 0x17
	call EventScript_1A6764
	call EventScript_FoundCoinsMessage
	waitfanfare
	waitmessage
	msgbox Text_PutCoinsAwayInCoinCase
	special Special_SetHiddenItemFlag
	releaseall
	end

EventScript_HiddenCoinsButTheCoinCaseIsFull::
	getnumberstring 0, VAR_0x8006
	getstdstring 1, 0x17
	msgbox Text_FoundXCoins
	msgbox Text_CoinCaseIsFull
	setvar VAR_RESULT, 0
	releaseall
	end

EventScript_HiddenCoinsButNoCoinCase::
	getnumberstring 0, VAR_0x8006
	getstdstring 1, 0x17
	msgbox Text_FoundXCoins
	msgbox Text_NothingToPutThemIn
	setvar VAR_RESULT, 0
	releaseall
	end
