Std_MsgboxNPC:: @ 81A4E3F
	lock
	faceplayer
	message 0x0
	waitmessage
	waitbuttonpress
	release
	return

Std_MsgboxSign:: @ 81A4E4A
	lockall
	message 0x0
	waitmessage
	waitbuttonpress
	releaseall
	return

Std_MsgboxDefault:: @ 81A4E54
	message 0x0
	waitmessage
	waitbuttonpress
	return

Std_MsgboxYesNo:: @ 81A4E5C
	message 0x0
	waitmessage
	yesnobox 20, 8
	return

Std_ReceivedItem:: @ 81A4E66
	textcolor 3
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

EventScript_ReceivedItemFanfare1:: @ 81A4EA2
	playfanfare MUS_LEVEL_UP
	return

EventScript_ReceivedItemFanfare2:: @ 81A4EA6
	playfanfare MUS_OBTAIN_KEY_ITEM
	return

EventScript_ReceivedItemWaitFanfare:: @ 81A4EAA
	delay 50
	return

EventScript_UnusedReturn:: @ 81A4EAE
	return

EventScript_AskSaveGame:: @ 81A4EAF
	special Field_AskSaveTheGame
	waitstate
	return
