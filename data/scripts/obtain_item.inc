@ Unused, handled by textcolor script cmd
EventScript_SaveTextColor:: @ 81A666F
	copyvar VAR_PREV_TEXT_COLOR, VAR_TEXT_COLOR
	return

EventScript_RestorePrevTextColor:: @ 81A6675
	copyvar VAR_TEXT_COLOR, VAR_PREV_TEXT_COLOR
	return

Std_ObtainItem:: @ 81A667B
	copyvar VAR_PREV_TEXT_COLOR, VAR_TEXT_COLOR
	textcolor 3
	additem VAR_0x8000, VAR_0x8001
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_ObtainItemMessage
	copyvar VAR_TEXT_COLOR, VAR_PREV_TEXT_COLOR
	return

EventScript_ObtainItemMessage:: @ 81A6697
	bufferitemnameplural 1, VAR_0x8000, VAR_0x8001
	checkitemtype VAR_0x8000
	call EventScript_BufferPocketNameTryFanfare
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_ObtainedItem
	compare VAR_0x8007, FALSE
	call_if_eq EventScript_NoRoomForItem
	return

EventScript_BufferPocketNameTryFanfare:: @ 81A66BC
	switch VAR_RESULT
	case POCKET_ITEMS, EventScript_BufferItemsPocket
	case POCKET_KEY_ITEMS, EventScript_BufferKeyItemsPocket
	case POCKET_POKE_BALLS, EventScript_BufferPokeBallsPocket
	case POCKET_TM_CASE, EventScript_BufferTMCase
	case POCKET_BERRY_POUCH, EventScript_BufferBerryPouch
	end

EventScript_BufferItemsPocket:: @ 81A66F9
	getstdstring 2, STDSTRING_ITEMS_POCKET
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferKeyItemsPocket:: @ 81A6709
	getstdstring 2, STDSTRING_KEY_ITEMS_POCKET
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferPokeBallsPocket:: @ 81A6719
	getstdstring 2, STDSTRING_POKEBALLS_POCKET
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferTMCase:: @ 81A6729
	getstdstring 2, STDSTRING_TM_CASE
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedTMHM
	return

EventScript_BufferBerryPouch:: @ 81A6739
	getstdstring 2, STDSTRING_BERRY_POUCH
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_ObtainedItem:: @ 81A6749
	message Text_ObtainedTheX
	waitfanfare
	waitmessage
	msgbox Text_PutItemAway
	setvar VAR_RESULT, 1
	return

EventScript_NoRoomForItem:: @ 81A675E
	setvar VAR_RESULT, FALSE
	return

EventScript_PlayFanfareObtainedItem:: @ 81A6764
	playfanfare MUS_LEVEL_UP
	return

EventScript_PlayFanfareObtainedTMHM:: @ 81A6768
	playfanfare MUS_LEVEL_UP
	return

Std_ObtainDecoration:: @ 81A676C
	adddecor VAR_0x8000
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_ObtainDecorMessage
	return

EventScript_ObtainDecorMessage:: @ 81A677A
	getdecorname 1, VAR_0x8000
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_ObtainedDecor
	compare VAR_0x8007, FALSE
	call_if_eq EventScript_NoRoomForDecor
	return

EventScript_ObtainedDecor:: @ 81A6795
	playfanfare MUS_OBTAIN_ITEM
	message Text_ObtainedTheDecor
	waitfanfare
	waitmessage
	msgbox Text_DecorTransferredToPC
	setvar VAR_RESULT, TRUE
	return

EventScript_NoRoomForDecor:: @ 81A67AD
	setvar VAR_RESULT, FALSE
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
	call EventScript_BufferPocketNameTryFanfare
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PickUpItem
	compare VAR_0x8007, FALSE
	call_if_eq EventScript_NoRoomToPickUpItem
	release
	return

EventScript_PickUpItem:: @ 81A67EE
	removeobject VAR_LAST_TALKED
	additem VAR_0x8004, VAR_0x8005
	specialvar VAR_RESULT, BufferTMHMMoveName
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_0x8008, TRUE
	call_if_eq EventScript_FoundTMHM
	compare VAR_0x8008, FALSE
	call_if_eq EventScript_FoundItem
	callnative CreateItemIconOnFindMessage
	waitfanfare
	waitmessage
	msgbox Text_PutItemAway
	callnative DestroyItemIconOnFindMessage
	return

EventScript_FoundTMHM:: @ 81A6821
	message Text_FoundTMHMContainsMove
	return

EventScript_FoundItem:: @ 81A6827
	message Text_FoundOneItem
	return

EventScript_NoRoomToPickUpItem:: @ 81A682D
	msgbox Text_ObtainedTheX
	msgbox Text_TooBadBagFull
	setvar VAR_RESULT, FALSE
	return

EventScript_HiddenItemScript:: @ 81A6843
	lockall
	textcolor 3
	waitse
	compare VAR_0x8005, 0
	goto_if_eq EventScript_TryPickUpHiddenCoins
	call EventScript_TryPickUpHiddenItem
	compare VAR_0x8007, TRUE
	goto_if_eq EventScript_PickedUpHiddenItem
	compare VAR_0x8007, FALSE
	goto_if_eq EventScript_NoRoomForHiddenItem
	end

EventScript_TryPickUpHiddenItem::
	additem VAR_0x8005, VAR_0x8006
	copyvar VAR_0x8007, VAR_RESULT
	getitemname 1, VAR_0x8005
	checkitemtype VAR_0x8005
	call EventScript_BufferPocketNameTryFanfare
	return

EventScript_PickedUpHiddenItem::
	compare VAR_0x8006, 1
	call_if_eq EventScript_FoundSingleItem
	compare VAR_0x8006, 1
	call_if_ne EventScript_FoundMultipleItems
	waitfanfare
	waitmessage
	msgbox Text_PutItemAway
	special SetHiddenItemFlag
	releaseall
	end

EventScript_FoundSingleItem::
	message Text_FoundOneItem
	return

EventScript_FoundCoins::
	getnumberstring 0, VAR_0x8006
	message Text_FoundXCoins
	return

EventScript_FoundMultipleItems::
	getnumberstring 0, VAR_0x8006
	message Text_FoundXItems
	return

EventScript_NoRoomForHiddenItem::
	msgbox Text_FoundOneItem
	msgbox Text_TooBadBagFull
	setvar VAR_RESULT, 0
	releaseall
	end

EventScript_TryPickUpHiddenCoins::
	goto_if_unset FLAG_GOT_COIN_CASE, EventScript_NoCaseForHiddenCoins
	checkcoins VAR_RESULT
	specialvar VAR_RESULT, CheckAddCoins
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_HiddenCoinsButCaseIsFull
	addcoins VAR_0x8006
	getstdstring 1, STDSTRING_COINS
	call EventScript_PlayFanfareObtainedItem
	call EventScript_FoundCoins
	waitfanfare
	waitmessage
	msgbox Text_PutCoinsAwayInCoinCase
	special SetHiddenItemFlag
	releaseall
	end

EventScript_HiddenCoinsButCaseIsFull::
	getnumberstring 0, VAR_0x8006
	getstdstring 1, STDSTRING_COINS
	msgbox Text_FoundXCoins
	msgbox Text_CoinCaseIsFull
	setvar VAR_RESULT, 0
	releaseall
	end

EventScript_NoCaseForHiddenCoins::
	getnumberstring 0, VAR_0x8006
	getstdstring 1, STDSTRING_COINS
	msgbox Text_FoundXCoins
	msgbox Text_NothingToPutThemIn
	setvar VAR_RESULT, 0
	releaseall
	end
