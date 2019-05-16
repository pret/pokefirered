FuchsiaCity_Building1_MapScripts:: @ 816D74B
	.byte 0

FuchsiaCity_Building1_EventScript_16D74C:: @ 816D74C
	lock
	faceplayer
	checkflag FLAG_0x23A
	goto_if 1, EventScript_16D7FA
	checkflag FLAG_0x189
	goto_if 1, EventScript_16D780
	msgbox gUnknown_8198DF9, 5
	compare_var_to_value VAR_RESULT, 1
	call_if 1, EventScript_16D7E8
	compare_var_to_value VAR_RESULT, 0
	call_if 1, EventScript_16D7F1
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
	compare_var_to_value VAR_RESULT, 0
	call_if 1, EventScript_16D7D6
	compare_var_to_value VAR_RESULT, 1
	call_if 1, EventScript_16D7DF
	additem ITEM_HM04, 1
	giveitemfanfaremsg gUnknown_8199068, ITEM_HM04
	setflag FLAG_0x23A
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
