@ Unused, handled by textcolor script cmd
EventScript_SaveTextColor::
	copyvar VAR_PREV_TEXT_COLOR, VAR_TEXT_COLOR
	return

EventScript_RestorePrevTextColor::
	copyvar VAR_TEXT_COLOR, VAR_PREV_TEXT_COLOR
	return

Std_ObtainItem::
	copyvar VAR_PREV_TEXT_COLOR, VAR_TEXT_COLOR
	textcolor 3
	additem VAR_0x8000, VAR_0x8001
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_ObtainItemMessage
	copyvar VAR_TEXT_COLOR, VAR_PREV_TEXT_COLOR
	return

EventScript_ObtainItemMessage::
	bufferitemnameplural 1, VAR_0x8000, VAR_0x8001
	checkitemtype VAR_0x8000
	call EventScript_BufferPocketNameTryFanfare
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_ObtainedItem
	compare VAR_0x8007, FALSE
	call_if_eq EventScript_NoRoomForItem
	return

EventScript_BufferPocketNameTryFanfare::
	switch VAR_RESULT
	case POCKET_ITEMS, EventScript_BufferItemsPocket
	case POCKET_KEY_ITEMS, EventScript_BufferKeyItemsPocket
	case POCKET_POKE_BALLS, EventScript_BufferPokeBallsPocket
	case POCKET_TM_CASE, EventScript_BufferTMCase
	case POCKET_BERRY_POUCH, EventScript_BufferBerryPouch
	end

EventScript_BufferItemsPocket::
	getstdstring 2, STDSTRING_ITEMS_POCKET
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferKeyItemsPocket::
	getstdstring 2, STDSTRING_KEY_ITEMS_POCKET
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferPokeBallsPocket::
	getstdstring 2, STDSTRING_POKEBALLS_POCKET
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferTMCase::
	getstdstring 2, STDSTRING_TM_CASE
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedTMHM
	return

EventScript_BufferBerryPouch::
	getstdstring 2, STDSTRING_BERRY_POUCH
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_ObtainedItem::
	message Text_ObtainedTheX
	waitfanfare
	waitmessage
	msgbox Text_PutItemAway
	setvar VAR_RESULT, 1
	return

EventScript_NoRoomForItem::
	setvar VAR_RESULT, FALSE
	return

EventScript_PlayFanfareObtainedItem::
	playfanfare MUS_LEVEL_UP
	return

EventScript_PlayFanfareObtainedTMHM::
	playfanfare MUS_LEVEL_UP
	return

Std_ObtainDecoration::
	adddecor VAR_0x8000
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_ObtainDecorMessage
	return

EventScript_ObtainDecorMessage::
	getdecorname 1, VAR_0x8000
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_ObtainedDecor
	compare VAR_0x8007, FALSE
	call_if_eq EventScript_NoRoomForDecor
	return

EventScript_ObtainedDecor::
	playfanfare MUS_OBTAIN_ITEM
	message Text_ObtainedTheDecor
	waitfanfare
	waitmessage
	msgbox Text_DecorTransferredToPC
	setvar VAR_RESULT, TRUE
	return

EventScript_NoRoomForDecor::
	setvar VAR_RESULT, FALSE
	return

Std_FindItem::
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

EventScript_PickUpItem::
	removeobject VAR_LAST_TALKED
	additem VAR_0x8004, VAR_0x8005
	specialvar VAR_RESULT, BufferTMHMMoveName
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_0x8008, TRUE
	call_if_eq EventScript_FoundTMHM
	compare VAR_0x8008, FALSE
	call_if_eq EventScript_FoundItem
	waitfanfare
	waitmessage
	msgbox Text_PutItemAway
	return

EventScript_FoundTMHM::
	message Text_FoundTMHMContainsMove
	return

EventScript_FoundItem::
	message Text_FoundOneItem
	return

EventScript_NoRoomToPickUpItem::
	msgbox Text_ObtainedTheX
	msgbox Text_TooBadBagFull
	setvar VAR_RESULT, FALSE
	return

EventScript_HiddenItemScript::
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
