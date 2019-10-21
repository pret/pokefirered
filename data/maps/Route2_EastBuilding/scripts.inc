Route2_EastBuilding_MapScripts:: @ 816F67E
	.byte 0

Route2_EastBuilding_EventScript_16F67F:: @ 816F67F
	lock
	faceplayer
	call EventScript_16F70B
	checkflag FLAG_GOT_HM05
	goto_if_eq EventScript_16F701
	msgbox gUnknown_819D64F, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_1A7AD1
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, Special_GetPokedexCount
	getnumberstring 2, VAR_0x8006
	call EventScript_16F70B
	compare_var_to_value VAR_0x8006, 10
	goto_if 0, EventScript_1A7ABD
	msgbox gUnknown_819D74E
	checkitemspace ITEM_HM05, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_1A7AC7
	additem ITEM_HM05, 1
	giveitemfanfaremsg gUnknown_819D7A1, ITEM_HM05
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
	msgbox gUnknown_819D81E, 2
	end
