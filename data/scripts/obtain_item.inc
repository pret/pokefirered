@ Unused, handled by textcolor script cmd
EventScript_SaveTextColor::
	copyvar VAR_PREV_TEXT_COLOR, VAR_TEXT_COLOR
	return

EventScript_RestorePrevTextColor::
	copyvar VAR_TEXT_COLOR, VAR_PREV_TEXT_COLOR
	return

Std_ObtainItem::
	copyvar VAR_PREV_TEXT_COLOR, VAR_TEXT_COLOR
	textcolor NPC_TEXT_COLOR_NEUTRAL
	additem VAR_0x8000, VAR_0x8001
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_ObtainItemMessage
	copyvar VAR_TEXT_COLOR, VAR_PREV_TEXT_COLOR
	return

EventScript_ObtainItemMessage::
	bufferitemnameplural STR_VAR_2, VAR_0x8000, VAR_0x8001
	checkitemtype VAR_0x8000
	call EventScript_BufferPocketNameTryFanfare
	call_if_eq VAR_0x8007, TRUE, EventScript_ObtainedItem
	call_if_eq VAR_0x8007, FALSE, EventScript_NoRoomForItem
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
	bufferstdstring STR_VAR_3, STDSTRING_ITEMS_POCKET
	call_if_eq VAR_0x8007, TRUE, EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferKeyItemsPocket::
	bufferstdstring STR_VAR_3, STDSTRING_KEY_ITEMS_POCKET
	call_if_eq VAR_0x8007, TRUE, EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferPokeBallsPocket::
	bufferstdstring STR_VAR_3, STDSTRING_POKEBALLS_POCKET
	call_if_eq VAR_0x8007, TRUE, EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferTMCase::
	bufferstdstring STR_VAR_3, STDSTRING_TM_CASE
	call_if_eq VAR_0x8007, TRUE, EventScript_PlayFanfareObtainedTMHM
	return

EventScript_BufferBerryPouch::
	bufferstdstring STR_VAR_3, STDSTRING_BERRY_POUCH
	call_if_eq VAR_0x8007, TRUE, EventScript_PlayFanfareObtainedItem
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
	adddecoration VAR_0x8000
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_ObtainDecorMessage
	return

EventScript_ObtainDecorMessage::
	bufferdecorationname STR_VAR_2, VAR_0x8000
	call_if_eq VAR_0x8007, TRUE, EventScript_ObtainedDecor
	call_if_eq VAR_0x8007, FALSE, EventScript_NoRoomForDecor
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
	bufferitemname STR_VAR_2, VAR_0x8000
	checkitemtype VAR_0x8000
	call EventScript_BufferPocketNameTryFanfare
	call_if_eq VAR_0x8007, TRUE, EventScript_PickUpItem
	call_if_eq VAR_0x8007, FALSE, EventScript_NoRoomToPickUpItem
	release
	return

EventScript_PickUpItem::
	removeobject VAR_LAST_TALKED
	additem VAR_0x8004, VAR_0x8005
	specialvar VAR_RESULT, BufferTMHMMoveName
	copyvar VAR_0x8008, VAR_RESULT
	call_if_eq VAR_0x8008, TRUE, EventScript_FoundTMHM
	call_if_eq VAR_0x8008, FALSE, EventScript_FoundItem
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
	textcolor NPC_TEXT_COLOR_NEUTRAL
	waitse
	goto_if_eq VAR_0x8005, 0, EventScript_TryPickUpHiddenCoins
	call EventScript_TryPickUpHiddenItem
	goto_if_eq VAR_0x8007, TRUE, EventScript_PickedUpHiddenItem
	goto_if_eq VAR_0x8007, FALSE, EventScript_NoRoomForHiddenItem
	end

EventScript_TryPickUpHiddenItem::
	additem VAR_0x8005, VAR_0x8006
	copyvar VAR_0x8007, VAR_RESULT
	bufferitemname STR_VAR_2, VAR_0x8005
	checkitemtype VAR_0x8005
	call EventScript_BufferPocketNameTryFanfare
	return

EventScript_PickedUpHiddenItem::
	call_if_eq VAR_0x8006, 1, EventScript_FoundSingleItem
	call_if_ne VAR_0x8006, 1, EventScript_FoundMultipleItems
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
	buffernumberstring STR_VAR_1, VAR_0x8006
	message Text_FoundXCoins
	return

EventScript_FoundMultipleItems::
	buffernumberstring STR_VAR_1, VAR_0x8006
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
	goto_if_eq VAR_RESULT, FALSE, EventScript_HiddenCoinsButCaseIsFull
	addcoins VAR_0x8006
	bufferstdstring STR_VAR_2, STDSTRING_COINS
	call EventScript_PlayFanfareObtainedItem
	call EventScript_FoundCoins
	waitfanfare
	waitmessage
	msgbox Text_PutCoinsAwayInCoinCase
	special SetHiddenItemFlag
	releaseall
	end

EventScript_HiddenCoinsButCaseIsFull::
	buffernumberstring STR_VAR_1, VAR_0x8006
	bufferstdstring STR_VAR_2, STDSTRING_COINS
	msgbox Text_FoundXCoins
	msgbox Text_CoinCaseIsFull
	setvar VAR_RESULT, 0
	releaseall
	end

EventScript_NoCaseForHiddenCoins::
	buffernumberstring STR_VAR_1, VAR_0x8006
	bufferstdstring STR_VAR_2, STDSTRING_COINS
	msgbox Text_FoundXCoins
	msgbox Text_NothingToPutThemIn
	setvar VAR_RESULT, 0
	releaseall
	end
