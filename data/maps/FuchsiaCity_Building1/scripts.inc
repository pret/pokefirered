FuchsiaCity_Building1_MapScripts:: @ 816D74B
	.byte 0

FuchsiaCity_Building1_EventScript_16D74C:: @ 816D74C
	lock
	faceplayer
	goto_if_set FLAG_GOT_HM04, EventScript_16D7FA
	goto_if_set FLAG_HIDE_SAFARI_ZONE_WEST_GOLD_TEETH, EventScript_16D780
	msgbox gUnknown_8198DF9, MSGBOX_YESNO
	compare VAR_RESULT, 1
	call_if_eq EventScript_16D7E8
	compare VAR_RESULT, 0
	call_if_eq EventScript_16D7F1
	release
	end

EventScript_16D780:: @ 816D780
	textcolor 3
	playfanfare MUS_ME_WAZA
	message Text_198E84
	waitmessage
	waitfanfare
	msgbox gUnknown_8198EAA
	call EventScript_1A6675
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq EventScript_16D7D6
	compare VAR_RESULT, 1
	call_if_eq EventScript_16D7DF
	giveitem_msg gUnknown_8199068, ITEM_HM04
	setflag FLAG_GOT_HM04
	removeitem ITEM_GOLD_TEETH, 1
	release
	end

EventScript_16D7D6:: @ 816D7D6
	msgbox gUnknown_8198ECA
	return

EventScript_16D7DF:: @ 816D7DF
	msgbox gUnknown_8198F96
	return

EventScript_16D7E8:: @ 816D7E8
	msgbox gUnknown_8198E3F
	return

EventScript_16D7F1:: @ 816D7F1
	msgbox gUnknown_8198E63
	return

EventScript_16D7FA:: @ 816D7FA
	msgbox gUnknown_819908A
	release
	end

FuchsiaCity_Building1_EventScript_16D804:: @ 816D804
	msgbox gUnknown_819913C, 3
	end

FuchsiaCity_Building1_EventScript_16D80D:: @ 816D80D
	msgbox gUnknown_8199167, 3
	end
