EventScript_GetGiftMonPartySlot::
	getpartysize
	subvar VAR_RESULT, 1
	copyvar VAR_0x8004, VAR_RESULT
	return

EventScript_NameReceivedBoxMon::
	fadescreen FADE_TO_BLACK
	special ChangeBoxPokemonNickname
	waitstate
	lock
	faceplayer
	return

EventScript_TransferredToPC::
	bufferboxname STR_VAR_1, VAR_PC_BOX_TO_SEND_MON
	bufferspeciesname STR_VAR_2, VAR_TEMP_1
	call_if_unset FLAG_SYS_NOT_SOMEONES_PC, EventScript_TransferredSomeonesPC
	call_if_set FLAG_SYS_NOT_SOMEONES_PC, EventScript_TransferredBillsPC
	return

EventScript_TransferredSomeonesPC::
	specialvar VAR_RESULT, ShouldShowBoxWasFullMessage
	goto_if_eq VAR_RESULT, TRUE, EventScript_TransferredSomeonesPCBoxFull
	msgbox gText_PkmnTransferredSomeonesPC
	return

EventScript_TransferredSomeonesPCBoxFull::
	specialvar VAR_RESULT, GetPCBoxToSendMon
	bufferboxname STR_VAR_3, VAR_RESULT
	msgbox gText_PkmnTransferredSomeonesPCBoxFull
	return

EventScript_TransferredBillsPC::
	specialvar VAR_RESULT, ShouldShowBoxWasFullMessage
	goto_if_eq VAR_RESULT, TRUE, EventScript_TransferredBillsPCBoxFull
	msgbox gText_PkmnTransferredBillsPC
	return

EventScript_TransferredBillsPCBoxFull::
	specialvar VAR_RESULT, GetPCBoxToSendMon
	bufferboxname STR_VAR_3, VAR_RESULT
	msgbox gText_PkmnTransferredBillsPCBoxFull
	return
