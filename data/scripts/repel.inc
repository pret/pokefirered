EventScript_RepelWoreOff:: @ 81BFB65
	msgbox Text_RepelWoreOff, MSGBOX_SIGN
	checkitem ITEM_REPEL, 1
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_RepelWoreOff_AskAnother
	checkitem ITEM_SUPER_REPEL, 1
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_RepelWoreOff_AskAnother
	checkitem ITEM_MAX_REPEL, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_RepelWoreOff_End
EventScript_RepelWoreOff_AskAnother::
        msgbox Text_RepelAskAnother, MSGBOX_YESNO
        closemessage
	compare VAR_RESULT, 0
	goto_if_eq EventScript_RepelWoreOff_End
	callnative DrawRepelMultichoiseMenu
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_RepelWoreOff_Chose
	waitstate
	compare VAR_RESULT, 127
	goto_if_eq EventScript_RepelWoreOff_End
EventScript_RepelWoreOff_Chose:
	callnative HandleRepelUseAnother
	bufferitemname 1, VAR_0x8004
	removeitem VAR_0x8004, 1
	playse SE_REPEL
	msgbox gUnknown_841658C, MSGBOX_SIGN
EventScript_RepelWoreOff_End::
	end

EventScript_Honey::
        callnative FldEff_TryStartWildBattle
	compare VAR_0x8000, FALSE
	goto_if_ne EventScript_HoneyEnd
	msgbox Text_NoMonHere, MSGBOX_AUTOCLOSE
EventScript_HoneyEnd::
	release
	end

Text_RepelWoreOff:: @ 81BFB6E
	.string "REPEL's effect wore off…$"
	
Text_RepelAskAnother::
	.string "Would you like to use another one?$"
	
Text_NoMonHere::
        .string "Theres no mon in this place…$"
