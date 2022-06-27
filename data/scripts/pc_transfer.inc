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
	bufferboxname 0, VAR_PC_BOX_TO_SEND_MON
	getspeciesname 1, VAR_TEMP_1
	call_if_unset FLAG_SYS_NOT_SOMEONES_PC, EventScript_TransferredSomeonesPC
	call_if_set FLAG_SYS_NOT_SOMEONES_PC, EventScript_TransferredBillsPC
	return

EventScript_TransferredSomeonesPC::
	specialvar VAR_RESULT, ShouldShowBoxWasFullMessage
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_TransferredSomeonesPCBoxFull
	msgbox Text_MonSentToBoxInSomeonesPC
	return

EventScript_TransferredSomeonesPCBoxFull::
	specialvar VAR_RESULT, GetPCBoxToSendMon
	bufferboxname 2, VAR_RESULT
	msgbox Text_MonSentToBoxSomeonesBoxFull
	return

EventScript_TransferredBillsPC::
	specialvar VAR_RESULT, ShouldShowBoxWasFullMessage
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_TransferredBillsPCBoxFull
	msgbox Text_MonSentToBoxInBillsPC
	return

EventScript_TransferredBillsPCBoxFull::
	specialvar VAR_RESULT, GetPCBoxToSendMon
	bufferboxname 2, VAR_RESULT
	msgbox Text_MonSentToBoxBillsBoxFull
	return
