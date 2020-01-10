FuchsiaCity_House2_MapScripts:: @ 816D816
	.byte 0

FuchsiaCity_House2_EventScript_16D817:: @ 816D817
	lock
	faceplayer
	goto_if_set FLAG_GOT_GOOD_ROD, EventScript_16D83F
	msgbox gUnknown_819918E, MSGBOX_YESNO
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16D849
	msgbox gUnknown_8199337
	release
	end

EventScript_16D83F:: @ 816D83F
	msgbox gUnknown_8199354
	release
	end

EventScript_16D849:: @ 816D849
	msgbox gUnknown_8199207
	checkitemspace ITEM_GOOD_ROD, 1
	compare VAR_RESULT, 0
	goto_if_eq EventScript_16D88A
	giveitem_msg gUnknown_819925E, ITEM_GOOD_ROD
	msgbox gUnknown_8199296
	setflag FLAG_GOT_GOOD_ROD
	release
	end

EventScript_16D88A:: @ 816D88A
	msgbox gUnknown_819937E
	release
	end
