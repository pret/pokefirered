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

gStdScript_ItemMessageAndFanfare:: @ 81A4E66
	textcolor 3
	compare VAR_0x8002, MUS_FANFA1
	call_if eq, EventScript_1A4EA2
	compare VAR_0x8002, MUS_FAN5
	call_if eq, EventScript_1A4EA6
	message 0x0
	waitmessage
	waitfanfare
	compare VAR_0x8002, MUS_FANFA1
	call_if eq, EventScript_1A4EAA
	putitemaway VAR_0x8000, VAR_0x8001
	call EventScript_1A6675
	return

EventScript_1A4EA2:: @ 81A4EA2
	playfanfare MUS_FANFA1
	return

EventScript_1A4EA6:: @ 81A4EA6
	playfanfare MUS_FAN5
	return

EventScript_1A4EAA:: @ 81A4EAA
	delay 50
	return

EventScript_UnusedReturn:: @ 81A4EAE
	return

EventScript_1A4EAF:: @ 81A4EAF
	special Field_AskSaveTheGame
	waitstate
	return
