Route2_EastBuilding_MapScripts:: @ 816F67E
	.byte 0

Route2_EastBuilding_EventScript_16F67F:: @ 816F67F
	lock
	faceplayer
	call EventScript_16F70B
	goto_if_set FLAG_GOT_HM05, EventScript_16F701
	msgbox gUnknown_819D64F, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A7AD1
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, Special_GetPokedexCount
	getnumberstring 2, VAR_0x8006
	call EventScript_16F70B
	compare VAR_0x8006, 10
	goto_if_lt EventScript_1A7ABD
	msgbox gUnknown_819D74E
	checkitemspace ITEM_HM05, 1
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1A7AC7
	giveitem_msg gUnknown_819D7A1, ITEM_HM05
	setflag FLAG_GOT_HM05
	msgbox gUnknown_819D7C1
	release
	end

EventScript_16F701:: @ 816F701
	msgbox gUnknown_819D7C1
	release
	end

EventScript_16F70B:: @ 816F70B
	getnumberstring 0, 10
	getitemname 1, ITEM_HM05
	return

Route2_EastBuilding_EventScript_16F714:: @ 816F714
	msgbox gUnknown_819D81E, MSGBOX_NPC
	end
