Std_MsgboxNPC::
	lock
	faceplayer
	message 0x0
	waitmessage
	waitbuttonpress
	release
	return

Std_MsgboxSign::
	lockall
	message 0x0
	waitmessage
	waitbuttonpress
	releaseall
	return

Std_MsgboxDefault::
	message 0x0
	waitmessage
	waitbuttonpress
	return

Std_MsgboxYesNo::
	message 0x0
	waitmessage
	yesnobox 20, 8
	return

Std_ReceivedItem::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	compare VAR_0x8002, MUS_LEVEL_UP
	call_if_eq EventScript_ReceivedItemFanfare1
	compare VAR_0x8002, MUS_OBTAIN_KEY_ITEM
	call_if_eq EventScript_ReceivedItemFanfare2
	message 0x0
	waitmessage
	waitfanfare
	compare VAR_0x8002, MUS_LEVEL_UP
	call_if_eq EventScript_ReceivedItemWaitFanfare
	putitemaway VAR_0x8000, VAR_0x8001
	call EventScript_RestorePrevTextColor
	return

EventScript_ReceivedItemFanfare1::
	playfanfare MUS_LEVEL_UP
	return

EventScript_ReceivedItemFanfare2::
	playfanfare MUS_OBTAIN_KEY_ITEM
	return

EventScript_ReceivedItemWaitFanfare::
	delay 50
	return

EventScript_UnusedReturn::
	return

EventScript_AskSaveGame::
	special Field_AskSaveTheGame
	waitstate
	return
