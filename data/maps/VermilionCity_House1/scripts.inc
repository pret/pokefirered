VermilionCity_House1_MapScripts:: @ 816B3A6
	.byte 0

VermilionCity_House1_EventScript_16B3A7:: @ 816B3A7
	lock
	faceplayer
	checkflag FLAG_0x240
	goto_if_eq EventScript_16B3CF
	msgbox gUnknown_8193EC1, MSGBOX_YESNO
	compare_var_to_value VAR_RESULT, 1
	goto_if_eq EventScript_16B3D9
	msgbox gUnknown_8194028
	release
	end

EventScript_16B3CF:: @ 816B3CF
	msgbox gUnknown_8194045
	release
	end

EventScript_16B3D9:: @ 816B3D9
	checkitemspace ITEM_OLD_ROD, 1
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_16B41A
	additem ITEM_OLD_ROD, 1
	msgbox gUnknown_8193F2A
	giveitemfanfaremsg gUnknown_8193F81, ITEM_OLD_ROD
	setflag FLAG_0x240
	msgbox gUnknown_8193FAF
	release
	end

EventScript_16B41A:: @ 816B41A
	msgbox gUnknown_819406F
	release
	end
