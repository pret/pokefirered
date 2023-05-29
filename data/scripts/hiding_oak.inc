HidingOak_EventScript_HideAllOaks::
	msgbox HidingOak_Text_HideAllOaks, MSGBOX_SIGN
	playfanfare MUS_OBTAIN_KEY_ITEM
    setflag FLAG_0x0B0
	setflag FLAG_0x0B1
	setflag FLAG_0x0B2
    setflag FLAG_0x0B3
    setflag FLAG_0x0B4
	warp MAP_PALLET_TOWN, 8, 16
	end

HidingOak_EventScript_SpawnOaks::
	msgbox HidingOak_Text_SpawnOaks, MSGBOX_SIGN
	playfanfare MUS_OBTAIN_KEY_ITEM
	random 5
	call_if_eq VAR_RESULT, 0, HidingOak_EventScript_SpawnOak_1
	call_if_eq VAR_RESULT, 1, HidingOak_EventScript_SpawnOak_2
	call_if_eq VAR_RESULT, 2, HidingOak_EventScript_SpawnOak_3
    call_if_eq VAR_RESULT, 3, HidingOak_EventScript_SpawnOak_4
    call_if_eq VAR_RESULT, 4, HidingOak_EventScript_SpawnOak_5
	warp MAP_PALLET_TOWN, 8, 16
	end

HidingOak_EventScript_SpawnOak_1::
	clearflag FLAG_0x0B0
	return

HidingOak_EventScript_SpawnOak_2::
	clearflag FLAG_0x0B1
	return

HidingOak_EventScript_SpawnOak_3::
	clearflag FLAG_0x0B2
	return

HidingOak_EventScript_SpawnOak_4::
	clearflag FLAG_0x0B3
	return

HidingOak_EventScript_SpawnOak_5::
	clearflag FLAG_0x0B4
	return

HidingOak_EventScript_FoundOak_1::
    msgbox HidingOak_Text_ClearedOak, MSGBOX_NPC
	msgbox HidingOak_Text_SecretPhrase_1, MSGBOX_NPC
	end

HidingOak_EventScript_FoundOak_2::
    msgbox HidingOak_Text_ClearedOak, MSGBOX_NPC
	msgbox HidingOak_Text_SecretPhrase_2, MSGBOX_NPC
	end

HidingOak_EventScript_FoundOak_3::
    msgbox HidingOak_Text_ClearedOak, MSGBOX_NPC
	msgbox HidingOak_Text_SecretPhrase_3, MSGBOX_NPC
	end

HidingOak_EventScript_FoundOak_4::
    msgbox HidingOak_Text_ClearedOak, MSGBOX_NPC
	msgbox HidingOak_Text_SecretPhrase_4, MSGBOX_NPC
	end

HidingOak_EventScript_FoundOak_5::
    msgbox HidingOak_Text_ClearedOak, MSGBOX_NPC
	msgbox HidingOak_Text_SecretPhrase_5, MSGBOX_NPC
	end
